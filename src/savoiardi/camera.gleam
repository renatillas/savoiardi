import savoiardi/object.{type Object3D}

pub type Perspective

pub type Camera

pub type Orthographic

@external(javascript, "./camera.ffi.mjs", "createPerspective")
pub fn perspective(
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Perspective

@external(javascript, "./camera.ffi.mjs", "createOrthographic")
pub fn orthographic(
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "identity")
pub fn from_perspective(camera: Perspective) -> Camera

@external(javascript, "./camera.ffi.mjs", "identity")
pub fn from_orthographic(camera: Orthographic) -> Camera

@external(javascript, "./camera.ffi.mjs", "updateProjectionMatrix")
pub fn update_projection_matrix(camera: Camera) -> Camera

@external(javascript, "./camera.ffi.mjs", "updatePerspective")
pub fn update_perspective(
  camera: Perspective,
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Perspective

@external(javascript, "./camera.ffi.mjs", "updateOrthographic")
pub fn update_orthographic(
  camera: Orthographic,
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "identity")
pub fn to_object3d(camera: Camera) -> Object3D

@external(javascript, "./camera.ffi.mjs", "identity")
fn coerce_to_perspective_camera(object: Object3D) -> Perspective

@external(javascript, "./camera.ffi.mjs", "identity")
fn coerce_to_orthographic_camera(object: Object3D) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "isPerspectiveCamera")
pub fn is_perspective_camera(object: Object3D) -> Bool

@external(javascript, "./camera.ffi.mjs", "isOrthographicCamera")
pub fn is_orthographic_camera(object: Object3D) -> Bool

pub fn perspective_from_object3d(object: Object3D) -> Result(Perspective, Nil) {
  case is_perspective_camera(object) {
    True -> Ok(coerce_to_perspective_camera(object))
    False -> Error(Nil)
  }
}

pub fn orthographic_from_object3d(object: Object3D) -> Result(Orthographic, Nil) {
  case is_orthographic_camera(object) {
    True -> Ok(coerce_to_orthographic_camera(object))
    False -> Error(Nil)
  }
}

@external(javascript, "./camera.ffi.mjs", "getPerspectiveFov")
pub fn perspective_fov(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "setPerspectiveFov")
pub fn set_perspective_fov(camera: Perspective, fov: Float) -> Perspective

@external(javascript, "./camera.ffi.mjs", "getPerspectiveAspect")
pub fn perspective_aspect(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "setPerspectiveAspect")
pub fn set_perspective_aspect(camera: Perspective, aspect: Float) -> Perspective

@external(javascript, "./camera.ffi.mjs", "getZoom")
pub fn zoom(camera: Camera) -> Float

@external(javascript, "./camera.ffi.mjs", "getNear")
pub fn near(camera: Camera) -> Float

@external(javascript, "./camera.ffi.mjs", "setNear")
pub fn set_near(camera: Camera, near: Float) -> Camera

@external(javascript, "./camera.ffi.mjs", "getFar")
pub fn far(camera: Camera) -> Float

@external(javascript, "./camera.ffi.mjs", "setFar")
pub fn set_far(camera: Camera, far: Float) -> Camera

@external(javascript, "./camera.ffi.mjs", "setViewOffset")
pub fn set_view_offset(
  camera: Camera,
  full_width full_width: Int,
  full_height full_height: Int,
  x x: Int,
  y y: Int,
  width width: Int,
  height height: Int,
) -> Camera

@external(javascript, "./camera.ffi.mjs", "clearViewOffset")
pub fn clear_view_offset(camera: Camera) -> Camera

@external(javascript, "./camera.ffi.mjs", "setPerspectiveFocalLength")
pub fn set_perspective_focal_length(
  camera: Perspective,
  focal_length: Float,
) -> Perspective

@external(javascript, "./camera.ffi.mjs", "getPerspectiveFocalLength")
pub fn perspective_focal_length(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "getPerspectiveEffectiveFOV")
pub fn perspective_effective_fov(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "getPerspectiveFilmWidth")
pub fn perspective_film_width(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "getPerspectiveFilmHeight")
pub fn perspective_film_height(camera: Perspective) -> Float

@external(javascript, "./camera.ffi.mjs", "setPerspectiveFilmGauge")
pub fn set_perspective_film_gauge(
  camera: Perspective,
  film_gauge: Float,
) -> Perspective

@external(javascript, "./camera.ffi.mjs", "setPerspectiveFilmOffset")
pub fn set_perspective_film_offset(
  camera: Perspective,
  film_offset: Float,
) -> Perspective

@external(javascript, "./camera.ffi.mjs", "getOrthographicLeft")
pub fn orthographic_left(camera: Orthographic) -> Float

@external(javascript, "./camera.ffi.mjs", "setOrthographicLeft")
pub fn set_orthographic_left(camera: Orthographic, left: Float) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "getOrthographicRight")
pub fn orthographic_right(camera: Orthographic) -> Float

@external(javascript, "./camera.ffi.mjs", "setOrthographicRight")
pub fn set_orthographic_right(
  camera: Orthographic,
  right: Float,
) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "getOrthographicTop")
pub fn orthographic_top(camera: Orthographic) -> Float

@external(javascript, "./camera.ffi.mjs", "setOrthographicTop")
pub fn set_orthographic_top(camera: Orthographic, top: Float) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "getOrthographicBottom")
pub fn orthographic_bottom(camera: Orthographic) -> Float

@external(javascript, "./camera.ffi.mjs", "setOrthographicBottom")
pub fn set_orthographic_bottom(
  camera: Orthographic,
  bottom: Float,
) -> Orthographic

@external(javascript, "./camera.ffi.mjs", "setZoom")
pub fn set_zoom(camera: Camera, zoom: Float) -> Camera
