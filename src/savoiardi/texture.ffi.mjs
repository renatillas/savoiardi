import * as THREE from "three";

/** @returns {string} */
export function getSRGBColorSpace() {
  return THREE.SRGBColorSpace;
}

/** @returns {string} */
export function getLinearSRGBColorSpace() {
  return THREE.LinearSRGBColorSpace;
}

/** @returns {number} */
export function getUVMapping() {
  return THREE.UVMapping;
}

/** @returns {number} */
export function getCubeReflectionMapping() {
  return THREE.CubeReflectionMapping;
}

/** @returns {number} */
export function getCubeRefractionMapping() {
  return THREE.CubeRefractionMapping;
}

/** @returns {number} */
export function getEquirectangularReflectionMapping() {
  return THREE.EquirectangularReflectionMapping;
}

/** @returns {number} */
export function getEquirectangularRefractionMapping() {
  return THREE.EquirectangularRefractionMapping;
}

/** @returns {number} */
export function getRepeatWrapping() {
  return THREE.RepeatWrapping;
}

/** @returns {number} */
export function getClampToEdgeWrapping() {
  return THREE.ClampToEdgeWrapping;
}

/** @returns {number} */
export function getMirroredRepeatWrapping() {
  return THREE.MirroredRepeatWrapping;
}

/** @returns {number} */
export function getNearestFilter() {
  return THREE.NearestFilter;
}

/** @returns {number} */
export function getLinearFilter() {
  return THREE.LinearFilter;
}

/** @returns {number} */
export function getNearestMipmapNearestFilter() {
  return THREE.NearestMipmapNearestFilter;
}

/** @returns {number} */
export function getNearestMipmapLinearFilter() {
  return THREE.NearestMipmapLinearFilter;
}

/** @returns {number} */
export function getLinearMipmapNearestFilter() {
  return THREE.LinearMipmapNearestFilter;
}

/** @returns {number} */
export function getLinearMipmapLinearFilter() {
  return THREE.LinearMipmapLinearFilter;
}

/** @param {THREE.Texture} texture @param {string} colorSpace @returns {void} */
export function setTextureColorSpace(texture, colorSpace) {
  texture.colorSpace = colorSpace;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} mapping @returns {void} */
export function setTextureMapping(texture, mapping) {
  texture.mapping = mapping;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} wrapping @returns {void} */
export function setTextureWrapS(texture, wrapping) {
  texture.wrapS = wrapping;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} wrapping @returns {void} */
export function setTextureWrapT(texture, wrapping) {
  texture.wrapT = wrapping;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} filter @returns {void} */
export function setTextureMagFilter(texture, filter) {
  texture.magFilter = filter;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} filter @returns {void} */
export function setTextureMinFilter(texture, filter) {
  texture.minFilter = filter;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {{ x: number, y: number }} repeat @returns {void} */
export function setTextureRepeat(texture, repeat) {
  texture.repeat.set(repeat.x, repeat.y);
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {{ x: number, y: number }} offset @returns {void} */
export function setTextureOffset(texture, offset) {
  texture.offset.set(offset.x, offset.y);
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} rotation @returns {void} */
export function setTextureRotation(texture, rotation) {
  texture.rotation = rotation;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {{ x: number, y: number }} center @returns {void} */
export function setTextureCenter(texture, center) {
  texture.center.set(center.x, center.y);
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {number} anisotropy @returns {void} */
export function setTextureAnisotropy(texture, anisotropy) {
  texture.anisotropy = anisotropy;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {boolean} flipY @returns {void} */
export function setTextureFlipY(texture, flipY) {
  texture.flipY = flipY;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {boolean} generateMipmaps @returns {void} */
export function setTextureGenerateMipmaps(texture, generateMipmaps) {
  texture.generateMipmaps = generateMipmaps;
  texture.needsUpdate = true;
  return texture;
}

/** @param {THREE.Texture} texture @param {boolean} needsUpdate @returns {void} */
export function setTextureNeedsUpdate(texture, needsUpdate) {
  texture.needsUpdate = needsUpdate;
  return texture;
}

/** @param {THREE.Texture} texture @returns {void} */
export function disposeTexture(texture) {
  texture.dispose();
}
