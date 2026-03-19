//// Light construction and light-specific controls.
////
//// The module exposes a shared light type together with safe conversions to the
//// more specific directional, point, spot, and hemisphere light variants.

import gleam/bool
import savoiardi/object.{type Object3D}

/// A light viewed through the shared light API.
pub type Light

/// A directional light.
pub type DirectionalLight

/// A point light.
pub type PointLight

/// A spot light.
pub type SpotLight

/// A hemisphere light.
pub type HemisphereLight

/// Creates an ambient light.
@external(javascript, "./light.ffi.mjs", "createAmbientLight")
pub fn ambient(color color: Int, intensity intensity: Float) -> Light

/// Creates a directional light.
@external(javascript, "./light.ffi.mjs", "createDirectionalLight")
pub fn directional(color color: Int, intensity intensity: Float) -> Light

/// Creates a point light.
@external(javascript, "./light.ffi.mjs", "createPointLight")
pub fn point(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
) -> Light

/// Creates a spot light.
@external(javascript, "./light.ffi.mjs", "createSpotLight")
pub fn spot(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
  angle angle: Float,
  penumbra penumbra: Float,
) -> Light

/// Creates a hemisphere light.
@external(javascript, "./light.ffi.mjs", "createHemisphereLight")
pub fn hemisphere(
  sky_color sky_color: Int,
  ground_color ground_color: Int,
  intensity intensity: Float,
) -> Light

/// Enables or disables shadow casting for a light.
@external(javascript, "./light.ffi.mjs", "setLightCastShadow")
pub fn set_cast_shadow(light: Light, cast_shadow: Bool) -> Light

/// Sets the emitted light color.
@external(javascript, "./light.ffi.mjs", "updateLightColor")
pub fn set_color(light: Light, color: Int) -> Light

/// Sets the intensity of a light.
@external(javascript, "./light.ffi.mjs", "updateLightIntensity")
pub fn set_intensity(light: Light, intensity: Float) -> Light

/// Safely downcasts a light to a directional light.
pub fn directional_from_light(light: Light) -> Result(DirectionalLight, Nil) {
  use <- bool.guard(when: !is_directional(light), return: Error(Nil))
  Ok(coerce(light))
}

/// Widens a directional light into the shared light type.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn directional_to_light(light: DirectionalLight) -> Light

/// Views a directional light as an object.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn directional_to_object3d(light: DirectionalLight) -> Object3D

/// Sets the target object used by a directional light.
@external(javascript, "./light.ffi.mjs", "setDirectionalLightTarget")
pub fn directional_set_target(
  light: DirectionalLight,
  target: Object3D,
) -> DirectionalLight

/// Gets the target object used by a directional light.
@external(javascript, "./light.ffi.mjs", "getDirectionalLightTarget")
pub fn directional_get_target(light: DirectionalLight) -> Object3D

/// Safely downcasts a light to a point light.
pub fn point_from_light(light: Light) -> Result(PointLight, Nil) {
  use <- bool.guard(when: !is_point(light), return: Error(Nil))
  Ok(coerce(light))
}

/// Widens a point light into the shared light type.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn point_to_light(light: PointLight) -> Light

/// Views a point light as an object.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn point_to_object3d(light: PointLight) -> Object3D

/// Sets the attenuation distance of a point light.
@external(javascript, "./light.ffi.mjs", "setPointLightDistance")
pub fn point_set_distance(light: PointLight, distance: Float) -> PointLight

/// Sets the decay factor of a point light.
@external(javascript, "./light.ffi.mjs", "setPointLightDecay")
pub fn point_set_decay(light: PointLight, decay: Float) -> PointLight

/// Sets the power of a point light.
@external(javascript, "./light.ffi.mjs", "setPointLightPower")
pub fn point_set_power(light: PointLight, power: Float) -> PointLight

/// Safely downcasts a light to a spot light.
pub fn spot_from_light(light: Light) -> Result(SpotLight, Nil) {
  use <- bool.guard(when: !is_spot(light), return: Error(Nil))
  Ok(coerce(light))
}

/// Widens a spot light into the shared light type.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn spot_to_light(light: SpotLight) -> Light

/// Views a spot light as an object.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn spot_to_object3d(light: SpotLight) -> Object3D

/// Sets the target object used by a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightTarget")
pub fn spot_set_target(light: SpotLight, target: Object3D) -> SpotLight

/// Gets the target object used by a spot light.
@external(javascript, "./light.ffi.mjs", "getSpotLightTarget")
pub fn spot_get_target(light: SpotLight) -> Object3D

/// Sets the attenuation distance of a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightDistance")
pub fn spot_set_distance(light: SpotLight, distance: Float) -> SpotLight

