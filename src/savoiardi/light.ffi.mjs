import * as THREE from "three";
export { identity } from "../savoiardi.ffi.mjs";

/**
 * @param {number} color
 * @param {number} intensity
 * @returns {THREE.AmbientLight}
 */
export function createAmbientLight(color, intensity) {
  return new THREE.AmbientLight(color, intensity);
}

/**
 * @param {number} color
 * @param {number} intensity
 * @returns {THREE.DirectionalLight}
 */
export function createDirectionalLight(color, intensity) {
  return new THREE.DirectionalLight(color, intensity);
}

/**
 * @param {number} color
 * @param {number} intensity
 * @param {number} distance
 * @returns {THREE.PointLight}
 */
export function createPointLight(color, intensity, distance) {
  return new THREE.PointLight(color, intensity, distance);
}

/**
 * @param {number} color
 * @param {number} intensity
 * @param {number} distance
 * @param {number} angle
 * @param {number} penumbra
 * @returns {THREE.SpotLight}
 */
export function createSpotLight(color, intensity, distance, angle, penumbra) {
  return new THREE.SpotLight(color, intensity, distance, angle, penumbra);
}

/**
 * @param {number} skyColor
 * @param {number} groundColor
 * @param {number} intensity
 * @returns {THREE.HemisphereLight}
 */
export function createHemisphereLight(skyColor, groundColor, intensity) {
  return new THREE.HemisphereLight(skyColor, groundColor, intensity);
}

/**
 * @param {THREE.Object3D & { isDirectionalLight?: boolean }} object
 * @returns {boolean}
 */
export function isDirectionalLight(object) {
  return object?.isDirectionalLight === true;
}

/**
 * @param {THREE.Object3D & { isPointLight?: boolean }} object
 * @returns {boolean}
 */
export function isPointLight(object) {
  return object?.isPointLight === true;
}

/**
 * @param {THREE.Object3D & { isSpotLight?: boolean }} object
 * @returns {boolean}
 */
export function isSpotLight(object) {
  return object?.isSpotLight === true;
}

/**
 * @param {THREE.Object3D & { isHemisphereLight?: boolean }} object
 * @returns {boolean}
 */
export function isHemisphereLight(object) {
  return object?.isHemisphereLight === true;
}

/**
 * @param {THREE.Light} light
 * @param {boolean} castShadow
 * @returns {THREE.Light}
 */
export function setLightCastShadow(light, castShadow) {
  light.castShadow = castShadow;
  return light;
}

/**
 * @param {THREE.Light & { color?: THREE.Color }} light
 * @param {number} color
 * @returns {THREE.Light & { color?: THREE.Color }}
 */
