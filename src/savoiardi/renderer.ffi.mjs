import * as THREE from "three";

import {
  Option$isSome,
  Option$Some$0,
} from "../../gleam_stdlib/gleam/option.mjs";

/** @param {boolean} antialias @param {boolean} alpha @returns {THREE.WebGLRenderer} */
export function createRenderer(antialias, alpha) {
  return new THREE.WebGLRenderer({ antialias, alpha });
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} enabled @returns {THREE.WebGLRenderer} */
export function enableRendererShadowMap(renderer, enabled) {
  renderer.shadowMap.enabled = enabled;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  return renderer;
}

/** @returns {number} */
export function getNoToneMapping() {
  return THREE.NoToneMapping;
}

/** @returns {number} */
export function getLinearToneMapping() {
  return THREE.LinearToneMapping;
}

/** @returns {number} */
export function getReinhardToneMapping() {
  return THREE.ReinhardToneMapping;
}

/** @returns {number} */
export function getCineonToneMapping() {
  return THREE.CineonToneMapping;
}

/** @returns {number} */
export function getACESFilmicToneMapping() {
  return THREE.ACESFilmicToneMapping;
}

/** @returns {number} */
export function getAgXToneMapping() {
  return THREE.AgXToneMapping;
}

/** @returns {number} */
export function getNeutralToneMapping() {
  return THREE.NeutralToneMapping;
}

/** @returns {number} */
export function getBasicShadowMap() {
  return THREE.BasicShadowMap;
}

/** @returns {number} */
export function getPCFShadowMap() {
  return THREE.PCFShadowMap;
}

/** @returns {number} */
export function getVSMShadowMap() {
  return THREE.VSMShadowMap;
}

/** @param {THREE.WebGLRenderer} renderer @returns {HTMLCanvasElement} */
export function getRendererDomElement(renderer) {
  return renderer.domElement;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} width @param {number} height @returns {THREE.WebGLRenderer} */
export function setRendererSize(renderer, width, height) {
  renderer.setSize(width, height);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} pixelRatio @returns {THREE.WebGLRenderer} */
export function setPixelRatio(renderer, pixelRatio) {
  renderer.setPixelRatio(pixelRatio);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} width @param {number} height @param {number} pixelRatio @returns {THREE.WebGLRenderer} */
export function setDrawingBufferSize(renderer, width, height, pixelRatio) {
  renderer.setDrawingBufferSize(width, height, pixelRatio);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {THREE.Scene} scene @param {THREE.Camera} camera @returns {void} */
export function render(renderer, scene, camera) {
  renderer.render(scene, camera);
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} color @param {boolean} depth @param {boolean} stencil @returns {THREE.WebGLRenderer} */
export function clear(renderer, color, depth, stencil) {
  renderer.clear(color, depth, stencil);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @returns {THREE.WebGLRenderer} */
export function clearColor(renderer) {
  renderer.clearColor();
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @returns {THREE.WebGLRenderer} */
export function clearDepth(renderer) {
  renderer.clearDepth();
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @returns {THREE.WebGLRenderer} */
export function clearStencil(renderer) {
  renderer.clearStencil();
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} alpha @returns {THREE.WebGLRenderer} */
export function setClearAlpha(renderer, alpha) {
  renderer.setClearAlpha(alpha);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} color @param {number} alpha @returns {THREE.WebGLRenderer} */
export function setClearColor(renderer, color, alpha) {
  renderer.setClearColor(color, alpha);
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} autoClear @returns {THREE.WebGLRenderer} */
export function setAutoClear(renderer, autoClear) {
  renderer.autoClear = autoClear;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} autoClearColor @returns {THREE.WebGLRenderer} */
export function setAutoClearColor(renderer, autoClearColor) {
  renderer.autoClearColor = autoClearColor;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} autoClearDepth @returns {THREE.WebGLRenderer} */
export function setAutoClearDepth(renderer, autoClearDepth) {
  renderer.autoClearDepth = autoClearDepth;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {boolean} autoClearStencil @returns {THREE.WebGLRenderer} */
export function setAutoClearStencil(renderer, autoClearStencil) {
  renderer.autoClearStencil = autoClearStencil;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {string} outputColorSpace @returns {THREE.WebGLRenderer} */
export function setOutputColorSpace(renderer, outputColorSpace) {
  renderer.outputColorSpace = outputColorSpace;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} toneMapping @returns {THREE.WebGLRenderer} */
export function setToneMapping(renderer, toneMapping) {
  renderer.toneMapping = toneMapping;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} exposure @returns {THREE.WebGLRenderer} */
export function setToneMappingExposure(renderer, exposure) {
  renderer.toneMappingExposure = exposure;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} scale @returns {THREE.WebGLRenderer} */
export function setTransmissionResolutionScale(renderer, scale) {
  renderer.transmissionResolutionScale = scale;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {number} shadowMapType @returns {THREE.WebGLRenderer} */
export function setShadowMapType(renderer, shadowMapType) {
  renderer.shadowMap.type = shadowMapType;
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {THREE.Object3D} object @param {THREE.Camera} camera @param {any} targetScene @returns {void} */
export function compile(renderer, object, camera, targetScene) {
  renderer.compile(
    object,
    camera,
    Option$isSome(targetScene) ? Option$Some$0(targetScene) : null,
  );
}

/** @param {THREE.WebGLRenderer} renderer @param {THREE.Object3D} object @param {THREE.Camera} camera @param {any} targetScene @returns {Promise<void>} */
export function compileAsync(renderer, object, camera, targetScene) {
  return renderer.compileAsync(
    object,
    camera,
    Option$isSome(targetScene) ? Option$Some$0(targetScene) : null,
  );
}

/** @param {THREE.WebGLRenderer} renderer @returns {THREE.WebGLRenderer} */
export function resetState(renderer) {
  renderer.resetState();
  return renderer;
}

/** @param {THREE.WebGLRenderer} renderer @param {(timestamp: number) => void} onFrame @returns {THREE.WebGLRenderer} */
export function setAnimationLoop(renderer, onFrame) {
  renderer.setAnimationLoop(onFrame);
  return renderer;
}
