import gleam/javascript/array
import gleam/javascript/promise.{type Promise}
import quaternion.{type Quaternion}
import savoiardi
import savoiardi/geometry.{type Geometry}
import savoiardi/loader.{type FBXLoader, type GLTFLoader, type OBJLoader}
import savoiardi/material.{type Material}
import vec/vec3.{type Vec3}

pub type Object3D

pub type GLTFData

pub type FBXData

@external(javascript, "./object.ffi.mjs", "createGroup")
pub fn group() -> Object3D

@external(javascript, "./object.ffi.mjs", "createMesh")
pub fn mesh(geometry: Geometry, material: Material) -> Object3D

@external(javascript, "./object.ffi.mjs", "addChild")
pub fn add_child(parent parent: Object3D, child child: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "removeChild")
pub fn remove_child(parent parent: Object3D, child child: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "attachChild")
pub fn attach_child(parent parent: Object3D, child child: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "removeFromParent")
pub fn remove_from_parent(object: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "disposeObject3D")
pub fn dispose(object: Object3D) -> Nil

@external(javascript, "./object.ffi.mjs", "replaceObjectModel")
pub fn replace_model(
  old_object: Object3D,
  new_object: Object3D,
  name: String,
) -> Object3D

@external(javascript, "./object.ffi.mjs", "setPosition")
pub fn set_position(object: Object3D, position: Vec3(Float)) -> Object3D

@external(javascript, "./object.ffi.mjs", "getPosition")
pub fn get_position(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "lookAt")
pub fn look_at(object: Object3D, target: Vec3(Float)) -> Object3D

@external(javascript, "./object.ffi.mjs", "setScale")
pub fn set_scale(object: Object3D, scale: Vec3(Float)) -> Object3D

@external(javascript, "./object.ffi.mjs", "getScale")
pub fn get_scale(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "setRotation")
pub fn set_rotation(object: Object3D, rotation: Vec3(Float)) -> Object3D

@external(javascript, "./object.ffi.mjs", "getRotation")
pub fn get_rotation(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "rotateX")
pub fn rotate_x(object: Object3D, angle: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "rotateY")
pub fn rotate_y(object: Object3D, angle: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "rotateZ")
pub fn rotate_z(object: Object3D, angle: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "setQuaternion")
pub fn set_quaternion(object: Object3D, quaternion: Quaternion) -> Object3D

@external(javascript, "./object.ffi.mjs", "getQuaternion")
pub fn get_quaternion(object: Object3D) -> Quaternion

@external(javascript, "./object.ffi.mjs", "getObjectMaterial")
pub fn get_material(object: Object3D) -> Material

@external(javascript, "./object.ffi.mjs", "setObjectGeometry")
pub fn set_geometry(object: Object3D, geometry: Geometry) -> Object3D

@external(javascript, "./object.ffi.mjs", "setObjectMaterial")
pub fn set_material(object: Object3D, material: Material) -> Object3D

@external(javascript, "./object.ffi.mjs", "setObjectCastShadow")
pub fn set_cast_shadow(object: Object3D, cast_shadow: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "setObjectReceiveShadow")
pub fn set_receive_shadow(object: Object3D, receive_shadow: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "setObjectVisible")
pub fn set_visible(object: Object3D, visible: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "isObjectVisible")
pub fn is_visible(object: Object3D) -> Bool

@external(javascript, "./object.ffi.mjs", "setObjectName")
pub fn set_name(object: Object3D, name: String) -> Object3D

@external(javascript, "./object.ffi.mjs", "getObjectName")
pub fn get_name(object: Object3D) -> String

@external(javascript, "./object.ffi.mjs", "getObjectId")
pub fn id(object: Object3D) -> Int

@external(javascript, "./object.ffi.mjs", "getObjectUuid")
pub fn uuid(object: Object3D) -> String

pub fn children(object: Object3D) -> List(Object3D) {
  get_children_array(object)
  |> array.to_list
}

@external(javascript, "./object.ffi.mjs", "getObjectChildren")
fn get_children_array(object: Object3D) -> array.Array(Object3D)

@external(javascript, "./object.ffi.mjs", "cloneObject")
pub fn clone(object: Object3D, recursive: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "copyObject")
pub fn copy(object: Object3D, source: Object3D, recursive: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "setFrustumCulled")
pub fn set_frustum_culled(object: Object3D, frustum_culled: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "setRenderOrder")
pub fn set_render_order(object: Object3D, render_order: Int) -> Object3D

