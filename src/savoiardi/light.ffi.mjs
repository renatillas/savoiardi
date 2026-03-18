import * as THREE from "three";
export { identity } from "../savoiardi.ffi.mjs";

/** @param {number} color @param {number} intensity @returns {THREE.AmbientLight} */
export function createAmbientLight(color, intensity) {
  return new THREE.AmbientLight(color, intensity);
}

/** @param {number} color @param {number} intensity @returns {THREE.DirectionalLight} */
export function createDirectionalLight(color, intensity) {
  return new THREE.DirectionalLight(color, intensity);
}

/** @param {number} color @param {number} intensity @param {number} distance @returns {THREE.PointLight} */
export function createPointLight(color, intensity, distance) {
  return new THREE.PointLight(color, intensity, distance);
}

/** @param {number} color @param {number} intensity @param {number} distance @param {number} angle @param {number} penumbra @returns {THREE.SpotLight} */
export function createSpotLight(color, intensity, distance, angle, penumbra) {
  return new THREE.SpotLight(color, intensity, distance, angle, penumbra);
}

/** @param {number} skyColor @param {number} groundColor @param {number} intensity @returns {THREE.HemisphereLight} */
export function createHemisphereLight(skyColor, groundColor, intensity) {
  return new THREE.HemisphereLight(skyColor, groundColor, intensity);
}

/** @param {THREE.Light} light @param {boolean} castShadow @returns {void} */
export function setLightCastShadow(light, castShadow) {
  light.castShadow = castShadow;
  return light;
}

/** @param {THREE.Light & { color?: THREE.Color }} light @param {number} color @returns {void} */
export function updateLightColor(light, color) {
  if (light.color) {
    light.color.setHex(color);
  }
  return light;
}

/** @param {THREE.Light} light @param {number} intensity @returns {void} */
export function updateLightIntensity(light, intensity) {
  light.intensity = intensity;
  return light;
}

/** @param {THREE.Object3D & { isLight?: boolean }} object @returns {boolean} */
export function isLight(object) {
  return object?.isLight === true;
}
