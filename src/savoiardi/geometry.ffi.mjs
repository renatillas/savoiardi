import * as THREE from "three";
import { TextGeometry } from "three/addons/geometries/TextGeometry.js";

/**
 * @param {number} width
 * @param {number} height
 * @param {number} depth
 * @returns {THREE.BoxGeometry}
 */
export function createBoxGeometry(width, height, depth) {
  return new THREE.BoxGeometry(width, height, depth);
}

/**
 * @param {number} radius
 * @param {number} widthSegments
 * @param {number} heightSegments
 * @returns {THREE.SphereGeometry}
 */
export function createSphereGeometry(radius, widthSegments, heightSegments) {
  return new THREE.SphereGeometry(radius, widthSegments, heightSegments);
}

/**
 * @param {number} radius
 * @param {number} segments
 * @returns {THREE.CircleGeometry}
 */
export function createCircleGeometry(radius, segments) {
  return new THREE.CircleGeometry(radius, segments);
}

/**
 * @param {number} radius
 * @param {number} height
 * @param {number} segments
 * @returns {THREE.ConeGeometry}
 */
export function createConeGeometry(radius, height, segments) {
  return new THREE.ConeGeometry(radius, height, segments);
}

/**
 * @param {number} width
 * @param {number} height
 * @param {number} widthSegments
 * @param {number} heightSegments
 * @returns {THREE.PlaneGeometry}
 */
export function createPlaneGeometry(
  width,
  height,
  widthSegments,
  heightSegments,
) {
  return new THREE.PlaneGeometry(width, height, widthSegments, heightSegments);
}

/**
 * @param {number} radiusTop
 * @param {number} radiusBottom
 * @param {number} height
 * @param {number} radialSegments
 * @returns {THREE.CylinderGeometry}
 */
export function createCylinderGeometry(
  radiusTop,
  radiusBottom,
  height,
  radialSegments,
) {
  return new THREE.CylinderGeometry(
    radiusTop,
    radiusBottom,
    height,
    radialSegments,
  );
}

/**
 * @param {number} radius
 * @param {number} tube
 * @param {number} radialSegments
 * @param {number} tubularSegments
 * @returns {THREE.TorusGeometry}
 */
export function createTorusGeometry(
  radius,
  tube,
  radialSegments,
  tubularSegments,
) {
  return new THREE.TorusGeometry(radius, tube, radialSegments, tubularSegments);
}

/**
 * @param {number} innerRadius
 * @param {number} outerRadius
 * @param {number} segments
 * @returns {THREE.RingGeometry}
 */
export function createRingGeometry(innerRadius, outerRadius, segments) {
  return new THREE.RingGeometry(innerRadius, outerRadius, segments);
}

/**
 * @param {number} radius
 * @param {number} tube
 * @param {number} tubularSegments
 * @param {number} radialSegments
 * @returns {THREE.TorusKnotGeometry}
 */
export function createTorusKnotGeometry(
  radius,
  tube,
  tubularSegments,
  radialSegments,
) {
  return new THREE.TorusKnotGeometry(
    radius,
    tube,
    tubularSegments,
    radialSegments,
  );
}

/**
 * @param {number} radius
 * @param {number} length
 * @param {number} capSegments
 * @param {number} radialSegments
 * @returns {THREE.CapsuleGeometry}
 */
export function createCapsuleGeometry(
  radius,
  length,
  capSegments,
  radialSegments,
) {
  return new THREE.CapsuleGeometry(radius, length, capSegments, radialSegments);
}

/**
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry}
 */
export function centerGeometry(geometry) {
  geometry.center();
  return geometry;
}

/**
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry}
 */
export function computeVertexNormals(geometry) {
  geometry.computeVertexNormals();
  return geometry;
}

/**
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry}
 */
export function normalizeNormals(geometry) {
  geometry.normalizeNormals();
  return geometry;
}

/**
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry}
 */
export function computeBoundingBox(geometry) {
  geometry.computeBoundingBox();
  return geometry;
}

/**
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry}
 */
export function computeBoundingSphere(geometry) {
  geometry.computeBoundingSphere();
  return geometry;
}

/**
 * Create text geometry from a loaded font.
 * @param {string} text
 * @param {any} font
 * @param {number} size
 * @param {number} depth
 * @param {number} curveSegments
 * @param {boolean} bevelEnabled
 * @param {number} bevelThickness
 * @param {number} bevelSize
 * @returns {TextGeometry}
 */
export function createTextGeometry(
  text,
  font,
  size,
  depth,
  curveSegments,
  bevelEnabled,
  bevelThickness,
  bevelSize,
) {
  return new TextGeometry(text, {
    font,
    size,
    depth,
    curveSegments,
    bevelEnabled,
    bevelThickness,
    bevelSize,
  });
}
