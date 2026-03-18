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
export function createPerspectiveCamera(fov, aspect, near, far) {
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
export function createOrthographicCamera(left, right, top, bottom, near, far) {
  return new THREE.OrthographicCamera(left, right, top, bottom, near, far);
}

/**
 * Update the camera projection matrix.
 * @param {THREE.Camera} camera
 * @returns {THREE.Camera}
 */
export function updateCameraProjectionMatrix(camera) {
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
export function setPerspectiveCameraParams(camera, fov, aspect, near, far) {
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
export function updateOrthographicCamera(
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

/**
 * Check whether an `Object3D` is a camera.
 * @param {THREE.Object3D & { isCamera?: boolean }} object
 * @returns {boolean}
 */
export function isCamera(object) {
  return object?.isCamera === true;
}
