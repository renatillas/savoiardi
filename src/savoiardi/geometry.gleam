import gleam/javascript/promise.{type Promise}

pub type Geometry

pub type Font

@external(javascript, "../savoiardi.ffi.mjs", "createBoxGeometry")
pub fn box(
  width width: Float,
  height height: Float,
  depth depth: Float,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "createSphereGeometry")
pub fn sphere(
  radius radius: Float,
  width_segments width_segments: Int,
  height_segments height_segments: Int,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "createConeGeometry")
pub fn cone(
  radius radius: Float,
  height height: Float,
  segments segments: Int,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "createPlaneGeometry")
pub fn plane(
  width width: Float,
  height height: Float,
  widht_segments width_segments: Int,
  height_segments height_segments: Int,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "createCylinderGeometry")
pub fn cylinder(
  top_radius top_radius: Float,
  bottom_radius bottom_radius: Float,
  height height: Float,
  segments segments: Int,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "createTorusGeometry")
pub fn torus(
  radius: Float,
  tube: Float,
  radial_segments: Int,
  tubular_segments: Int,
) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "centerGeometry")
pub fn center(geometry: Geometry) -> Geometry

@external(javascript, "../savoiardi.ffi.mjs", "loadSTL")
pub fn load_stl(url: String) -> Promise(Result(Geometry, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "loadFont")
pub fn load_font(url: String) -> Promise(Result(Font, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "createTextGeometry")
pub fn text(
  text: String,
  font: Font,
  size: Float,
  depth: Float,
  curve_segments: Int,
  bevel_enabled: Bool,
  bevel_thickness: Float,
  bevel_size: Float,
) -> Geometry
