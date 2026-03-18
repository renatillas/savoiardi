import * as THREE from "three";
import {
  Option$isSome,
  Option$Some$0,
  dispose_material,
} from "../savoiardi.ffi.mjs";

/** @returns {number} */
export function getFrontSide() {
  return THREE.FrontSide;
}

/** @returns {number} */
export function getBackSide() {
  return THREE.BackSide;
}

/** @returns {number} */
export function getDoubleSide() {
  return THREE.DoubleSide;
}

/**
 * Create a `MeshBasicMaterial`.
 * @param {number} color
 * @param {boolean} transparent
 * @param {number} opacity
 * @param {any} map
 * @param {number} side
 * @param {number} alphaTest
 * @param {boolean} depthWrite
 * @returns {THREE.MeshBasicMaterial}
 */
export function createBasicMaterial(
  color,
  transparent,
  opacity,
  map,
  side,
  alphaTest,
  depthWrite,
) {
  return new THREE.MeshBasicMaterial({
    color,
    transparent,
    opacity,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    side,
    alphaTest,
    depthWrite,
  });
}

/**
 * Create a `MeshStandardMaterial`.
 * @returns {THREE.MeshStandardMaterial}
 */
export function createStandardMaterial(
  color,
  metalness,
  roughness,
  transparent,
  opacity,
  map,
  normalMap,
  aoMap,
  displacementMap,
  displacementScale,
  displacementBias,
  roughnessMap,
  metalnessMap,
  emissive,
  emissiveIntensity,
  alphaTest,
) {
  return new THREE.MeshStandardMaterial({
    color,
    metalness,
    roughness,
    transparent,
    opacity,
    alphaTest,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    displacementMap: Option$isSome(displacementMap)
      ? Option$Some$0(displacementMap)
      : null,
    displacementBias,
    displacementScale,
    roughnessMap: Option$isSome(roughnessMap)
      ? Option$Some$0(roughnessMap)
      : null,
    metalnessMap: Option$isSome(metalnessMap)
      ? Option$Some$0(metalnessMap)
      : null,
    emissive,
    emissiveIntensity,
  });
}

/**
 * Create a `MeshPhysicalMaterial`.
 * @returns {THREE.MeshPhysicalMaterial}
 */
export function createPhysicalMaterial(
  color,
  metalness,
  roughness,
  transparent,
  opacity,
  map,
  normalMap,
  aoMap,
  displacementMap,
  displacementScale,
  displacementBias,
  roughnessMap,
  metalnessMap,
  emissive,
  emissiveIntensity,
  alphaTest,
  clearcoat,
  clearcoatRoughness,
  transmission,
  thickness,
  ior,
) {
  return new THREE.MeshPhysicalMaterial({
    color,
    metalness,
    roughness,
    transparent,
    opacity,
    alphaTest,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    displacementMap: Option$isSome(displacementMap)
      ? Option$Some$0(displacementMap)
      : null,
    displacementBias,
    displacementScale,
    roughnessMap: Option$isSome(roughnessMap)
      ? Option$Some$0(roughnessMap)
      : null,
    metalnessMap: Option$isSome(metalnessMap)
      ? Option$Some$0(metalnessMap)
      : null,
    emissive,
    emissiveIntensity,
    clearcoat,
    clearcoatRoughness,
    transmission,
    thickness,
    ior,
  });
}

/**
 * Create a `MeshPhongMaterial`.
 * @returns {THREE.MeshPhongMaterial}
 */
export function createPhongMaterial(
  color,
  shininess,
  map,
  normalMap,
  aoMap,
  transparent,
  opacity,
  alphaTest,
) {
  return new THREE.MeshPhongMaterial({
    color,
    shininess,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    transparent,
    opacity,
    alphaTest,
  });
}

/**
 * Create a `MeshLambertMaterial`.
 * @returns {THREE.MeshLambertMaterial}
 */
export function createLambertMaterial(
  color,
  map,
  normalMap,
  aoMap,
  transparent,
  opacity,
  alphaTest,
) {
  return new THREE.MeshLambertMaterial({
    color,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    transparent,
    opacity,
    alphaTest,
  });
}

/**
 * Create a `MeshToonMaterial`.
 * @returns {THREE.MeshToonMaterial}
 */
export function createToonMaterial(
  color,
  map,
  normalMap,
  aoMap,
  transparent,
  opacity,
  alphaTest,
) {
  return new THREE.MeshToonMaterial({
    color,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    transparent,
    opacity,
    alphaTest,
  });
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} wireframe @returns {THREE.Material & Record<string, any>} */
export function updateMaterialWireframe(material, wireframe) {
  if (material.wireframe !== undefined) {
    material.wireframe = wireframe;
    material.needsUpdate = true;
  }
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {number} color @returns {THREE.Material & Record<string, any>} */
export function updateMaterialColor(material, color) {
  if (material.color) {
    material.color.setHex(color);
    material.needsUpdate = true;
  }
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} transparent @returns {THREE.Material & Record<string, any>} */
export function updateMaterialTransparent(material, transparent) {
  material.transparent = transparent;
  material.needsUpdate = true;
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {number} opacity @returns {THREE.Material & Record<string, any>} */
export function updateMaterialOpacity(material, opacity) {
  material.opacity = opacity;
  material.needsUpdate = true;
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {number} emissive @returns {THREE.Material & Record<string, any>} */
export function updateMaterialEmissive(material, emissive) {
  if (material.emissive) {
    material.emissive.setHex(emissive);
    material.needsUpdate = true;
  }
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {number} emissiveIntensity @returns {THREE.Material & Record<string, any>} */
export function updateMaterialEmissiveIntensity(material, emissiveIntensity) {
  if (material.emissiveIntensity !== undefined) {
    material.emissiveIntensity = emissiveIntensity;
    material.needsUpdate = true;
  }
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {string} propertyName @param {THREE.Texture} texture @returns {THREE.Material & Record<string, any>} */
export function setMaterialTexture(material, propertyName, texture) {
  material[propertyName] = texture;
  material.needsUpdate = true;
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {number} side @returns {THREE.Material & Record<string, any>} */
export function updateMaterialSide(material, side) {
  material.side = side;
  material.needsUpdate = true;
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} needsUpdate @returns {THREE.Material & Record<string, any>} */
export function setMaterialNeedsUpdate(material, needsUpdate) {
  material.needsUpdate = needsUpdate;
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @returns {void} */
export function disposeMaterial(material) {
  dispose_material(material);
}
