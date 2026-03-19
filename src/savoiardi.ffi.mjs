/**
 * Shared JS helpers for Savoiardi's FFI layer.
 */

import { Result$Ok, Result$Error } from "./gleam.mjs";
import { Vec3$Vec3 } from "../vec/vec/vec3.mjs";
import { Quaternion$Quaternion } from "../quaterni/quaternion.mjs";
import {
  Option$Some,
  Option$None,
  Option$isSome,
  Option$Some$0,
} from "../gleam_stdlib/gleam/option.mjs";
import {
  LoadError$EmptyUrl,
  LoadError$HttpError,
  LoadError$InvalidUrl,
  LoadError$ParseError,
  LoadError$ResourceError,
  LoadError$LoadFailure,
} from "./savoiardi.mjs";

function error_message(error) {
  if (error instanceof Error) {
    return error.message;
  }

  if (typeof error === "string") {
    return error;
  }

  try {
    return JSON.stringify(error);
  } catch {
    return String(error);
  }
}

function has_empty_url(url) {
  if (typeof url === "string") {
    return url.trim() === "";
  }

  if (Array.isArray(url)) {
    return url.some((entry) => typeof entry === "string" && entry.trim() === "");
  }

  return false;
}

function first_url_value(url) {
  if (typeof url === "string") {
    return url;
  }

  if (Array.isArray(url)) {
    return url.find((entry) => typeof entry === "string") ?? "";
  }

  return "";
}

function is_invalid_url_message(message) {
  return (
    message.includes("Failed to parse URL") ||
    message.includes("Invalid URL") ||
    message.includes("Only absolute URLs are supported")
  );
}

function load_error(url, reason) {
  const message = error_message(reason);

  if (
    reason &&
    typeof reason === "object" &&
    "response" in reason &&
    reason.response &&
    typeof reason.response.status === "number"
  ) {
    return LoadError$HttpError(
      first_url_value(url),
      reason.response.status,
      reason.response.statusText ?? "",
    );
  }

  if (
    reason &&
    typeof reason === "object" &&
    "type" in reason &&
    reason.type === "error"
  ) {
    return LoadError$ResourceError(first_url_value(url));
  }

  if (reason instanceof SyntaxError) {
    return LoadError$ParseError(message);
  }

  if (is_invalid_url_message(message)) {
    return LoadError$InvalidUrl(first_url_value(url), message);
  }

  return LoadError$LoadFailure(message);
}

/**
 * Identity cast helper for compatible opaque types.
 * @template T
 * @param {T} value
 * @returns {T}
 */
export function identity(value) {
  return value;
}

/**
 * Convert a Three.js vector-like object to Gleam's `Vec3`.
 * @param {{ x: number, y: number, z: number }} value
 * @returns {import("../build/dev/javascript/vec/vec/vec3.mjs").Vec3}
 */
export function vec3_from_three(value) {
  return Vec3$Vec3(value.x, value.y, value.z);
}

/**
 * Convert a Three.js quaternion-like object to Gleam's `Quaternion`.
 * @param {{ x: number, y: number, z: number, w: number }} value
 * @returns {import("../build/dev/javascript/quaterni/quaternion.mjs").Quaternion}
 */
export function quaternion_from_three(value) {
  return Quaternion$Quaternion(value.x, value.y, value.z, value.w);
}

/**
 * Convert a nullable JS value into a Gleam `Option`.
 * @template T
 * @param {T | null | undefined} value
 * @returns {import("../build/dev/javascript/gleam_stdlib/gleam/option.mjs").Some | import("../build/dev/javascript/gleam_stdlib/gleam/option.mjs").None}
 */
export function option_from_nullable(value) {
  return value == null ? Option$None() : Option$Some(value);
}

/**
 * Convert a Gleam `Option` into a nullable JS value.
 * @template T
 * @param {any} value
 * @returns {T | null}
 */
export function option_to_nullable(value) {
  return Option$isSome(value) ? Option$Some$0(value) : null;
}

/**
 * Convert a nullable JS value into a Gleam `Result`.
 * @template T
 * @param {T | null | undefined} value
 * @returns {import("../build/dev/javascript/savoiardi/gleam.mjs").Ok | import("../build/dev/javascript/savoiardi/gleam.mjs").Error}
 */
export function result_from_nullable(value) {
  return value == null ? Result$Error() : Result$Ok(value);
}

/**
 * Dispose a material and any owned texture maps.
 * @param {import("three").Material & Record<string, any>} material
 * @returns {void}
 */
export function disposeMaterial(material) {
  if (!material) return;

  if (material.map) material.map.dispose();
  if (material.lightMap) material.lightMap.dispose();
  if (material.bumpMap) material.bumpMap.dispose();
  if (material.normalMap) material.normalMap.dispose();
  if (material.specularMap) material.specularMap.dispose();
  if (material.envMap) material.envMap.dispose();
  if (material.alphaMap) material.alphaMap.dispose();
  if (material.aoMap) material.aoMap.dispose();
  if (material.displacementMap) material.displacementMap.dispose();
  if (material.emissiveMap) material.emissiveMap.dispose();
  if (material.gradientMap) material.gradientMap.dispose();
  if (material.metalnessMap) material.metalnessMap.dispose();
  if (material.roughnessMap) material.roughnessMap.dispose();
  material.dispose();
}


/**
 * @param {import("three").Loader} loader
 * @param {string} url
 * @returns {Promise<any>}
 */
export async function loadAsync(loader, url) {
  if (has_empty_url(url)) {
    return Result$Error(LoadError$EmptyUrl());
  }

  try {
    return loader
      .loadAsync(url, undefined)
      .then((value) => Result$Ok(value))
      .catch((reason) => Result$Error(load_error(url, reason)));
  } catch (reason) {
    return Result$Error(LoadError$InvalidUrl(first_url_value(url), error_message(reason)));
  }
}

/**
 * @param {import("three").Loader} loader
 * @param {string} url
 * @param {(result: any) => void} onResult
 * @returns {void}
 */
export function load(loader, url, onResult) {
  if (has_empty_url(url)) {
    onResult(Result$Error(LoadError$EmptyUrl()));
    return;
  }

  try {
    loader.load(
      url,
      (value) => onResult(Result$Ok(value)),
      undefined,
      (reason) => onResult(Result$Error(load_error(url, reason))),
    );
  } catch (reason) {
    onResult(
      Result$Error(
        LoadError$InvalidUrl(first_url_value(url), error_message(reason)),
      ),
    );
  }
}