export function updateLightColor(light, color) {
  if (light.color) {
    light.color.setHex(color);
  }
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {number} intensity
 * @returns {THREE.Light}
 */
export function updateLightIntensity(light, intensity) {
  light.intensity = intensity;
  return light;
}

/**
 * @param {THREE.DirectionalLight} light
 * @param {THREE.Object3D} target
 * @returns {THREE.DirectionalLight}
 */
export function setDirectionalLightTarget(light, target) {
  light.target = target;
  light.target.updateMatrixWorld(true);
  return light;
}

/**
 * @param {THREE.DirectionalLight} light
 * @returns {THREE.Object3D}
 */
export function getDirectionalLightTarget(light) {
  return light.target;
}

/**
 * @param {THREE.PointLight} light
 * @param {number} distance
 * @returns {THREE.PointLight}
 */
export function setPointLightDistance(light, distance) {
  light.distance = distance;
  return light;
}

/**
 * @param {THREE.PointLight} light
 * @param {number} decay
 * @returns {THREE.PointLight}
 */
export function setPointLightDecay(light, decay) {
  light.decay = decay;
  return light;
}

/**
 * @param {THREE.PointLight} light
 * @param {number} power
 * @returns {THREE.PointLight}
 */
export function setPointLightPower(light, power) {
  light.power = power;
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {THREE.Object3D} target
 * @returns {THREE.SpotLight}
 */
export function setSpotLightTarget(light, target) {
  light.target = target;
  light.target.updateMatrixWorld(true);
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @returns {THREE.Object3D}
 */
export function getSpotLightTarget(light) {
  return light.target;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} distance
 * @returns {THREE.SpotLight}
 */
export function setSpotLightDistance(light, distance) {
  light.distance = distance;
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} angle
 * @returns {THREE.SpotLight}
 */
export function setSpotLightAngle(light, angle) {
  light.angle = angle;
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} penumbra
 * @returns {THREE.SpotLight}
 */
export function setSpotLightPenumbra(light, penumbra) {
  light.penumbra = penumbra;
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} decay
 * @returns {THREE.SpotLight}
 */
export function setSpotLightDecay(light, decay) {
  light.decay = decay;
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} power
 * @returns {THREE.SpotLight}
 */
export function setSpotLightPower(light, power) {
  light.power = power;
  return light;
}

/**
 * @param {THREE.HemisphereLight} light
 * @param {number} groundColor
 * @returns {THREE.HemisphereLight}
 */
export function setHemisphereLightGroundColor(light, groundColor) {
  light.groundColor.setHex(groundColor);
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {number} bias
 * @returns {THREE.Light}
 */
export function setLightShadowBias(light, bias) {
  if (light?.shadow) light.shadow.bias = bias;
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {number} normalBias
 * @returns {THREE.Light}
 */
export function setLightShadowNormalBias(light, normalBias) {
  if (light?.shadow) light.shadow.normalBias = normalBias;
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {number} radius
 * @returns {THREE.Light}
 */
export function setLightShadowRadius(light, radius) {
  if (light?.shadow) light.shadow.radius = radius;
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {number} width
 * @param {number} height
 * @returns {THREE.Light}
 */
export function setLightShadowMapSize(light, width, height) {
  if (light?.shadow?.mapSize) {
    light.shadow.mapSize.set(width, height);
  }
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {boolean} autoUpdate
 * @returns {THREE.Light}
 */
export function setLightShadowAutoUpdate(light, autoUpdate) {
  if (light?.shadow) light.shadow.autoUpdate = autoUpdate;
  return light;
}

/**
 * @param {THREE.Light} light
 * @param {boolean} needsUpdate
 * @returns {THREE.Light}
 */
export function setLightShadowNeedsUpdate(light, needsUpdate) {
  if (light?.shadow) light.shadow.needsUpdate = needsUpdate;
  return light;
}

/**
 * @param {THREE.DirectionalLight} light
 * @param {number} left
 * @param {number} right
 * @param {number} top
 * @param {number} bottom
 * @returns {THREE.DirectionalLight}
 */
export function setDirectionalLightShadowCameraBounds(
  light,
  left,
  right,
  top,
  bottom,
) {
  const camera = light?.shadow?.camera;
  if (camera && "left" in camera) {
    camera.left = left;
    camera.right = right;
    camera.top = top;
    camera.bottom = bottom;
    camera.updateProjectionMatrix?.();
  }
  return light;
}

/**
 * @param {THREE.DirectionalLight} light
 * @param {number} near
 * @param {number} far
 * @returns {THREE.DirectionalLight}
 */
export function setDirectionalLightShadowCameraNearFar(light, near, far) {
  const camera = light?.shadow?.camera;
  if (camera) {
    camera.near = near;
    camera.far = far;
    camera.updateProjectionMatrix?.();
  }
  return light;
}

/**
 * @param {THREE.PointLight} light
 * @param {number} near
 * @param {number} far
 * @returns {THREE.PointLight}
 */
export function setPointLightShadowCameraNearFar(light, near, far) {
  const camera = light?.shadow?.camera;
  if (camera) {
    camera.near = near;
    camera.far = far;
    camera.updateProjectionMatrix?.();
  }
  return light;
}

/**
 * @param {THREE.SpotLight} light
 * @param {number} near
 * @param {number} far
 * @returns {THREE.SpotLight}
 */
export function setSpotLightShadowCameraNearFar(light, near, far) {
  const camera = light?.shadow?.camera;
  if (camera) {
    camera.near = near;
    camera.far = far;
    camera.updateProjectionMatrix?.();
  }
  return light;
}

/**
 * @param {THREE.Object3D & { isLight?: boolean }} object
 * @returns {boolean}
 */
export function isLight(object) {
  return object?.isLight === true;
}
