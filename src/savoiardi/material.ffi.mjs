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

/**
 * Create a `MeshNormalMaterial`.
 * @returns {THREE.MeshNormalMaterial}
 */
export function createNormalMaterial(
  transparent,
  opacity,
  wireframe,
  flatShading,
  side,
) {
  return new THREE.MeshNormalMaterial({
    transparent,
    opacity,
    wireframe,
    flatShading,
    side,
  });
}

/**
 * Create a `MeshMatcapMaterial`.
 * @returns {THREE.MeshMatcapMaterial}
 */
export function createMatcapMaterial(
  color,
  matcap,
  transparent,
  opacity,
  flatShading,
  side,
) {
  return new THREE.MeshMatcapMaterial({
    color,
    matcap: Option$isSome(matcap) ? Option$Some$0(matcap) : null,
    transparent,
    opacity,
    flatShading,
    side,
  });
}

/**
 * Create a `ShadowMaterial`.
 * @returns {THREE.ShadowMaterial}
 */
export function createShadowMaterial(color, transparent, opacity) {
  return new THREE.ShadowMaterial({
    color,
    transparent,
    opacity,
  });
}

function setMaterialPropertyIfSupported(material, propertyName, value) {
  if (propertyName in material) {
    material[propertyName] = value;
    material.needsUpdate = true;
  }
  return material;
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

/** @param {THREE.Material & Record<string, any>} material @param {number} roughness @returns {THREE.Material & Record<string, any>} */
export function updateMaterialRoughness(material, roughness) {
  return setMaterialPropertyIfSupported(material, "roughness", roughness);
}

/** @param {THREE.Material & Record<string, any>} material @param {number} metalness @returns {THREE.Material & Record<string, any>} */
export function updateMaterialMetalness(material, metalness) {
  return setMaterialPropertyIfSupported(material, "metalness", metalness);
}

/** @param {THREE.Material & Record<string, any>} material @param {any} envMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialEnvMap(material, envMap) {
  return setMaterialPropertyIfSupported(
    material,
    "envMap",
    Option$isSome(envMap) ? Option$Some$0(envMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} normalMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialNormalMap(material, normalMap) {
  return setMaterialPropertyIfSupported(
    material,
    "normalMap",
    Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} matcap @returns {THREE.Material & Record<string, any>} */
export function setMaterialMatcap(material, matcap) {
  return setMaterialPropertyIfSupported(
    material,
    "matcap",
    Option$isSome(matcap) ? Option$Some$0(matcap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {{ x: number, y: number }} normalScale @returns {THREE.Material & Record<string, any>} */
export function setMaterialNormalScale(material, normalScale) {
  if (material.normalScale) {
    material.normalScale.set(normalScale.x, normalScale.y);
    material.needsUpdate = true;
  }
  return material;
}

/** @param {THREE.Material & Record<string, any>} material @param {any} alphaMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialAlphaMap(material, alphaMap) {
  return setMaterialPropertyIfSupported(
    material,
    "alphaMap",
    Option$isSome(alphaMap) ? Option$Some$0(alphaMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} emissiveMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialEmissiveMap(material, emissiveMap) {
  return setMaterialPropertyIfSupported(
    material,
    "emissiveMap",
    Option$isSome(emissiveMap) ? Option$Some$0(emissiveMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} aoMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialAoMap(material, aoMap) {
  return setMaterialPropertyIfSupported(
    material,
    "aoMap",
    Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {number} aoMapIntensity @returns {THREE.Material & Record<string, any>} */
export function updateMaterialAoMapIntensity(material, aoMapIntensity) {
  return setMaterialPropertyIfSupported(
    material,
    "aoMapIntensity",
    aoMapIntensity,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} roughnessMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialRoughnessMap(material, roughnessMap) {
  return setMaterialPropertyIfSupported(
    material,
    "roughnessMap",
    Option$isSome(roughnessMap) ? Option$Some$0(roughnessMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} metalnessMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialMetalnessMap(material, metalnessMap) {
  return setMaterialPropertyIfSupported(
    material,
    "metalnessMap",
    Option$isSome(metalnessMap) ? Option$Some$0(metalnessMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {any} displacementMap @returns {THREE.Material & Record<string, any>} */
export function setMaterialDisplacementMap(material, displacementMap) {
  return setMaterialPropertyIfSupported(
    material,
    "displacementMap",
    Option$isSome(displacementMap) ? Option$Some$0(displacementMap) : null,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {number} displacementScale @returns {THREE.Material & Record<string, any>} */
export function setMaterialDisplacementScale(material, displacementScale) {
  return setMaterialPropertyIfSupported(
    material,
    "displacementScale",
    displacementScale,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {number} displacementBias @returns {THREE.Material & Record<string, any>} */
export function setMaterialDisplacementBias(material, displacementBias) {
  return setMaterialPropertyIfSupported(
    material,
    "displacementBias",
    displacementBias,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {number} clearcoat @returns {THREE.Material & Record<string, any>} */
export function updateMaterialClearcoat(material, clearcoat) {
  return setMaterialPropertyIfSupported(material, "clearcoat", clearcoat);
}

/** @param {THREE.Material & Record<string, any>} material @param {number} clearcoatRoughness @returns {THREE.Material & Record<string, any>} */
export function updateMaterialClearcoatRoughness(material, clearcoatRoughness) {
  return setMaterialPropertyIfSupported(
    material,
    "clearcoatRoughness",
    clearcoatRoughness,
  );
}

/** @param {THREE.Material & Record<string, any>} material @param {number} transmission @returns {THREE.Material & Record<string, any>} */
export function updateMaterialTransmission(material, transmission) {
  return setMaterialPropertyIfSupported(material, "transmission", transmission);
}

/** @param {THREE.Material & Record<string, any>} material @param {number} thickness @returns {THREE.Material & Record<string, any>} */
export function updateMaterialThickness(material, thickness) {
  return setMaterialPropertyIfSupported(material, "thickness", thickness);
}

/** @param {THREE.Material & Record<string, any>} material @param {number} ior @returns {THREE.Material & Record<string, any>} */
export function updateMaterialIor(material, ior) {
  return setMaterialPropertyIfSupported(material, "ior", ior);
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} flatShading @returns {THREE.Material & Record<string, any>} */
export function updateMaterialFlatShading(material, flatShading) {
  return setMaterialPropertyIfSupported(material, "flatShading", flatShading);
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} vertexColors @returns {THREE.Material & Record<string, any>} */
export function updateMaterialVertexColors(material, vertexColors) {
  return setMaterialPropertyIfSupported(material, "vertexColors", vertexColors);
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} depthTest @returns {THREE.Material & Record<string, any>} */
export function updateMaterialDepthTest(material, depthTest) {
  return setMaterialPropertyIfSupported(material, "depthTest", depthTest);
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} depthWrite @returns {THREE.Material & Record<string, any>} */
export function updateMaterialDepthWrite(material, depthWrite) {
  return setMaterialPropertyIfSupported(material, "depthWrite", depthWrite);
}

/** @param {THREE.Material & Record<string, any>} material @param {boolean} fog @returns {THREE.Material & Record<string, any>} */
export function updateMaterialFog(material, fog) {
  return setMaterialPropertyIfSupported(material, "fog", fog);
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
