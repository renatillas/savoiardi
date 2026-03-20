import * as THREE from "three";

/**
 * @param {THREE.SpriteMaterial} material
 * @returns {THREE.Sprite}
 */
export function createSprite(material) {
  return new THREE.Sprite(material);
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
