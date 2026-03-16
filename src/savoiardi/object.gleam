import gleam/javascript/promise.{type Promise}
import quaternion.{type Quaternion}
import savoiardi/geometries.{type Geometry}
import savoiardi/materials.{type Material}
import vec/vec3.{type Vec3}

pub type Object3D

pub type GLTFData

pub type FBXData

@external(javascript, "../savoiardi.ffi.mjs", "createGroup")
pub fn group() -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "createMesh")
pub fn mesh(geometry: Geometry) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "addChild")
pub fn add_child(parent parent: Object3D, child child: Object3D) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "removeChild")
pub fn remove_child(parent parent: Object3D, child child: Object3D) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "disposeObject3D")
pub fn dispose(object: Object3D) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "replaceObjectModel")
pub fn replace_model(
  old_object: Object3D,
  new_object: Object3D,
  name: String,
) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "setPosition")
pub fn set_position(object: Object3D, position: Vec3(Float)) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "setScale")
pub fn set_scale(object: Object3D, scale: Vec3(Float)) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "setObjectQuaternion")
pub fn set_quaternion(object: Object3D, quaternion: Quaternion) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "getObjectMaterial")
pub fn get_material(object: Object3D) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "setObjectGeometry")
pub fn set_geometry(object: Object3D, geometry: Geometry) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setObjectMaterial")
pub fn set_material(object: Object3D, material: Material) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "enableShadows")
pub fn set_shadows(
  object: Object3D,
  cast_shadow cast_shadow: Bool,
  receive_shadow receive_shadow: Bool,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setObjectVisible")
pub fn set_object_visible(object: Object3D, visible: Bool) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setObjectName")
pub fn set_object_name(object: Object3D, name: String) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadGLTF")
pub fn load_gltf(url: String) -> Promise(Result(GLTFData, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "loadOBJ")
pub fn load_obj(url: String) -> Promise(Result(Object3D, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "loadFBX")
pub fn load_fbx(url: String) -> Promise(Result(FBXData, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "getGltfScene")
pub fn get_gltf_scene(data: GLTFData) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "getFbxScene")
pub fn get_fbx_scene(data: FBXData) -> Object3D
