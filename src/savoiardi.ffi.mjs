/**
 * ThreeJS FFI - Pure 1:1 bindings to Three.js library
 *
 * This module provides direct, minimal wrappers around Three.js API calls.
 *
 * All higher-level logic should be in the Gleam declarative layer.
 */

import * as THREE from 'three';
import { CSS2DRenderer, CSS2DObject } from 'three/addons/renderers/CSS2DRenderer.js';
import { CSS3DRenderer, CSS3DObject } from 'three/addons/renderers/CSS3DRenderer.js';
import { TextGeometry } from 'three/addons/geometries/TextGeometry.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { FontLoader } from 'three/addons/loaders/FontLoader.js';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
import { STLLoader } from 'three/addons/loaders/STLLoader.js';
import { FBXLoader } from 'three/addons/loaders/FBXLoader.js';

import { Result$Ok, Result$Error, toList } from './gleam.mjs';
import { Vec3$Vec3 } from '../vec/vec/vec3.mjs';
import { Vec2$Vec2 } from '../vec/vec/vec2.mjs';
import { Option$isSome, Option$Some$0 } from '../gleam_stdlib/gleam/option.mjs';
import { Quaternion$Quaternion } from '../quaterni/quaternion.mjs';

// ============================================================================
// UTILITIES
// ============================================================================

/**
 * Identity function for type casting between compatible types.
 * @param {any} value
 * @returns {any}
 */
export function identity(value) {
  return value;
}

// ============================================================================
// CORE - Scene, Renderer, Camera
// ============================================================================

/**
 * Create a Three.js Scene
 * @returns {THREE.Scene}
 */
export function createScene() {
  return new THREE.Scene();
}

/**
 * Set scene background color
 * @param {THREE.Scene} scene
 * @param {number} color - Hex color
 */
export function setSceneBackgroundColor(scene, color) {
  scene.background = new THREE.Color(color);
}

/**
 * Set scene background texture
 * @param {THREE.Scene} scene
 * @param {THREE.Texture} texture
 */
export function setSceneBackgroundTexture(scene, texture) {
  scene.background = texture;
}

/**
 * Set scene background cube texture (skybox)
 * @param {THREE.Scene} scene
 * @param {THREE.CubeTexture} cubeTexture
 */
export function setSceneBackgroundCubeTexture(scene, cubeTexture) {
  scene.background = cubeTexture;
}

/**
 * Clear scene background
 * @param {THREE.Scene} scene
 */
export function clearSceneBackground(scene) {
  scene.background = null;
}

/**
 * Set linear scene fog
 * @param {THREE.Scene} scene
 * @param {number} color
 * @param {number} near
 * @param {number} far
 */
export function setSceneFog(scene, color, near, far) {
  scene.fog = new THREE.Fog(color, near, far);
}

/**
 * Set exponential scene fog
 * @param {THREE.Scene} scene
 * @param {number} color
 * @param {number} density
 */
export function setSceneFogExp2(scene, color, density) {
  scene.fog = new THREE.FogExp2(color, density);
}

/**
 * Clear scene fog
 * @param {THREE.Scene} scene
 */
export function clearSceneFog(scene) {
  scene.fog = null;
}

/**
 * Get the current canvas dimensions from the renderer
 * @param {THREE.WebGLRenderer} renderer
 * @returns {[number, number]} [width, height] as a tuple
 */
export function getCanvasDimensions(renderer) {
  const canvas = renderer.domElement;
  return Vec2$Vec2(canvas.clientWidth, canvas.clientHeight);
}

/**
 * Create a WebGLRenderer
 * @param {boolean} antialias
 * @param {boolean} alpha
 * @returns {THREE.WebGLRenderer}
 */
export function createRenderer(antialias, alpha) {
  return new THREE.WebGLRenderer({ antialias, alpha });
}

/**
 * Enable/disable shadow map on a renderer
 * @param {THREE.WebGLRenderer} renderer
 * @param {boolean} enabled
 */