/// Sets the cone angle of a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightAngle")
pub fn spot_set_angle(light: SpotLight, angle: Float) -> SpotLight

/// Sets the penumbra of a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightPenumbra")
pub fn spot_set_penumbra(light: SpotLight, penumbra: Float) -> SpotLight

/// Sets the decay factor of a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightDecay")
pub fn spot_set_decay(light: SpotLight, decay: Float) -> SpotLight

/// Sets the power of a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightPower")
pub fn spot_set_power(light: SpotLight, power: Float) -> SpotLight

/// Safely downcasts a light to a hemisphere light.
pub fn hemisphere_from_light(light: Light) -> Result(HemisphereLight, Nil) {
  use <- bool.guard(when: !is_hemisphere(light), return: Error(Nil))
  Ok(coerce(light))
}

/// Widens a hemisphere light into the shared light type.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn hemisphere_to_light(light: HemisphereLight) -> Light

/// Views a hemisphere light as an object.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn hemisphere_to_object3d(light: HemisphereLight) -> Object3D

/// Sets the ground color of a hemisphere light.
@external(javascript, "./light.ffi.mjs", "setHemisphereLightGroundColor")
pub fn hemisphere_set_ground_color(
  light: HemisphereLight,
  ground_color: Int,
) -> HemisphereLight

/// Sets the shadow bias for a light.
@external(javascript, "./light.ffi.mjs", "setLightShadowBias")
pub fn set_shadow_bias(light: Light, bias: Float) -> Light

/// Sets the shadow normal bias for a light.
@external(javascript, "./light.ffi.mjs", "setLightShadowNormalBias")
pub fn set_shadow_normal_bias(light: Light, normal_bias: Float) -> Light

/// Sets the shadow blur radius for a light.
@external(javascript, "./light.ffi.mjs", "setLightShadowRadius")
pub fn set_shadow_radius(light: Light, radius: Float) -> Light

/// Sets the size of the shadow map texture.
@external(javascript, "./light.ffi.mjs", "setLightShadowMapSize")
pub fn set_shadow_map_size(light: Light, width: Int, height: Int) -> Light

/// Enables or disables automatic shadow map updates.
@external(javascript, "./light.ffi.mjs", "setLightShadowAutoUpdate")
pub fn set_shadow_auto_update(light: Light, auto_update: Bool) -> Light

/// Marks the shadow map as needing an update.
@external(javascript, "./light.ffi.mjs", "setLightShadowNeedsUpdate")
pub fn set_shadow_needs_update(light: Light, needs_update: Bool) -> Light

/// Sets orthographic shadow camera bounds for a directional light.
@external(javascript, "./light.ffi.mjs", "setDirectionalLightShadowCameraBounds")
pub fn directional_set_shadow_camera_bounds(
  light: DirectionalLight,
  left: Float,
  right: Float,
  top: Float,
  bottom: Float,
) -> DirectionalLight

/// Sets the shadow camera clipping planes for a directional light.
@external(javascript, "./light.ffi.mjs", "setDirectionalLightShadowCameraNearFar")
pub fn directional_set_shadow_camera_near_far(
  light: DirectionalLight,
  near: Float,
  far: Float,
) -> DirectionalLight

/// Sets the shadow camera clipping planes for a point light.
@external(javascript, "./light.ffi.mjs", "setPointLightShadowCameraNearFar")
pub fn point_set_shadow_camera_near_far(
  light: PointLight,
  near: Float,
  far: Float,
) -> PointLight

/// Sets the shadow camera clipping planes for a spot light.
@external(javascript, "./light.ffi.mjs", "setSpotLightShadowCameraNearFar")
pub fn spot_set_shadow_camera_near_far(
  light: SpotLight,
  near: Float,
  far: Float,
) -> SpotLight

/// Views a light as an object.
@external(javascript, "./light.ffi.mjs", "identity")
pub fn to_object3d(light: Light) -> Object3D

/// Safely downcasts an object to a light.
pub fn from_object3d(object: Object3D) -> Result(Light, Nil) {
  use <- bool.guard(when: !is_light(object), return: Error(Nil))
  Ok(coerce(object))
}

@external(javascript, "./light.ffi.mjs", "isDirectionalLight")
fn is_directional(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isPointLight")
fn is_point(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isSpotLight")
fn is_spot(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isHemisphereLight")
fn is_hemisphere(light: Light) -> Bool

@external(javascript, "./light.ffi.mjs", "isLight")
fn is_light(object: Object3D) -> Bool

@external(javascript, "./light.ffi.mjs", "identity")
fn coerce(a: a) -> b
