import * as THREE from "three";

import {
  vec3_from_three,
  quaternion_from_three,
  result_from_nullable,
} from "../savoiardi.ffi.mjs";

const reusableWorldPosition = new THREE.Vector3();
const reusableWorldQuaternion = new THREE.Quaternion();
const reusableWorldScale = new THREE.Vector3();
const reusableWorldDirection = new THREE.Vector3();

/** @returns {THREE.Group} */
export function createGroup() {
  return new THREE.Group();
}

/** @param {THREE.BufferGeometry} geometry @param {THREE.Material | THREE.Material[]} material @returns {THREE.Mesh} */
export function createMesh(geometry, material) {
  return new THREE.Mesh(geometry, material);
}

/** @param {THREE.Object3D} parent @param {THREE.Object3D} child @returns {THREE.Object3D} */
export function addChild(parent, child) {
  parent.add(child);
  return parent;
}

/** @param {THREE.Object3D} parent @param {THREE.Object3D} child @returns {THREE.Object3D} */
export function removeChild(parent, child) {
  parent.remove(child);
  return parent;
}

/** @param {THREE.Object3D} parent @param {THREE.Object3D} child @returns {THREE.Object3D} */
export function attachChild(parent, child) {
  parent.attach(child);
  return parent;
}

/** @param {THREE.Object3D} object @returns {THREE.Object3D} */
export function removeFromParent(object) {
  object.removeFromParent();
  return object;
}

/**
 * Recursively dispose an `Object3D` subtree.
 * @param {import("three").Object3D} object
 * @returns {void}
 */
export function disposeObject3D(object) {
  if (!object) return;

  if (object.geometry) {
    object.geometry.dispose();
  }

  if (object.material) {
    if (Array.isArray(object.material)) {
      object.material.forEach((material) => dispose_material(material));
    } else {
      dispose_material(object.material);
    }
  }

  if (object.children) {
    for (const child of object.children) {
      dispose_object3d(child);
    }
  }
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

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getPosition(object) {
  return vec3_from_three(object.position);
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number }} target @returns {THREE.Object3D} */
export function lookAt(object, target) {
  object.lookAt(target.x, target.y, target.z);
  return object;
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number }} scale @returns {THREE.Object3D} */
export function setScale(object, scale) {
  object.scale.set(scale.x, scale.y, scale.z);
  return object;
}

