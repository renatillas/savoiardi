import savoiardi/object.{type Object3D}

pub type Light

@external(javascript, "../savoiardi.ffi.mjs", "createAmbientLight")
pub fn ambient(color color: Int, intensity intensity: Float) -> Light

@external(javascript, "../savoiardi.ffi.mjs", "createDirectionalLight")
pub fn directional(color color: Int, intensity intensity: Float) -> Light

@external(javascript, "../savoiardi.ffi.mjs", "createPointLight")
pub fn point(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
) -> Light

@external(javascript, "../savoiardi.ffi.mjs", "createSpotLight")
pub fn spot(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
  angle angle: Float,
  penumbra penumbra: Float,
) -> Light

@external(javascript, "../savoiardi.ffi.mjs", "createHemisphereLight")
pub fn hemisphere(
  sky_color sky_color: Int,
  ground_color ground_color: Int,
  intensity intensity: Float,
) -> Light

@external(javascript, "../savoiardi.ffi.mjs", "setLightCastShadow")
pub fn set_cast_shadow(light: Light, cast_shadow: Bool) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "updateLightColor")
pub fn set_color(light: Light, color: Int) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "updateLightIntensity")
pub fn set_intensity(light: Light, intensity: Float) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn to_object3d(light: Light) -> Object3D

@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn from_object3d(object: Object3D) -> Light