export function enableRendererShadowMap(renderer, enabled) {
  renderer.shadowMap.enabled = enabled;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
}

/**
 * Set renderer size
 * @param {THREE.WebGLRenderer} renderer
 * @param {number} width
 * @param {number} height
 */
export function setRendererSize(renderer, width, height) {
  renderer.setSize(width, height);
}

/**
 * Get renderer DOM element (canvas)
 * @param {THREE.WebGLRenderer} renderer
 * @returns {HTMLCanvasElement}
 */
export function getRendererDomElement(renderer) {
  return renderer.domElement;
}

/**
 * Render a scene with camera
 * @param {THREE.WebGLRenderer} renderer
 * @param {THREE.Scene} scene
 * @param {THREE.Camera} camera
 */
export function render(renderer, scene, camera) {
  renderer.render(scene, camera);
}

/**
 * Set the renderer animation loop callback.
 * @param {THREE.WebGLRenderer} renderer
 * @param {(timestamp:number) => void} onFrame
 */
export function setAnimationLoop(renderer, onFrame) {
  renderer.setAnimationLoop(onFrame);
}

/**
 * Create a perspective camera
 * @param {number} fov - Field of view in degrees
 * @param {number} aspect - Aspect ratio
 * @param {number} near - Near clipping plane
 * @param {number} far - Far clipping plane
 * @returns {THREE.PerspectiveCamera}
 */
export function createPerspectiveCamera(fov, aspect, near, far) {
  return new THREE.PerspectiveCamera(fov, aspect, near, far);
}

/**
 * Create an orthographic camera
 * @param {number} left
 * @param {number} right
 * @param {number} top
 * @param {number} bottom
 * @param {number} near
 * @param {number} far
 * @returns {THREE.OrthographicCamera}
 */
export function createOrthographicCamera(left, right, top, bottom, near, far) {
  const camera = new THREE.OrthographicCamera(left, right, top, bottom, near, far);
  return camera;
}

/**
 * Create box geometry
 * @param {number} width
 * @param {number} height
 * @param {number} depth
 * @returns {THREE.BoxGeometry}
 */
export function createBoxGeometry(width, height, depth) {
  return new THREE.BoxGeometry(width, height, depth);
}

/**
 * Create sphere geometry
 * @param {number} radius
 * @param {number} widthSegments
 * @param {number} heightSegments
 * @returns {THREE.SphereGeometry}
 */
export function createSphereGeometry(radius, widthSegments, heightSegments) {
  return new THREE.SphereGeometry(radius, widthSegments, heightSegments);
}

/**
 * Create cone geometry
 * @param {number} radius
 * @param {number} height
 * @param {number} segments
 * @returns {THREE.ConeGeometry}
 */
export function createConeGeometry(radius, height, segments) {
  return new THREE.ConeGeometry(radius, height, segments);
}

/**
 * Create plane geometry
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
 * Create cylinder geometry
 * @param {number} radiusTop
 * @param {number} radiusBottom
 * @param {number} height
 * @param {number} radialSegments
 * @returns {THREE.CylinderGeometry}
 */
export function createCylinderGeometry(radiusTop, radiusBottom, height, radialSegments) {
  return new THREE.CylinderGeometry(radiusTop, radiusBottom, height, radialSegments);
}

/**
 * Create torus geometry
 * @param {number} radius
 * @param {number} tube
 * @param {number} radialSegments
 * @param {number} tubularSegments
 * @returns {THREE.TorusGeometry}
 */
export function createTorusGeometry(radius, tube, radialSegments, tubularSegments) {
  return new THREE.TorusGeometry(radius, tube, radialSegments, tubularSegments);
}

/**
 * Get THREE.FrontSide constant
 * @returns {number}
 */
export function getFrontSide() {
  return THREE.FrontSide;
}

/**
 * Get THREE.BackSide constant
 * @returns {number}
 */
