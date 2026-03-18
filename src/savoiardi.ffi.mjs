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

export {
  Result$Ok,
  Result$Error,
  Option$Some,
  Option$None,
  Option$isSome,
  Option$Some$0,
};

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
export function dispose_material(material) {
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
 * Recursively dispose an `Object3D` subtree.
 * @param {import("three").Object3D & Record<string, any>} object
 * @returns {void}
 */
export function dispose_object3d(object) {
  if (!object) return;

  if (object.geometry) {
    object.geometry.dispose();
  }

  if (object.material) {
    if (Array.isArray(object.material)) {
      object.material.forEach((material) => dispose_material(material));
    } else {
      dispose_material(object.material);
    }
  }

  if (object.children) {
    for (const child of object.children) {
      dispose_object3d(child);
    }
  }
}

/**
 * @param {import("three").Loader} loader
 * @param {string} url
 * @returns {Promise<any>}
 */
export function loadAsync(loader, url) {
  return loader.loadAsync(url, undefined);
}

/**
 * @param {import("three").Loader} loader
 * @param {string} url
 * @param {(gltf: any) => void} onLoad
 * @param {() => void} onError
 * @returns {void}
 */
export function load(loader, url, onLoad, onError) {
  loader.load(url, onLoad, undefined, () => onError());
}
