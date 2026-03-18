import * as THREE from "three";
export { identity } from "../savoiardi.ffi.mjs";

/**
 * Create a perspective camera.
 * @param {number} fov
 * @param {number} aspect
 * @param {number} near
 * @param {number} far
 * @returns {THREE.PerspectiveCamera}
 */
export function createPerspective(fov, aspect, near, far) {
  return new THREE.PerspectiveCamera(fov, aspect, near, far);
}

/**
 * Create an orthographic camera.
 * @param {number} left
 * @param {number} right
 * @param {number} top
 * @param {number} bottom
 * @param {number} near
 * @param {number} far
 * @returns {THREE.OrthographicCamera}
 */
export function createOrthographic(left, right, top, bottom, near, far) {
  return new THREE.OrthographicCamera(left, right, top, bottom, near, far);
}

/**
 * Update the camera projection matrix.
 * @param {THREE.Camera} camera
 * @returns {THREE.Camera}
 */
export function updateProjectionMatrix(camera) {
  camera.updateProjectionMatrix();
  return camera;
}

/**
 * Update perspective camera parameters.
 * @param {THREE.PerspectiveCamera} camera
 * @param {number} fov
 * @param {number} aspect
 * @param {number} near
 * @param {number} far
 * @returns {THREE.PerspectiveCamera}
 */
export function updatePerspective(camera, fov, aspect, near, far) {
  camera.fov = fov;
  camera.aspect = aspect;
  camera.near = near;
  camera.far = far;
  return camera;
}

/**
 * Update orthographic camera parameters.
 * @param {THREE.OrthographicCamera} camera
 * @param {number} left
 * @param {number} right
 * @param {number} top
 * @param {number} bottom
 * @param {number} near
 * @param {number} far
 * @returns {THREE.OrthographicCamera}
 */
