import * as THREE from "three";
export { identity } from "../savoiardi.ffi.mjs";

/** @returns {THREE.Scene} */
export function createScene() {
  return new THREE.Scene();
}

/** @param {THREE.Scene} scene @param {number} color @returns {void} */
export function setSceneBackgroundColor(scene, color) {
  scene.background = new THREE.Color(color);
  return scene;
}

/** @param {THREE.Scene} scene @param {THREE.Texture} texture @returns {void} */
export function setSceneBackgroundTexture(scene, texture) {
  scene.background = texture;
  return scene;
}

/** @param {THREE.Scene} scene @param {THREE.CubeTexture} cubeTexture @returns {void} */
export function setSceneBackgroundCubeTexture(scene, cubeTexture) {
  scene.background = cubeTexture;
  return scene;
}

/** @param {THREE.Scene} scene @returns {void} */
export function clearSceneBackground(scene) {
  scene.background = null;
  return scene;
}

/** @param {THREE.Scene} scene @param {number} blurriness @returns {void} */
export function setSceneBackgroundBlurriness(scene, blurriness) {
  scene.backgroundBlurriness = blurriness;
  return scene;
}

/** @param {THREE.Scene} scene @param {number} intensity @returns {void} */
export function setSceneBackgroundIntensity(scene, intensity) {
  scene.backgroundIntensity = intensity;
  return scene;
}

/** @param {THREE.Scene} scene @param {THREE.Texture} texture @returns {void} */
export function setSceneEnvironmentTexture(scene, texture) {
  scene.environment = texture;
  return scene;
}

/** @param {THREE.Scene} scene @param {THREE.CubeTexture} cubeTexture @returns {void} */
export function setSceneEnvironmentCubeTexture(scene, cubeTexture) {
  scene.environment = cubeTexture;
  return scene;
}

/** @param {THREE.Scene} scene @returns {void} */
export function clearSceneEnvironment(scene) {
  scene.environment = null;
  return scene;
}

/** @param {THREE.Scene} scene @param {number} intensity @returns {void} */
export function setSceneEnvironmentIntensity(scene, intensity) {
  scene.environmentIntensity = intensity;
  return scene;
}

/** @param {THREE.Scene} scene @param {number} color @param {number} near @param {number} far @returns {void} */
export function setSceneFog(scene, color, near, far) {
  scene.fog = new THREE.Fog(color, near, far);
  return scene;
}

/** @param {THREE.Scene} scene @param {number} color @param {number} density @returns {void} */
export function setSceneFogExp2(scene, color, density) {
  scene.fog = new THREE.FogExp2(color, density);
  return scene;
}

/** @param {THREE.Scene} scene @returns {void} */
export function clearSceneFog(scene) {
  scene.fog = null;
  return scene;
}