export function getBackSide() {
  return THREE.BackSide;
}

/**
 * Get THREE.DoubleSide constant
 * @returns {number}
 */
export function getDoubleSide() {
  return THREE.DoubleSide;
}

/**
 * Create basic material
 * @param {number} color
 * @param {boolean} transparent
 * @param {number} opacity
 * @param {THREE.Texture|null} map
 * @param {number} side - THREE.js side constant (FrontSide, BackSide, DoubleSide)
 * @param {number} alphaTest
 * @param {boolean} depthWrite
 * @returns {THREE.MeshBasicMaterial}
 */
export function createBasicMaterial(color, transparent, opacity, map, side, alphaTest, depthWrite) {
  return new THREE.MeshBasicMaterial({
    color,
    transparent,
    opacity,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    side,
    alphaTest,
    depthWrite
  });
}

/**
 * Create standard material
 * @param {number} color
 * @param {number} metalness
 * @param {number} roughness
 * @param {THREE.Texture|null} map
 * @param {THREE.Texture|null} normalMap
 * @param {THREE.Texture|null} aoMap
 * @param {THREE.Texture|null} displacementMap
 * @param {number} displacementScale
 * @param {number} displacementBias
 * @param {THREE.Texture|null} roughnessMap
 * @param {THREE.Texture|null} metalnessMap
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
  const validMap = Option$isSome(map) ? Option$Some$0(map) : null;
  const validNormalMap = Option$isSome(normalMap) ? Option$Some$0(normalMap) : null;
  const validAoMap = Option$isSome(aoMap) ? Option$Some$0(aoMap) : null;
  const validDisplacementMap = Option$isSome(displacementMap) ? Option$Some$0(displacementMap) : null;
  const validRoughnessMap = Option$isSome(roughnessMap) ? Option$Some$0(roughnessMap) : null;
  const validMetalnessMap = Option$isSome(metalnessMap) ? Option$Some$0(metalnessMap) : null;

  const material = new THREE.MeshStandardMaterial({
    color,
    metalness,
    roughness,
    transparent,
    opacity,
    alphaTest,
    map: validMap,
    normalMap: validNormalMap,
    aoMap: validAoMap,
    displacementMap: validDisplacementMap,
    displacementBias,
    displacementScale,
    roughnessMap: validRoughnessMap,
    metalnessMap: validMetalnessMap,
    emissive,
    emissiveIntensity,
  });

  return material;
}

/**
 * Create phong material
 * @param {number} color
 * @param {number} shininess
 * @param {THREE.Texture|null} map
 * @param {THREE.Texture|null} normalMap
 * @param {THREE.Texture|null} aoMap
 * @param {boolean} transparent
 * @param {number} opacity
 * @param {number} alphaTest
 * @returns {THREE.MeshPhongMaterial}
 */
export function createPhongMaterial(color, shininess, map, normalMap, aoMap, transparent, opacity, alphaTest) {
  const validMap = Option$isSome(map) ? Option$Some$0(map) : null;
  const validNormalMap = Option$isSome(normalMap) ? Option$Some$0(normalMap) : null;
  const validAoMap = Option$isSome(aoMap) ? Option$Some$0(aoMap) : null;

  const material = new THREE.MeshPhongMaterial({
    color,
    shininess,
    map: validMap,
    normalMap: validNormalMap,
    aoMap: validAoMap,
    transparent,
    opacity,
    alphaTest
  });

  return material;
}

/**
 * Create lambert material
 * @param {number} color
 * @param {THREE.Texture|null} map
 * @param {THREE.Texture|null} normalMap
 * @param {THREE.Texture|null} aoMap
 * @returns {THREE.MeshLambertMaterial}
 */
