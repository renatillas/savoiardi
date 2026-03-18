import * as THREE from "three";

import {
  vec3_from_three,
  quaternion_from_three,
  result_from_nullable,
  dispose_object3d,
} from "../savoiardi.ffi.mjs";

const reusableWorldPosition = new THREE.Vector3();
const reusableWorldQuaternion = new THREE.Quaternion();
const reusableWorldScale = new THREE.Vector3();
const reusableWorldDirection = new THREE.Vector3();

/** @returns {THREE.Group} */
export function createGroup() {
  return new THREE.Group();
}

/** @param {THREE.BufferGeometry} geometry @returns {THREE.Mesh} */
export function createMesh(geometry) {
  return new THREE.Mesh(geometry);
}

/** @param {THREE.Object3D} parent @param {THREE.Object3D} child @returns {void} */
export function addChild(parent, child) {
  parent.add(child);
  return parent;
}

/** @param {THREE.Object3D} parent @param {THREE.Object3D} child @returns {void} */
export function removeChild(parent, child) {
  parent.remove(child);
  return parent;
}

/** @param {THREE.Object3D} object @returns {void} */
export function removeFromParent(object) {
  object.removeFromParent();
  return object;
}

/** @param {THREE.Object3D} object @returns {void} */
export function disposeObject3D(object) {
  dispose_object3d(object);
}

/**
 * Replace one object with another, preserving transform and visibility.
 * @param {THREE.Object3D} oldObject
 * @param {THREE.Object3D} newObject
 * @param {string} name
 * @returns {THREE.Object3D}
 */
export function replaceObjectModel(oldObject, newObject, name) {
  newObject.position.copy(oldObject.position);
  newObject.quaternion.copy(oldObject.quaternion);
  newObject.scale.copy(oldObject.scale);
  newObject.visible = oldObject.visible;
  newObject.name = name;

  if (oldObject.parent) {
    oldObject.parent.add(newObject);
    oldObject.parent.remove(oldObject);
  }

  oldObject.traverse((obj) => {
    if (obj.geometry) obj.geometry.dispose();
    if (obj.material) {
      if (Array.isArray(obj.material)) obj.material.forEach((m) => m.dispose());
      else obj.material.dispose();
    }
  });

  return newObject;
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number }} position @returns {THREE.Object3D} */
export function setPosition(object, position) {
  object.position.set(position.x, position.y, position.z);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../vec/vec/vec3.mjs").Vec3} */
export function getPosition(object) {
  return vec3_from_three(object.position);
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number }} target @returns {void} */
export function lookAt(object, target) {
  object.lookAt(target.x, target.y, target.z);
  return object;
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number }} scale @returns {THREE.Object3D} */
export function setScale(object, scale) {
  object.scale.set(scale.x, scale.y, scale.z);
  return object;
}

