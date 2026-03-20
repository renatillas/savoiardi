import * as THREE from "three";

export function identity(value) {
  return value;
}

/**
 * @param {THREE.SpriteMaterial} material
 * @returns {THREE.Sprite}
 */
export function createSprite(material) {
  return new THREE.Sprite(material);
}

/** @returns {THREE.Sprite} */
export function createDefaultSprite() {
  return new THREE.Sprite();
}

/**
 * @param {THREE.Object3D} object
 * @returns {boolean}
 */
export function isSprite(object) {
  return object.isSprite === true;
}

/**
 * @param {THREE.Sprite} sprite
 * @returns {{ x: number, y: number }}
 */
export function getSpriteCenter(sprite) {
  return { x: sprite.center.x, y: sprite.center.y };
}

/**
 * @param {THREE.Sprite} sprite
 * @param {{ x: number, y: number }} center
 * @returns {THREE.Sprite}
 */
export function setSpriteCenter(sprite, center) {
  sprite.center.set(center.x, center.y);
  return sprite;
}
