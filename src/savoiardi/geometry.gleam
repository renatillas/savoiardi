//// Geometry construction and geometry asset loading.
////
//// This module provides constructors for common primitive meshes together with
//// helpers for text and STL geometry loading.

import gleam/javascript/promise.{type Promise}
import savoiardi/loader.{type FontLoader, type STLLoader}
import vec/vec3.{type Vec3}

/// A mesh geometry.
pub type Geometry

/// A font loaded for use with text geometry.
pub type Font

/// Creates a box geometry.
@external(javascript, "./geometry.ffi.mjs", "createBoxGeometry")
pub fn box(
  width width: Float,
  height height: Float,
  depth depth: Float,
) -> Geometry

/// Creates a sphere geometry.
@external(javascript, "./geometry.ffi.mjs", "createSphereGeometry")
pub fn sphere(
  radius radius: Float,
  width_segments width_segments: Int,
  height_segments height_segments: Int,
) -> Geometry

/// Creates a circle geometry.
@external(javascript, "./geometry.ffi.mjs", "createCircleGeometry")
pub fn circle(radius radius: Float, segments segments: Int) -> Geometry

/// Creates a cone geometry.
@external(javascript, "./geometry.ffi.mjs", "createConeGeometry")
pub fn cone(
  radius radius: Float,
  height height: Float,
  segments segments: Int,
) -> Geometry

/// Creates a plane geometry.
@external(javascript, "./geometry.ffi.mjs", "createPlaneGeometry")
pub fn plane(
  width width: Float,
  height height: Float,
  width_segments width_segments: Int,
  height_segments height_segments: Int,
) -> Geometry

/// Creates a cylinder geometry.
@external(javascript, "./geometry.ffi.mjs", "createCylinderGeometry")
pub fn cylinder(
  top_radius top_radius: Float,
  bottom_radius bottom_radius: Float,
  height height: Float,
  segments segments: Int,
) -> Geometry

/// Creates a torus geometry.
@external(javascript, "./geometry.ffi.mjs", "createTorusGeometry")
pub fn torus(
  radius radius: Float,
  tube tube: Float,
  radial_segments radial_segments: Int,
  tubular_segments tubular_segments: Int,
) -> Geometry

/// Creates a ring geometry.
@external(javascript, "./geometry.ffi.mjs", "createRingGeometry")
pub fn ring(
  inner_radius inner_radius: Float,
  outer_radius outer_radius: Float,
  segments segments: Int,
) -> Geometry

/// Creates a torus knot geometry.
@external(javascript, "./geometry.ffi.mjs", "createTorusKnotGeometry")
pub fn torus_knot(
  radius radius: Float,
  tube tube: Float,
  tubular_segments tubular_segments: Int,
  radial_segments radial_segments: Int,
) -> Geometry

/// Creates a capsule geometry.
@external(javascript, "./geometry.ffi.mjs", "createCapsuleGeometry")
pub fn capsule(
  radius radius: Float,
  length length: Float,
  cap_segments cap_segments: Int,
  radial_segments radial_segments: Int,
) -> Geometry

/// Creates a line geometry from a list of points.
@external(javascript, "./geometry.ffi.mjs", "createLinePointsGeometry")
pub fn line_points(points: List(Vec3(Float))) -> Geometry

/// Centers a geometry around its origin.
@external(javascript, "./geometry.ffi.mjs", "centerGeometry")
pub fn center(geometry: Geometry) -> Geometry

/// Computes vertex normals for a geometry.
@external(javascript, "./geometry.ffi.mjs", "computeVertexNormals")
pub fn compute_vertex_normals(geometry: Geometry) -> Geometry

/// Normalizes the existing normals of a geometry.
@external(javascript, "./geometry.ffi.mjs", "normalizeNormals")
pub fn normalize_normals(geometry: Geometry) -> Geometry

/// Computes the bounding box of a geometry.
@external(javascript, "./geometry.ffi.mjs", "computeBoundingBox")
pub fn compute_bounding_box(geometry: Geometry) -> Geometry

/// Computes the bounding sphere of a geometry.
@external(javascript, "./geometry.ffi.mjs", "computeBoundingSphere")
pub fn compute_bounding_sphere(geometry: Geometry) -> Geometry

/// Loads STL geometry and reports the result through a callback.
@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_stl(
  loader: STLLoader,
  url url: String,
  on_result on_result: fn(Result(Geometry, loader.LoadError)) -> Nil,
) -> Nil

/// Loads STL geometry asynchronously.
@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_stl_async(
  loader: STLLoader,
  url url: String,
) -> Promise(Result(Geometry, loader.LoadError))

/// Loads a font and reports the result through a callback.
@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_font(
  loader: FontLoader,
  url url: String,
  on_result on_result: fn(Result(Font, loader.LoadError)) -> Nil,
) -> Nil

/// Loads a font asynchronously.
@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_font_async(
  loader: FontLoader,
  url url: String,
) -> Promise(Result(Font, loader.LoadError))

/// Creates text geometry from a loaded font.
@external(javascript, "./geometry.ffi.mjs", "createTextGeometry")
pub fn text(
  text text: String,
  font font: Font,
  size size: Float,
  depth depth: Float,
  curve_segments curve_segments: Int,
  bevel_enabled bevel_enabled: Bool,
  bevel_thickness bevel_thickness: Float,
  bevel_size bevel_size: Float,
) -> Geometry
