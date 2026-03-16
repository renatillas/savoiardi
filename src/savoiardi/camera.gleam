import savoiardi/object.{type Object3D}

pub type Camera

@external(javascript, "../savoiardi.ffi.mjs", "createPerspectiveCamera")
pub fn new_perspective(
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "../savoiardi.ffi.mjs", "createOrthographicCamera")
pub fn new_orthographic(
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Camera

@external(javascript, "../savoiardi.ffi.mjs", "updateCameraProjectionMatrix")
pub fn update_projection_matrix(camera: Camera) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setPerspectiveCameraParams")
pub fn update_perspective(
  camera: Camera,
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "updateOrthographicCamera")
pub fn update_orthographic(
  camera: Camera,
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn to_object3d(camera: Camera) -> Object3D

// TODO: This should return a result by doing an assertion
@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn from_object3d(object: Object3D) -> Camera