export function createLambertMaterial(color, map, normalMap, aoMap, transparent, opacity, alphaTest,) {
  const validMap = Option$isSome(map) ? Option$Some$0(map) : null;
  const validNormalMap = Option$isSome(normalMap) ? Option$Some$0(normalMap) : null;
  const validAoMap = Option$isSome(aoMap) ? Option$Some$0(aoMap) : null;

  const material = new THREE.MeshLambertMaterial({
    color,
    map: validMap,
    normalMap: validNormalMap,
    aoMap: validAoMap,
    transparent,
    opacity,
    alphaTest,
  });

  return material;
}

/**
 * Create toon material
 * @param {number} color
 * @param {THREE.Texture|null} map
 * @param {THREE.Texture|null} normalMap
 * @param {THREE.Texture|null} aoMap
 * @param {boolean} transparent
 * @param {number} opacity
 * @param {number} alphaTest
 * @returns {THREE.MeshToonMaterial}
 */
export function createToonMaterial(color, map, normalMap, aoMap, transparent, opacity, alphaTest) {
  return new THREE.MeshToonMaterial({
    color,
    map: Option$isSome(map) ? Option$Some$0(map) : null,
    normalMap: Option$isSome(normalMap) ? Option$Some$0(normalMap) : null,
    aoMap: Option$isSome(aoMap) ? Option$Some$0(aoMap) : null,
    transparent,
    opacity,
    alphaTest
  });
}

/**
 * Create ambient light
 * @param {number} color
 * @param {number} intensity
 * @returns {THREE.AmbientLight}
 */
export function createAmbientLight(color, intensity) {
  return new THREE.AmbientLight(color, intensity);
}

/**
 * Create directional light
 * @param {number} color
 * @param {number} intensity
 * @param {boolean} castShadow
 * @param {number} shadowResolution
 * @param {number} shadowBias
 * @returns {THREE.DirectionalLight}
 */
export function createDirectionalLight(color, intensity) {
  return new THREE.DirectionalLight(color, intensity);
}

/**
 * Set whether a light casts shadows
 * @param {THREE.Light} light
 * @param {boolean} castShadow
 */
export function setLightCastShadow(light, castShadow) {
  light.castShadow = castShadow;
}

/**
 * Create point light
 * @param {number} color
 * @param {number} intensity
 * @param {number} distance
 * @param {boolean} castShadow
 * @param {number} shadowResolution
 * @param {number} shadowBias
 * @returns {THREE.PointLight}
 */
export function createPointLight(color, intensity, distance) {
  return new THREE.PointLight(color, intensity, distance);
}

/**
 * Create spot light
 * @param {number} color
 * @param {number} intensity
 * @param {number} distance
 * @param {number} angle
 * @param {number} penumbra
 * @param {boolean} castShadow
 * @param {number} shadowResolution
 * @param {number} shadowBias
 * @returns {THREE.SpotLight}
 */
export function createSpotLight(color, intensity, distance, angle, penumbra) {
  return new THREE.SpotLight(color, intensity, distance, angle, penumbra);
}

/**
 * Create hemisphere light
 * @param {number} skyColor
 * @param {number} groundColor
 * @param {number} intensity
 * @returns {THREE.HemisphereLight}
 */
export function createHemisphereLight(skyColor, groundColor, intensity) {
  return new THREE.HemisphereLight(skyColor, groundColor, intensity);
}

/**
 * Update light color
 * @param {THREE.Light} light
 * @param {number} color - Hex color value
 */
export function updateLightColor(light, color) {
  if (light.color) {
    light.color.setHex(color);
  }
}

/**
 * Update light intensity
 * @param {THREE.Light} light
 * @param {number} intensity
 */
export function updateLightIntensity(light, intensity) {
  light.intensity = intensity;
}

// ============================================================================
// OBJECTS
// ============================================================================

/**
 * Create a mesh
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.Mesh}
 */
export function createMesh(geometry) {
  const mesh = new THREE.Mesh(geometry);
  return mesh;
}

/**
 * Create a group
 * @returns {THREE.Group}
 */
export function createGroup() {
  return new THREE.Group();
}