/** @param {THREE.Object3D}
 * @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getScale(object) {
  return vec3_from_three(object.scale);
}

/** @param {THREE.Object3D} object @param {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} rotation @returns {THREE.Object3D} */
export function setRotation(object, rotation) {
  object.rotation.set(rotation.x, rotation.y, rotation.z);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getRotation(object) {
  return vec3_from_three(object.rotation);
}

/** @param {THREE.Object3D} object @param {number} angle @returns {THREE.Object3D} */
export function rotateX(object, angle) {
  object.rotateX(angle);
  return object;
}

/** @param {THREE.Object3D} object @param {number} angle @returns {THREE.Object3D} */
export function rotateY(object, angle) {
  object.rotateY(angle);
  return object;
}

/** @param {THREE.Object3D} object @param {number} angle @returns {THREE.Object3D} */
export function rotateZ(object, angle) {
  object.rotateZ(angle);
  return object;
}

/** @param {THREE.Object3D} object @param {{ x: number, y: number, z: number, w: number }} quaternion @returns {THREE.Object3D} */
export function setQuaternion(object, quaternion) {
  object.quaternion.set(quaternion.x, quaternion.y, quaternion.z, quaternion.w);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/quaterni/quaternion.mjs").Quaternion} */
export function getQuaternion(object) {
  return quaternion_from_three(object.quaternion);
}

/** @param {THREE.Object3D & Record<string, any>} object @returns {THREE.Material | THREE.Material[] | undefined} */
export function getObjectMaterial(object) {
  return object.material;
}

/** @param {THREE.Object3D & Record<string, any>} object @param {THREE.BufferGeometry} geometry @returns {THREE.Object3D & Record<string, any>} */
export function setObjectGeometry(object, geometry) {
  object.geometry = geometry;
  return object;
}

/** @param {THREE.Object3D & Record<string, any>} object @param {THREE.Material | THREE.Material[]} material @returns {THREE.Object3D & Record<string, any>} */
export function setObjectMaterial(object, material) {
  object.material = material;
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} castShadow @returns {THREE.Object3D} */
export function setObjectCastShadow(object, castShadow) {
  object.traverse((child) => {
    if (child.isMesh) {
      child.castShadow = castShadow;
    }
  });
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} receiveShadow @returns {THREE.Object3D} */
export function setObjectReceiveShadow(object, receiveShadow) {
  object.traverse((child) => {
    if (child.isMesh) {
      child.receiveShadow = receiveShadow;
    }
  });
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} visible @returns {THREE.Object3D} */
export function setObjectVisible(object, visible) {
  object.visible = visible;
  return object;
}

/** @param {THREE.Object3D} object @returns {boolean} */
export function isObjectVisible(object) {
  return object.visible;
}

/** @param {THREE.Object3D} object @param {string} name @returns {THREE.Object3D} */
export function setObjectName(object, name) {
  object.name = name;
  return object;
}

/** @param {THREE.Object3D} object @returns {string} */
export function getObjectName(object) {
  return object.name;
}

/** @param {THREE.Object3D} object @returns {number} */
export function getObjectId(object) {
  return object.id;
}

/** @param {THREE.Object3D} object @returns {string} */
export function getObjectUuid(object) {
  return object.uuid;
}

/** @param {THREE.Object3D} object @returns {THREE.Object3D[]} */
export function getObjectChildren(object) {
  return object.children;
}

/** @param {THREE.Object3D} object @param {boolean} recursive @returns {THREE.Object3D} */
export function cloneObject(object, recursive) {
  return object.clone(recursive);
}

/** @param {THREE.Object3D} object @param {THREE.Object3D} source @param {boolean} recursive @returns {THREE.Object3D} */
export function copyObject(object, source, recursive) {
  object.copy(source, recursive);
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} frustumCulled @returns {THREE.Object3D} */
export function setFrustumCulled(object, frustumCulled) {
  object.frustumCulled = frustumCulled;
  return object;
}

/** @param {THREE.Object3D} object @param {number} renderOrder @returns {THREE.Object3D} */
export function setRenderOrder(object, renderOrder) {
  object.renderOrder = renderOrder;
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} matrixAutoUpdate @returns {THREE.Object3D} */
export function setMatrixAutoUpdate(object, matrixAutoUpdate) {
  object.matrixAutoUpdate = matrixAutoUpdate;
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} matrixWorldAutoUpdate @returns {THREE.Object3D} */
export function setMatrixWorldAutoUpdate(object, matrixWorldAutoUpdate) {
  object.matrixWorldAutoUpdate = matrixWorldAutoUpdate;
  return object;
}

/** @param {THREE.Object3D} object @returns {THREE.Object3D} */
export function clearChildren(object) {
  object.clear();
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/savoiardi/gleam.mjs").Ok | import("../../build/dev/javascript/savoiardi/gleam.mjs").Error} */
export function getObjectParent(object) {
  return result_from_nullable(object.parent);
}

/** @param {THREE.Object3D} object @param {number} distance @returns {THREE.Object3D} */
export function translateX(object, distance) {
  object.translateX(distance);
  return object;
}

/** @param {THREE.Object3D} object @param {number} distance @returns {THREE.Object3D} */
export function translateY(object, distance) {
  object.translateY(distance);
  return object;
}

/** @param {THREE.Object3D} object @param {number} distance @returns {THREE.Object3D} */
export function translateZ(object, distance) {
  object.translateZ(distance);
  return object;
}

/** @param {THREE.Object3D} object @returns {THREE.Object3D} */
export function updateMatrix(object) {
  object.updateMatrix();
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} force @returns {THREE.Object3D} */
export function updateMatrixWorld(object, force) {
  object.updateMatrixWorld(force);
  return object;
}

/** @param {THREE.Object3D} object @param {boolean} updateParents @param {boolean} updateChildren @returns {THREE.Object3D} */
export function updateWorldMatrix(object, updateParents, updateChildren) {
  object.updateWorldMatrix(updateParents, updateChildren);
  return object;
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getWorldPosition(object) {
  return vec3_from_three(object.getWorldPosition(reusableWorldPosition));
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/quaterni/quaternion.mjs").Quaternion} */
export function getWorldQuaternion(object) {
  return quaternion_from_three(
    object.getWorldQuaternion(reusableWorldQuaternion),
  );
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getWorldScale(object) {
  return vec3_from_three(object.getWorldScale(reusableWorldScale));
}

/** @param {THREE.Object3D} object @returns {import("../../build/dev/javascript/vec/vec/vec3.mjs").Vec3} */
export function getWorldDirection(object) {
  return vec3_from_three(object.getWorldDirection(reusableWorldDirection));
}

/** @param {THREE.Object3D} object @param {number} id @returns {import("../../build/dev/javascript/savoiardi/gleam.mjs").Ok | import("../../build/dev/javascript/savoiardi/gleam.mjs").Error} */
export function getObjectById(object, id) {
  return result_from_nullable(object.getObjectById(id));
}

/** @param {THREE.Object3D} object @param {string} name @returns {import("../../build/dev/javascript/savoiardi/gleam.mjs").Ok | import("../../build/dev/javascript/savoiardi/gleam.mjs").Error} */
export function getObjectByName(object, name) {
  return result_from_nullable(object.getObjectByName(name));
}

/** @param {THREE.Object3D} object @param {string} propertyName @param {string} value @returns {import("../../build/dev/javascript/savoiardi/gleam.mjs").Ok | import("../../build/dev/javascript/savoiardi/gleam.mjs").Error} */
export function getObjectByProperty(object, propertyName, value) {
  return result_from_nullable(object.getObjectByProperty(propertyName, value));
}

/** @param {THREE.Object3D} object @param {string} propertyName @param {string} value @returns {THREE.Object3D[]} */
export function getObjectsByProperty(object, propertyName, value) {
  const matches = [];
  object.traverse((child) => {
    if (child[propertyName] === value) {
      matches.push(child);
    }
  });
  return matches;
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