@external(javascript, "./object.ffi.mjs", "setMatrixAutoUpdate")
pub fn set_matrix_auto_update(
  object: Object3D,
  matrix_auto_update: Bool,
) -> Object3D

@external(javascript, "./object.ffi.mjs", "setMatrixWorldAutoUpdate")
pub fn set_matrix_world_auto_update(
  object: Object3D,
  matrix_world_auto_update: Bool,
) -> Object3D

@external(javascript, "./object.ffi.mjs", "clearChildren")
pub fn clear(object: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "getObjectParent")
pub fn get_parent(object: Object3D) -> Result(Object3D, Nil)

@external(javascript, "./object.ffi.mjs", "translateX")
pub fn translate_x(object: Object3D, distance: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "translateY")
pub fn translate_y(object: Object3D, distance: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "translateZ")
pub fn translate_z(object: Object3D, distance: Float) -> Object3D

@external(javascript, "./object.ffi.mjs", "updateMatrix")
pub fn update_matrix(object: Object3D) -> Object3D

@external(javascript, "./object.ffi.mjs", "updateMatrixWorld")
pub fn update_matrix_world(object: Object3D, force: Bool) -> Object3D

@external(javascript, "./object.ffi.mjs", "updateWorldMatrix")
pub fn update_world_matrix(
  object: Object3D,
  update_parents: Bool,
  update_children: Bool,
) -> Object3D

@external(javascript, "./object.ffi.mjs", "getWorldPosition")
pub fn get_world_position(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "getWorldQuaternion")
pub fn get_world_quaternion(object: Object3D) -> Quaternion

@external(javascript, "./object.ffi.mjs", "getWorldScale")
pub fn get_world_scale(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "getWorldDirection")
pub fn get_world_direction(object: Object3D) -> Vec3(Float)

@external(javascript, "./object.ffi.mjs", "getObjectById")
pub fn get_by_id(object: Object3D, id: Int) -> Result(Object3D, Nil)

@external(javascript, "./object.ffi.mjs", "getObjectByName")
pub fn get_by_name(object: Object3D, name: String) -> Result(Object3D, Nil)

@external(javascript, "./object.ffi.mjs", "getObjectByProperty")
pub fn get_by_property(
  object: Object3D,
  property_name: String,
  value: String,
) -> Result(Object3D, Nil)

pub fn get_all_by_property(
  object: Object3D,
  property_name: String,
  value: String,
) -> List(Object3D) {
  get_all_by_property_array(object, property_name, value)
  |> array.to_list
}

@external(javascript, "./object.ffi.mjs", "getObjectsByProperty")
fn get_all_by_property_array(
  object: Object3D,
  property_name: String,
  value: String,
) -> array.Array(Object3D)

@external(javascript, "./object.ffi.mjs", "traverseObject")
pub fn traverse(object: Object3D, visit: fn(Object3D) -> Nil) -> Nil

@external(javascript, "./object.ffi.mjs", "traverseVisibleObject")
pub fn traverse_visible(object: Object3D, visit: fn(Object3D) -> Nil) -> Nil

@external(javascript, "./object.ffi.mjs", "traverseAncestorsObject")
pub fn traverse_ancestors(object: Object3D, visit: fn(Object3D) -> Nil) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_gltf(
  loader: GLTFLoader,
  url: String,
  on_result: fn(Result(GLTFData, savoiardi.LoadError)) -> Nil,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_gltf_async(
  loader: GLTFLoader,
  url: String,
) -> Promise(Result(GLTFData, savoiardi.LoadError))

@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_obj(
  loader: OBJLoader,
  url: String,
  on_result: fn(Result(Object3D, savoiardi.LoadError)) -> Nil,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_obj_async(
  loader: OBJLoader,
  url: String,
) -> Promise(Result(Object3D, savoiardi.LoadError))

@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_fbx(
  loader: FBXLoader,
  url: String,
  on_result: fn(Result(FBXData, savoiardi.LoadError)) -> Nil,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_fbx_async(
  loader: FBXLoader,
  url: String,
) -> Promise(Result(FBXData, savoiardi.LoadError))

@external(javascript, "./object.ffi.mjs", "getGltfScene")
pub fn get_gltf_scene(data: GLTFData) -> Object3D

@external(javascript, "./object.ffi.mjs", "getFbxScene")
pub fn get_fbx_scene(data: FBXData) -> Object3D