/**
 * Add child to parent
 * @param {THREE.Object3D} parent
 * @param {THREE.Object3D} child
 */
export function addChild(parent, child) {
  parent.add(child);
}

/**
 * Remove child from parent
 * @param {THREE.Object3D} parent
 * @param {THREE.Object3D} child
 */
export function removeChild(parent, child) {
  parent.remove(child);
}

/**
 * Set position
 * @param {THREE.Object3D} object
 * @param {Vec3} position
 */
export function setPosition(object, position) {
  object.position.set(position.x, position.y, position.z);
  return object;
}

/**
 * Set scale
 * @param {THREE.Object3D} object
 * @param {Vec3} scale
 */
export function setScale(object, scale) {
  object.scale.set(scale.x, scale.y, scale.z);
  return object;
}

/**
 * Update camera projection matrix
 * @param {THREE.Camera} camera
 */
export function updateCameraProjectionMatrix(camera) {
  camera.updateProjectionMatrix();
}

/**
 * Set camera projection parameters for perspective camera
 * @param {THREE.PerspectiveCamera} camera
 * @param {number} fov
 * @param {number} aspect
 * @param {number} near
 * @param {number} far
 */
export function setPerspectiveCameraParams(camera, fov, aspect, near, far) {
  camera.fov = fov;
  camera.aspect = aspect;
  camera.near = near;
  camera.far = far;
}

/**
 * Set camera projection parameters for orthographic camera
 * @param {THREE.OrthographicCamera} camera
 * @param {number} left
 * @param {number} right
 * @param {number} top
 * @param {number} bottom
 * @param {number} near
 * @param {number} far
 */
export function updateOrthographicCamera(camera, left, right, top, bottom, near, far) {
  camera.left = left;
  camera.right = right;
  camera.top = top;
  camera.bottom = bottom;
  camera.near = near;
  camera.far = far;
}

/**
 * Get object material (if it has one)
 * @param {THREE.Object3D} object
 * @returns {THREE.Material|THREE.Material[]|undefined}
 */
export function getObjectMaterial(object) {
  // TODO: This may return undefined
  return object.material;
}

/**
 * Set object geometry
 * @param {THREE.Object3D} object
 * @param {THREE.BufferGeometry} geometry
 */
export function setObjectGeometry(object, geometry) {
  object.geometry = geometry;
}

/**
 * Set object material
 * @param {THREE.Object3D} object
 * @param {THREE.Material|THREE.Material[]} material
 */
export function setObjectMaterial(object, material) {
  object.material = material;
}

/**
 * Update material wireframe mode
 * @param {THREE.Material} material
 * @param {boolean} wireframe
 */
export function updateMaterialWireframe(material, wireframe) {
  if (material.wireframe !== undefined) {
    material.wireframe = wireframe;
    material.needsUpdate = true;
  }
}

/**
 * Set a texture on a named material property.
 * Property names use Three.js convention (e.g., "map", "normalMap", "aoMap").
 * @param {THREE.Material} material
 * @param {string} propertyName
 * @param {THREE.Texture} texture
 */
export function setMaterialTexture(material, propertyName, texture) {
  material[propertyName] = texture;
  material.needsUpdate = true;
}

/**
 * Update material rendering side.
 * @param {THREE.Material} material
 * @param {number} side - Three.js side constant (FrontSide=0, BackSide=1, DoubleSide=2)
 */
export function updateMaterialSide(material, side) {
  material.side = side;
  material.needsUpdate = true;
}

/**
 * Set object quaternion
 * @param {THREE.Object3D} object
 * @param {Quaternion} quaternion
 */
export function setObjectQuaternion(object, quaternion) {
  object.quaternion.set(quaternion.x, quaternion.y, quaternion.z, quaternion.w);
}

// ============================================================================
// OBJECT3D UTILITIES - Helper functions for working with loaded models
// ============================================================================

/**
 * Enable shadow casting and receiving on all meshes in an Object3D
 * @param {THREE.Object3D} object
 * @param {boolean} castShadow
 * @param {boolean} receiveShadow
 */