export function updateOrthographic(
  camera,
  left,
  right,
  top,
  bottom,
  near,
  far,
) {
  camera.left = left;
  camera.right = right;
  camera.top = top;
  camera.bottom = bottom;
  camera.near = near;
  camera.far = far;
  return camera;
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveFov(camera) {
  return camera.fov;
}

/** @param {THREE.PerspectiveCamera} camera @param {number} fov @returns {THREE.PerspectiveCamera} */
export function setPerspectiveFov(camera, fov) {
  camera.fov = fov;
  return camera;
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveAspect(camera) {
  return camera.aspect;
}

/** @param {THREE.PerspectiveCamera} camera @param {number} aspect @returns {THREE.PerspectiveCamera} */
export function setPerspectiveAspect(camera, aspect) {
  camera.aspect = aspect;
  return camera;
}

/** @param {THREE.Camera} camera @returns {number} */
export function getZoom(camera) {
  return camera.zoom;
}

/** @param {THREE.Camera} camera @param {number} zoom @returns {THREE.Camera} */
export function setZoom(camera, zoom) {
  camera.zoom = zoom;
  return camera;
}

function createViewOffset(fullWidth, fullHeight, x, y, width, height) {
  return {
    enabled: true,
    fullWidth,
    fullHeight,
    offsetX: x,
    offsetY: y,
    width,
    height,
  };
}

/**
 * Update a perspective camera's view offset without recomputing the projection matrix.
 * @param {THREE.Camera} camera
 * @param {number} fullWidth
 * @param {number} fullHeight
 * @param {number} x
 * @param {number} y
 * @param {number} width
 * @param {number} height
 * @returns {THREE.Camera}
 */
export function setViewOffset(
  camera,
  fullWidth,
  fullHeight,
  x,
  y,
  width,
  height,
) {
  camera.aspect = fullWidth / fullHeight;
  camera.view = createViewOffset(fullWidth, fullHeight, x, y, width, height);
  return camera;
}

/** @param {THREE.Camera} camera @returns {THREE.PerspectiveCamera} */
export function clearViewOffset(camera) {
  if (camera.view !== null) {
    camera.view.enabled = false;
  }
  return camera;
}

/**
 * Set the focal length without recomputing the projection matrix.
 * @param {THREE.PerspectiveCamera} camera
 * @param {number} focalLength
 * @returns {THREE.PerspectiveCamera}
 */
export function setPerspectiveFocalLength(camera, focalLength) {
  const vExtentSlope = 0.5 * camera.getFilmHeight() / focalLength;
  camera.fov = THREE.MathUtils.RAD2DEG * 2 * Math.atan(vExtentSlope);
  return camera;
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveFocalLength(camera) {
  const vExtentSlope = Math.tan(THREE.MathUtils.DEG2RAD * 0.5 * camera.fov);
  return 0.5 * camera.getFilmHeight() / vExtentSlope;
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveEffectiveFOV(camera) {
  return (
    THREE.MathUtils.RAD2DEG *
    2 *
    Math.atan(Math.tan(THREE.MathUtils.DEG2RAD * 0.5 * camera.fov) / camera.zoom)
  );
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveFilmWidth(camera) {
  return camera.filmGauge * Math.min(camera.aspect, 1);
}

/** @param {THREE.PerspectiveCamera} camera @returns {number} */
export function getPerspectiveFilmHeight(camera) {
  return camera.filmGauge / Math.max(camera.aspect, 1);
}

/** @param {THREE.PerspectiveCamera} camera @param {number} filmGauge @returns {THREE.PerspectiveCamera} */
export function setPerspectiveFilmGauge(camera, filmGauge) {
  camera.filmGauge = filmGauge;
  return camera;
}

/** @param {THREE.PerspectiveCamera} camera @param {number} filmOffset @returns {THREE.PerspectiveCamera} */
export function setPerspectiveFilmOffset(camera, filmOffset) {
  camera.filmOffset = filmOffset;
  return camera;
}

/** @param {THREE.OrthographicCamera} camera @returns {number} */
export function getOrthographicLeft(camera) {
  return camera.left;
}

/** @param {THREE.OrthographicCamera} camera @param {number} left @returns {THREE.OrthographicCamera} */
export function setOrthographicLeft(camera, left) {
  camera.left = left;
  return camera;
}

/** @param {THREE.OrthographicCamera} camera @returns {number} */
export function getOrthographicRight(camera) {
  return camera.right;
}

/** @param {THREE.OrthographicCamera} camera @param {number} right @returns {THREE.OrthographicCamera} */
export function setOrthographicRight(camera, right) {
  camera.right = right;
  return camera;
}

/** @param {THREE.OrthographicCamera} camera @returns {number} */
export function getOrthographicTop(camera) {
  return camera.top;
}

/** @param {THREE.OrthographicCamera} camera @param {number} top @returns {THREE.OrthographicCamera} */
export function setOrthographicTop(camera, top) {
  camera.top = top;
  return camera;
}

/** @param {THREE.OrthographicCamera} camera @returns {number} */
export function getOrthographicBottom(camera) {
  return camera.bottom;
}

/** @param {THREE.OrthographicCamera} camera @param {number} bottom @returns {THREE.OrthographicCamera} */
export function setOrthographicBottom(camera, bottom) {
  camera.bottom = bottom;
  return camera;
}

/** @param {THREE.Camera} camera @returns {number} */
export function getNear(camera) {
  return camera.near;
}

/** @param {THREE.Camera} camera @param {number} near @returns {THREE.OrthographicCamera} */
export function setNear(camera, near) {
  camera.near = near;
  return camera;
}

/** @param {THREE.Camera} camera @returns {number} */
export function getFar(camera) {
  return camera.far;
}

/** @param {THREE.Camera} camera @param {number} far @returns {THREE.OrthographicCamera} */
export function setFar(camera, far) {
  camera.far = far;
  return camera;
}

/**
 * Check whether an `Object3D` is a camera.
 * @param {THREE.Object3D & { isCamera?: boolean }} object
 * @returns {boolean}
 */
export function isCamera(object) {
  return object?.isCamera === true;
}

/** @param {THREE.Object3D & { isPerspectiveCamera?: boolean }} object @returns {boolean} */
export function isPerspectiveCamera(object) {
  return object?.isPerspectiveCamera === true;
}

/** @param {THREE.Object3D & { isOrthographicCamera?: boolean }} object @returns {boolean} */
export function isOrthographicCamera(object) {
  return object?.isOrthographicCamera === true;
}