/** @param {THREE.Object3D} object 
 *  @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getScale(object) {
  return vec3_from_three(object.scale);
}

/** @param {THREE.Object3D} object @param {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} rotation @returns {void} */
export function setRotation(object, rotation) {
  object.rotation.set(rotation.x, rotation.y, rotation.z);
  return object;
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number, w: number }} quaternion @returns {void} */
export function setQuaternion(object, quaternion) {
  object.quaternion.set(quaternion.x, quaternion.y, quaternion.z, quaternion.w);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../quaterni/quaternion.mjs").Quaternion} */
export function getQuaternion(object) {
  return quaternion_from_three(object.quaternion);
}

/** @param {THREE.Object3D & Record<string, any>} object @returns {THREE.Material | THREE.Material[] | undefined} */
export function getObjectMaterial(object) {
  return object.material;
}

/** @param {THREE.Object3D & Record<string, any>} object @param {THREE.BufferGeometry} geometry @returns {void} */
export function setObjectGeometry(object, geometry) {
  object.geometry = geometry;
  return object;
}

/** @param {THREE.Object3D & Record<string, any>} object @param {THREE.Material | THREE.Material[]} material @returns {void} */
export function setObjectMaterial(object, material) {
  object.material = material;
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} castShadow @param {boolean} receiveShadow @returns {void} */
export function enableShadows(object, castShadow, receiveShadow) {
  object.traverse((child) => {
    if (child.isMesh) {
      child.castShadow = castShadow;
      child.receiveShadow = receiveShadow;
    }
  });
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} visible @returns {void} */
export function setObjectVisible(object, visible) {
  object.visible = visible;
  return object;
}

/** @param {THREE.Object3D} object @returns {boolean} */
export function isObjectVisible(object) {
  return object.visible;
}

/** @param {THREE.Object3D} object @param {string} name @returns {void} */
export function setObjectName(object, name) {
  object.name = name;
  return object;
}

/** @param {THREE.Object3D} object @returns {string} */
export function getObjectName(object) {
  return object.name;
}

/** @param {THREE.Object3D} object @param {boolean} frustumCulled @returns {void} */
export function setFrustumCulled(object, frustumCulled) {
  object.frustumCulled = frustumCulled;
  return object;
}

/** @param {THREE.Object3D} object @returns {void} */
export function clearChildren(object) {
  object.clear();
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../gleam.mjs").Ok | import("../gleam.mjs").Error} */
export function getObjectParent(object) {
  return result_from_nullable(object.parent);
}

/** @param {THREE.Object3D} object @param {number} distance @returns {void} */
export function translateX(object, distance) {
  object.translateX(distance);
  return object;
}

/** @param {THREE.Object3D} object @param {number} distance @returns {void} */
export function translateY(object, distance) {
  object.translateY(distance);
  return object;
}

/** @param {THREE.Object3D} object @param {number} distance @returns {void} */
export function translateZ(object, distance) {
  object.translateZ(distance);
  return object;
}

/** @param {THREE.Object3D} object @returns {void} */
export function updateMatrix(object) {
  object.updateMatrix();
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} force @returns {void} */
export function updateMatrixWorld(object, force) {
  object.updateMatrixWorld(force);
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} updateParents @param {boolean} updateChildren @returns {void} */
export function updateWorldMatrix(object, updateParents, updateChildren) {
  object.updateWorldMatrix(updateParents, updateChildren);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../vec/vec/vec3.mjs").Vec3} */
export function getWorldPosition(object) {
  return vec3_from_three(object.getWorldPosition(reusableWorldPosition));
}

/** @param {THREE.Object3D} object @returns {import("../../quaterni/quaternion.mjs").Quaternion} */
export function getWorldQuaternion(object) {
  return quaternion_from_three(object.getWorldQuaternion(reusableWorldQuaternion));
}

/** @param {THREE.Object3D} object @returns {import("../../vec/vec/vec3.mjs").Vec3} */
export function getWorldScale(object) {
  return vec3_from_three(object.getWorldScale(reusableWorldScale));
}

/** @param {THREE.Object3D} object @returns {import("../../vec/vec/vec3.mjs").Vec3} */
export function getWorldDirection(object) {
  return vec3_from_three(object.getWorldDirection(reusableWorldDirection));
}

/** @param {THREE.Object3D} object @param {number} id @returns {import("../gleam.mjs").Ok | import("../gleam.mjs").Error} */
export function getObjectById(object, id) {
  return result_from_nullable(object.getObjectById(id));
}

/** @param {THREE.Object3D} object @param {string} name @returns {import("../gleam.mjs").Ok | import("../gleam.mjs").Error} */
export function getObjectByName(object, name) {
  return result_from_nullable(object.getObjectByName(name));
}

/** @param {THREE.Object3D} object @param {(child: THREE.Object3D) => void} visit @returns {void} */
export function traverseObject(object, visit) {
  object.traverse((child) => visit(child));
}

/** @param {THREE.Object3D} object @param {(child: THREE.Object3D) => void} visit @returns {void} */
export function traverseVisibleObject(object, visit) {
  object.traverseVisible((child) => visit(child));
}

/** @param {THREE.Object3D} object @param {(ancestor: THREE.Object3D) => void} visit @returns {void} */
export function traverseAncestorsObject(object, visit) {
  object.traverseAncestors((ancestor) => visit(ancestor));
}

/** @param {{ scene: THREE.Object3D }} gltfData @returns {THREE.Object3D} */
export function getGltfScene(gltfData) {
  return gltfData.scene;
}

/** @param {THREE.Object3D} fbxData @returns {THREE.Object3D} */
export function getFbxScene(fbxData) {
  return fbxData;
}
