import gleam/bool
import savoiardi/object.{type Object3D}

pub type Camera

@external(javascript, "./camera.ffi.mjs", "createPerspectiveCamera")
pub fn perspective(
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "./camera.ffi.mjs", "createOrthographicCamera")
pub fn orthographic(
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "./camera.ffi.mjs", "updateCameraProjectionMatrix")
pub fn update_projection_matrix(camera: Camera) -> Camera

@external(javascript, "./camera.ffi.mjs", "setPerspectiveCameraParams")
pub fn update_perspective(
  camera: Camera,
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "./camera.ffi.mjs", "updateOrthographicCamera")
pub fn update_orthographic(
  camera: Camera,
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "./camera.ffi.mjs", "identity")
pub fn to_object3d(camera: Camera) -> Object3D

pub fn from_object3d(object: Object3D) -> Result(Camera, Nil) {
  use <- bool.guard(when: !is_camera(object), return: Error(Nil))
  Ok(cast_to_object3d(object))
}

@external(javascript, "./camera.ffi.mjs", "identity")
fn cast_to_object3d(object: Object3D) -> Camera

@external(javascript, "./camera.ffi.mjs", "isCamera")
fn is_camera(object: Object3D) -> Bool
