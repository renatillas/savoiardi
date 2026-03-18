import * as THREE from "three";
import { FBXLoader } from "three/addons/loaders/FBXLoader.js";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { FontLoader } from "three/addons/loaders/FontLoader.js";
import { OBJLoader } from "three/addons/loaders/OBJLoader.js";
import { STLLoader } from "three/addons/loaders/STLLoader.js";

/** @returns {THREE.TextureLoader} */
export function createTextureLoader() {
  return new THREE.TextureLoader();
}

/** @returns {THREE.CubeTextureLoader} */
export function createCubeTextureLoader() {
  return new THREE.CubeTextureLoader();
}

/** @returns {STLLoader} */
export function createSTLLoader() {
  return new STLLoader();
}

/** @returns {FontLoader} */
export function createFontLoader() {
  return new FontLoader();
}

/** @returns {GLTFLoader} */
export function createGLTFLoader() {
  return new GLTFLoader();
}

/** @returns {OBJLoader} */
export function createOBJLoader() {
  return new OBJLoader();
}

/** @returns {FBXLoader} */
export function createFBXLoader() {
  return new FBXLoader();
}
