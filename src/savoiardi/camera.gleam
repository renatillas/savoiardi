//// Perspective and orthographic cameras.
////
//// Savoiardi exposes typed camera variants together with safe downcasts and
//// common projection and lens controls.

import savoiardi/object.{type Object3D}

/// A perspective camera.
pub type Perspective

/// A camera viewed through the shared camera API.
pub type Camera

/// An orthographic camera.
pub type Orthographic

/// Creates a perspective camera.
@external(javascript, "./camera.ffi.mjs", "createPerspective")
pub fn perspective(
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Perspective

/// Creates an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "createOrthographic")
pub fn orthographic(
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Orthographic

/// Widens a perspective camera into the shared camera type.
@external(javascript, "./camera.ffi.mjs", "identity")
pub fn from_perspective(camera: Perspective) -> Camera

/// Widens an orthographic camera into the shared camera type.
@external(javascript, "./camera.ffi.mjs", "identity")
pub fn from_orthographic(camera: Orthographic) -> Camera

/// Recomputes the projection matrix after camera changes.
@external(javascript, "./camera.ffi.mjs", "updateProjectionMatrix")
pub fn update_projection_matrix(camera: Camera) -> Camera

/// Updates the core projection values of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "updatePerspective")
pub fn update_perspective(
  camera: Perspective,
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Perspective

/// Updates the core projection values of an orthographic camera.
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

/// Views a camera as an object.
@external(javascript, "./camera.ffi.mjs", "identity")
pub fn to_object3d(camera: Camera) -> Object3D

@external(javascript, "./camera.ffi.mjs", "identity")
fn coerce_to_perspective_camera(object: Object3D) -> Perspective

@external(javascript, "./camera.ffi.mjs", "identity")
fn coerce_to_orthographic_camera(object: Object3D) -> Orthographic

/// Returns whether an object is a perspective camera.
@external(javascript, "./camera.ffi.mjs", "isPerspectiveCamera")
pub fn is_perspective_camera(object: Object3D) -> Bool

/// Returns whether an object is an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "isOrthographicCamera")
pub fn is_orthographic_camera(object: Object3D) -> Bool

/// Safely downcasts an object to a perspective camera.
pub fn perspective_from_object3d(object: Object3D) -> Result(Perspective, Nil) {
  case is_perspective_camera(object) {
    True -> Ok(coerce_to_perspective_camera(object))
    False -> Error(Nil)
  }
}

/// Safely downcasts an object to an orthographic camera.
pub fn orthographic_from_object3d(object: Object3D) -> Result(Orthographic, Nil) {
  case is_orthographic_camera(object) {
    True -> Ok(coerce_to_orthographic_camera(object))
    False -> Error(Nil)
  }
}

/// Reads the field of view of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveFov")
pub fn perspective_fov(camera: Perspective) -> Float

/// Sets the field of view of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "setPerspectiveFov")
pub fn set_perspective_fov(camera: Perspective, fov: Float) -> Perspective

/// Reads the aspect ratio of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveAspect")
pub fn perspective_aspect(camera: Perspective) -> Float

/// Sets the aspect ratio of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "setPerspectiveAspect")
pub fn set_perspective_aspect(camera: Perspective, aspect: Float) -> Perspective

/// Reads the zoom factor of a camera.
@external(javascript, "./camera.ffi.mjs", "getZoom")
pub fn zoom(camera: Camera) -> Float

/// Reads the near clipping plane of a camera.
@external(javascript, "./camera.ffi.mjs", "getNear")
pub fn near(camera: Camera) -> Float

/// Sets the near clipping plane of a camera.
@external(javascript, "./camera.ffi.mjs", "setNear")
pub fn set_near(camera: Camera, near: Float) -> Camera

/// Reads the far clipping plane of a camera.
@external(javascript, "./camera.ffi.mjs", "getFar")
pub fn far(camera: Camera) -> Float

/// Sets the far clipping plane of a camera.
@external(javascript, "./camera.ffi.mjs", "setFar")
pub fn set_far(camera: Camera, far: Float) -> Camera

/// Sets a view offset for tiled or multi-window rendering.
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

/// Clears any configured view offset.
@external(javascript, "./camera.ffi.mjs", "clearViewOffset")
pub fn clear_view_offset(camera: Camera) -> Camera

/// Sets the focal length of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "setPerspectiveFocalLength")
pub fn set_perspective_focal_length(
  camera: Perspective,
  focal_length: Float,
) -> Perspective

/// Reads the focal length of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveFocalLength")
pub fn perspective_focal_length(camera: Perspective) -> Float

/// Reads the effective field of view of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveEffectiveFOV")
pub fn perspective_effective_fov(camera: Perspective) -> Float

/// Reads the film width of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveFilmWidth")
pub fn perspective_film_width(camera: Perspective) -> Float

/// Reads the film height of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "getPerspectiveFilmHeight")
pub fn perspective_film_height(camera: Perspective) -> Float

/// Sets the film gauge of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "setPerspectiveFilmGauge")
pub fn set_perspective_film_gauge(
  camera: Perspective,
  film_gauge: Float,
) -> Perspective

/// Sets the film offset of a perspective camera.
@external(javascript, "./camera.ffi.mjs", "setPerspectiveFilmOffset")
pub fn set_perspective_film_offset(
  camera: Perspective,
  film_offset: Float,
) -> Perspective

/// Reads the left bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "getOrthographicLeft")
pub fn orthographic_left(camera: Orthographic) -> Float

/// Sets the left bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "setOrthographicLeft")
pub fn set_orthographic_left(camera: Orthographic, left: Float) -> Orthographic

/// Reads the right bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "getOrthographicRight")
pub fn orthographic_right(camera: Orthographic) -> Float

/// Sets the right bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "setOrthographicRight")
pub fn set_orthographic_right(
  camera: Orthographic,
  right: Float,
) -> Orthographic

/// Reads the top bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "getOrthographicTop")
pub fn orthographic_top(camera: Orthographic) -> Float

/// Sets the top bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "setOrthographicTop")
pub fn set_orthographic_top(camera: Orthographic, top: Float) -> Orthographic

/// Reads the bottom bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "getOrthographicBottom")
pub fn orthographic_bottom(camera: Orthographic) -> Float

/// Sets the bottom bound of an orthographic camera.
@external(javascript, "./camera.ffi.mjs", "setOrthographicBottom")
pub fn set_orthographic_bottom(
  camera: Orthographic,
  bottom: Float,
) -> Orthographic

/// Sets the zoom factor of a camera.
@external(javascript, "./camera.ffi.mjs", "setZoom")
pub fn set_zoom(camera: Camera, zoom: Float) -> Camera
