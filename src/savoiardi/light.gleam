import gleam/bool
import savoiardi/object.{type Object3D}

pub type Light

@external(javascript, "./light.ffi.mjs", "createAmbientLight")
pub fn ambient(color color: Int, intensity intensity: Float) -> Light

@external(javascript, "./light.ffi.mjs", "createDirectionalLight")
pub fn directional(color color: Int, intensity intensity: Float) -> Light

@external(javascript, "./light.ffi.mjs", "createPointLight")
pub fn point(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
) -> Light

@external(javascript, "./light.ffi.mjs", "createSpotLight")
pub fn spot(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
  angle angle: Float,
  penumbra penumbra: Float,
) -> Light

@external(javascript, "./light.ffi.mjs", "createHemisphereLight")
pub fn hemisphere(
  sky_color sky_color: Int,
  ground_color ground_color: Int,
  intensity intensity: Float,
) -> Light

@external(javascript, "./light.ffi.mjs", "setLightCastShadow")
pub fn set_cast_shadow(light: Light, cast_shadow: Bool) -> Light

@external(javascript, "./light.ffi.mjs", "updateLightColor")
pub fn set_color(light: Light, color: Int) -> Light

@external(javascript, "./light.ffi.mjs", "updateLightIntensity")
pub fn set_intensity(light: Light, intensity: Float) -> Light

@external(javascript, "./light.ffi.mjs", "identity")
pub fn to_object3d(light: Light) -> Object3D

pub fn from_object3d(object: Object3D) -> Result(Light, Nil) {
  use <- bool.guard(when: !is_light(object), return: Error(Nil))
  Ok(cast_to_object3d(object))
}

@external(javascript, "./light.ffi.mjs", "identity")
fn cast_to_object3d(object: Object3D) -> Light

@external(javascript, "./light.ffi.mjs", "isLight")
fn is_light(object: Object3D) -> Bool