export function enableShadows(object, castShadow, receiveShadow) {
  object.traverse((child) => {
    if (child.isMesh) {
      child.castShadow = castShadow;
      child.receiveShadow = receiveShadow;
    }
  });
}

/**
 * Get the SRGB color space constant.
 * @returns {string}
 */
export function getSRGBColorSpace() {
  return THREE.SRGBColorSpace;
}

/**
 * Get the Linear SRGB color space constant.
 * @returns {string}
 */
export function getLinearSRGBColorSpace() {
  return THREE.LinearSRGBColorSpace;
}

/**
 * Set a texture's color space
 * @param {THREE.Texture} texture
 * @param {string} colorSpace - e.g. "srgb" for THREE.SRGBColorSpace
 */
export function setTextureColorSpace(texture, colorSpace) {
  texture.colorSpace = colorSpace;
  texture.needsUpdate = true;
}

/**
 * Dispose of a Three.js Material and free GPU memory
 * Includes all associated texture maps
 * @param {THREE.Material} material - The material to dispose
 */
export function disposeMaterial(material) {
  if (material) {
    // Dispose of material textures if they exist
    if (material.map) material.map.dispose();
    if (material.lightMap) material.lightMap.dispose();
    if (material.bumpMap) material.bumpMap.dispose();
    if (material.normalMap) material.normalMap.dispose();
    if (material.specularMap) material.specularMap.dispose();
    if (material.envMap) material.envMap.dispose();
    if (material.alphaMap) material.alphaMap.dispose();
    if (material.aoMap) material.aoMap.dispose();
    if (material.displacementMap) material.displacementMap.dispose();
    if (material.emissiveMap) material.emissiveMap.dispose();
    if (material.gradientMap) material.gradientMap.dispose();
    if (material.metalnessMap) material.metalnessMap.dispose();
    if (material.roughnessMap) material.roughnessMap.dispose();

    // Dispose of the material itself
    material.dispose();
  }
}

/**
 * Dispose of an Object3D recursively (geometry, materials, textures, children)
 * @param {THREE.Object3D} object - The object to dispose
 */
export function disposeObject3D(object) {
  if (!object) return;

  // Dispose geometry
  if (object.geometry) {
    object.geometry.dispose();
  }

  // Dispose material(s)
  if (object.material) {
    if (Array.isArray(object.material)) {
      object.material.forEach(material => disposeMaterial(material));
    } else {
      disposeMaterial(object.material);
    }
  }

  // Recursively dispose children
  if (object.children) {
    for (const child of object.children) {
      disposeObject3D(child);
    }
  }
}

// ============================================================================
// ASSET LOADING
// ============================================================================

/**
 * Load texture
 * @param {string} url
 * @returns {Promise<Result<THREE.Texture, undefined>>}
 */
