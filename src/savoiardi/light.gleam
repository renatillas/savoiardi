import gleam/bool
import savoiardi/object.{type Object3D}

pub type Light

pub type DirectionalLight

pub type PointLight

pub type SpotLight

pub type HemisphereLight

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

pub fn directional_from_light(light: Light) -> Result(DirectionalLight, Nil) {
  use <- bool.guard(when: !is_directional_light(light), return: Error(Nil))
  Ok(coerce(light))
}

@external(javascript, "./light.ffi.mjs", "identity")
pub fn directional_to_light(light: DirectionalLight) -> Light

@external(javascript, "./light.ffi.mjs", "identity")
pub fn directional_to_object3d(light: DirectionalLight) -> Object3D

@external(javascript, "./light.ffi.mjs", "setDirectionalLightTarget")
pub fn directional_set_target(
  light: DirectionalLight,
  target: Object3D,
) -> DirectionalLight

@external(javascript, "./light.ffi.mjs", "getDirectionalLightTarget")
pub fn directional_get_target(light: DirectionalLight) -> Object3D

pub fn point_from_light(light: Light) -> Result(PointLight, Nil) {
  use <- bool.guard(when: !is_point_light(light), return: Error(Nil))
  Ok(coerce(light))
}

@external(javascript, "./light.ffi.mjs", "identity")
pub fn point_to_light(light: PointLight) -> Light

@external(javascript, "./light.ffi.mjs", "identity")
pub fn point_to_object3d(light: PointLight) -> Object3D

@external(javascript, "./light.ffi.mjs", "setPointLightDistance")
pub fn point_set_distance(light: PointLight, distance: Float) -> PointLight

@external(javascript, "./light.ffi.mjs", "setPointLightDecay")
pub fn point_set_decay(light: PointLight, decay: Float) -> PointLight

@external(javascript, "./light.ffi.mjs", "setPointLightPower")
pub fn point_set_power(light: PointLight, power: Float) -> PointLight

pub fn spot_from_light(light: Light) -> Result(SpotLight, Nil) {
  use <- bool.guard(when: !is_spot_light(light), return: Error(Nil))
  Ok(coerce(light))
}

@external(javascript, "./light.ffi.mjs", "identity")
pub fn spot_to_light(light: SpotLight) -> Light

@external(javascript, "./light.ffi.mjs", "identity")
pub fn spot_to_object3d(light: SpotLight) -> Object3D

@external(javascript, "./light.ffi.mjs", "setSpotLightTarget")
pub fn spot_set_target(light: SpotLight, target: Object3D) -> SpotLight

@external(javascript, "./light.ffi.mjs", "getSpotLightTarget")
pub fn spot_get_target(light: SpotLight) -> Object3D

@external(javascript, "./light.ffi.mjs", "setSpotLightDistance")
pub fn spot_set_distance(light: SpotLight, distance: Float) -> SpotLight

@external(javascript, "./light.ffi.mjs", "setSpotLightAngle")
pub fn spot_set_angle(light: SpotLight, angle: Float) -> SpotLight

@external(javascript, "./light.ffi.mjs", "setSpotLightPenumbra")
pub fn spot_set_penumbra(light: SpotLight, penumbra: Float) -> SpotLight

@external(javascript, "./light.ffi.mjs", "setSpotLightDecay")
pub fn spot_set_decay(light: SpotLight, decay: Float) -> SpotLight

@external(javascript, "./light.ffi.mjs", "setSpotLightPower")
pub fn spot_set_power(light: SpotLight, power: Float) -> SpotLight

pub fn hemisphere_from_light(light: Light) -> Result(HemisphereLight, Nil) {
  use <- bool.guard(when: !is_hemisphere_light(light), return: Error(Nil))
  Ok(coerce(light))
}

@external(javascript, "./light.ffi.mjs", "identity")
pub fn hemisphere_to_light(light: HemisphereLight) -> Light

@external(javascript, "./light.ffi.mjs", "identity")
pub fn hemisphere_to_object3d(light: HemisphereLight) -> Object3D

@external(javascript, "./light.ffi.mjs", "setHemisphereLightGroundColor")
pub fn hemisphere_set_ground_color(
  light: HemisphereLight,
  ground_color: Int,
) -> HemisphereLight

@external(javascript, "./light.ffi.mjs", "setLightShadowBias")
pub fn set_shadow_bias(light: Light, bias: Float) -> Light

@external(javascript, "./light.ffi.mjs", "setLightShadowNormalBias")
pub fn set_shadow_normal_bias(light: Light, normal_bias: Float) -> Light

@external(javascript, "./light.ffi.mjs", "setLightShadowRadius")
pub fn set_shadow_radius(light: Light, radius: Float) -> Light

@external(javascript, "./light.ffi.mjs", "setLightShadowMapSize")
pub fn set_shadow_map_size(light: Light, width: Int, height: Int) -> Light

@external(javascript, "./light.ffi.mjs", "setLightShadowAutoUpdate")
pub fn set_shadow_auto_update(light: Light, auto_update: Bool) -> Light

@external(javascript, "./light.ffi.mjs", "setLightShadowNeedsUpdate")
pub fn set_shadow_needs_update(light: Light, needs_update: Bool) -> Light

@external(javascript, "./light.ffi.mjs", "setDirectionalLightShadowCameraBounds")
pub fn directional_set_shadow_camera_bounds(
  light: DirectionalLight,
  left: Float,
  right: Float,
  top: Float,
  bottom: Float,
) -> DirectionalLight

@external(javascript, "./light.ffi.mjs", "setDirectionalLightShadowCameraNearFar")
pub fn directional_set_shadow_camera_near_far(
  light: DirectionalLight,
  near: Float,
  far: Float,
) -> DirectionalLight

@external(javascript, "./light.ffi.mjs", "setPointLightShadowCameraNearFar")
pub fn point_set_shadow_camera_near_far(
  light: PointLight,
  near: Float,
  far: Float,
) -> PointLight

@external(javascript, "./light.ffi.mjs", "setSpotLightShadowCameraNearFar")
pub fn spot_set_shadow_camera_near_far(
  light: SpotLight,
  near: Float,
  far: Float,
) -> SpotLight

@external(javascript, "./light.ffi.mjs", "identity")
pub fn to_object3d(light: Light) -> Object3D

pub fn from_object3d(object: Object3D) -> Result(Light, Nil) {
  use <- bool.guard(when: !is_light(object), return: Error(Nil))
  Ok(coerce(object))
}

@external(javascript, "./light.ffi.mjs", "isDirectionalLight")
fn is_directional_light(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isPointLight")
fn is_point_light(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isSpotLight")
fn is_spot_light(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isHemisphereLight")
fn is_hemisphere_light(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isLight")
fn is_light(object: Object3D) -> Bool

@external(javascript, "./light.ffi.mjs", "identity")
fn coerce(a: a) -> b