export function loadTexture(url) {
  return new Promise((resolve) => {
    const loader = new THREE.TextureLoader();
    loader.load(
      url,
      (texture) => resolve(Result$Ok(texture)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Load STL model
 * @param {string} url
 * @returns {Promise<Result<THREE.BufferGeometry, undefined>>}
 */
export function loadSTL(url) {
  return new Promise((resolve) => {
    const loader = new STLLoader();
    loader.load(
      url,
      (geometry) => {
        // STL files don't contain normals - compute them for proper lighting
        geometry.computeVertexNormals();
        resolve(Result$Ok(geometry));
      },
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Center a geometry around its bounding box center.
 * Useful for STL/OBJ models that need to rotate around their geometric center.
 * @param {THREE.BufferGeometry} geometry
 * @returns {THREE.BufferGeometry} The same geometry (mutated), for chaining
 */
export function centerGeometry(geometry) {
  geometry.center();
  return geometry;
}

/**
 * Load GLTF model
 * @param {string} url
 * @returns {Promise<Result<Object, undefined>>}
 */
export function loadGLTF(url) {
  const loader = new GLTFLoader();
  return new Promise((resolve) => {
    loader.load(
      url,
      (gltf) => resolve(Result$Ok(gltf)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Load OBJ model
 * @param {string} url
 * @returns {Promise<Result<THREE.Group, undefined>>}
 */
export function loadOBJ(url) {
  const loader = new OBJLoader();
  return new Promise((resolve) => {
    loader.load(
      url,
      (obj) => resolve(Result$Ok(obj)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Load FBX model
 * @param {string} url
 * @returns {Promise<Result<THREE.Group, undefined>}
 */
export function loadFBX(url) {
  const loader = new FBXLoader();
  return new Promise((resolve) => {
    loader.load(
      url,
      (fbx) => resolve(Result$Ok(fbx)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Load a font definition compatible with TextGeometry.
 * @param {string} url
 * @returns {Promise<Result<Object, undefined>>}
 */
export function loadFont(url) {
  const loader = new FontLoader();
  return new Promise((resolve) => {
    loader.load(
      url,
      (font) => resolve(Result$Ok(font)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

// ============================================================================
// GLTF/FBX DATA ACCESSORS
// ============================================================================

/**
 * Get the scene from loaded GLTF data.
 * @param {Object} gltfData - GLTF data from GLTFLoader
 * @returns {THREE.Object3D} The root scene/group
 */
export function getGltfScene(gltfData) {
  return gltfData.scene;
}

/**
 * Get the scene from loaded FBX data.
 * FBX loader returns the scene directly as the root object.
 * @param {THREE.Object3D} fbxData - FBX data from FBXLoader
 * @returns {THREE.Object3D} The root scene/group
 */
export function getFbxScene(fbxData) {
  return fbxData;
}

/**
 * Load equirectangular texture (360° spherical texture)
 * @param {string} url
 * @returns {Promise<Result<THREE.Texture, undefined>>}
 */
export function loadEquirectangularTexture(url) {
  const loader = new THREE.TextureLoader();
  return new Promise((resolve) => {
    loader.load(
      url,
      (texture) => {
        texture.mapping = THREE.EquirectangularReflectionMapping;
        resolve(Result$Ok(texture));
      },
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Load cube texture (skybox)
 * @param {string[]} urls - Array of 6 URLs [px, nx, py, ny, pz, nz]
 * @returns {Promise<Result<THREE.CubeTexture, undefined>>}
 */
export function loadCubeTexture(urls) {
  const loader = new THREE.CubeTextureLoader();
  return new Promise((resolve) => {
    loader.load(
      urls,
      (cubeTexture) => resolve(Result$Ok(cubeTexture)),
      undefined,
      (_) => resolve(Result$Error())
    );
  });
}

/**
 * Create 3D text geometry from a loaded font.
 * @param {string} text
 * @param {Object} font
 * @param {number} size
 * @param {number} depth
 * @param {number} curveSegments
 * @param {boolean} bevelEnabled
 * @param {number} bevelThickness
 * @param {number} bevelSize
 * @returns {THREE.BufferGeometry}
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

// ============================================================================
// INSTANCE-SCOPED REGISTRY HELPERS
// ============================================================================

export function setObjectVisible(object, visible) {
  object.visible = visible;
}

export function setObjectName(object, name) {
  object.name = name;
}

/**
 * Replace an existing object's 3D model with a newly loaded one.
 * Preserves position, rotation, scale, and visibility from the old object.
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

  // Dispose old geometry/materials
  oldObject.traverse((obj) => {
    if (obj.geometry) obj.geometry.dispose();
    if (obj.material) {
      if (Array.isArray(obj.material))
        obj.material.forEach((m) => m.dispose());
      else obj.material.dispose();
    }
  });

  return newObject;
}

// ============================================================================
// 3D → SCREEN PROJECTION
// ============================================================================

// Reusable Vector3 to avoid per-frame allocation
