//// Scene creation and scene-level rendering configuration.
////
//// This module wraps Three.js scenes together with typed helpers for
//// backgrounds, environment maps, and fog settings.

import savoiardi/object
import savoiardi/texture.{type CubeTexture, type Texture}

/// A Three.js scene.
pub type Scene

/// Scene background sources supported by Savoiardi.
pub type Background {
  ColorBackground(Int)
  TextureBackground(Texture)
  CubeTextureBackground(CubeTexture)
}

/// Scene environment map sources supported by Savoiardi.
pub type Environment {
  EnvironmentTexture(Texture)
  EnvironmentCubeTexture(CubeTexture)
}

/// Fog settings for a scene.
pub type Fog {
  LinearFog(color: Int, near: Float, far: Float)
  ExponentialFog(color: Int, density: Float)
}

/// Creates an empty scene.
@external(javascript, "./scene.ffi.mjs", "createScene")
pub fn new() -> Scene

/// Builds a solid-color background value.
pub fn background_color(value: Int) -> Background {
  ColorBackground(value)
}

/// Builds a 2D texture background value.
pub fn background_texture(texture: Texture) -> Background {
  TextureBackground(texture)
}

/// Builds a cube texture background value.
pub fn background_cube_texture(cube_texture: CubeTexture) -> Background {
  CubeTextureBackground(cube_texture)
}

/// Builds an environment map from a 2D texture.
pub fn environment_texture(texture: Texture) -> Environment {
  EnvironmentTexture(texture)
}

/// Builds an environment map from a cube texture.
pub fn environment_cube_texture(cube_texture: CubeTexture) -> Environment {
  EnvironmentCubeTexture(cube_texture)
}

/// Builds linear fog settings.
pub fn fog(color color: Int, near near: Float, far far: Float) -> Fog {
  LinearFog(color: color, near: near, far: far)
}

/// Builds exponential fog settings.
pub fn fog_exp2(color color: Int, density density: Float) -> Fog {
  ExponentialFog(color: color, density: density)
}

/// Applies a background to a scene.
pub fn set_background(scene: Scene, background: Background) -> Scene {
  case background {
    ColorBackground(background) -> set_background_color_ffi(scene, background)
    TextureBackground(texture) -> set_background_texture_ffi(scene, texture)
    CubeTextureBackground(cube_texture) ->
      set_background_cube_texture_ffi(scene, cube_texture)
  }
}

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundColor")
fn set_background_color_ffi(scene: Scene, color: Int) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundTexture")
fn set_background_texture_ffi(scene: Scene, texture: Texture) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundCubeTexture")
fn set_background_cube_texture_ffi(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

/// Removes the current scene background.
@external(javascript, "./scene.ffi.mjs", "clearSceneBackground")
pub fn clear_background(scene: Scene) -> Scene

/// Sets the blur amount used for texture-based backgrounds.
@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundBlurriness")
pub fn set_background_blurriness(scene: Scene, blurriness: Float) -> Scene

/// Sets the intensity used for texture-based backgrounds.
@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundIntensity")
pub fn set_background_intensity(scene: Scene, intensity: Float) -> Scene

/// Applies an environment map to a scene.
pub fn set_environment(scene: Scene, environment: Environment) -> Scene {
  case environment {
    EnvironmentTexture(texture) -> set_environment_texture_ffi(scene, texture)
    EnvironmentCubeTexture(cube_texture) ->
      set_environment_cube_texture_ffi(scene, cube_texture)
  }
}

@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentTexture")
fn set_environment_texture_ffi(scene: Scene, texture: Texture) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentCubeTexture")
fn set_environment_cube_texture_ffi(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

/// Removes the current environment map.
@external(javascript, "./scene.ffi.mjs", "clearSceneEnvironment")
pub fn clear_environment(scene: Scene) -> Scene

/// Sets the environment lighting intensity.
@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentIntensity")
pub fn set_environment_intensity(scene: Scene, intensity: Float) -> Scene

/// Applies fog settings to a scene.
pub fn set_fog(scene: Scene, fog: Fog) -> Scene {
  case fog {
    LinearFog(color, near, far) -> set_linear_fog_ffi(scene, color, near, far)
    ExponentialFog(color, density) ->
      set_exponential_fog_ffi(scene, color, density)
  }
}

@external(javascript, "./scene.ffi.mjs", "setSceneFog")
fn set_linear_fog_ffi(
  scene: Scene,
  color: Int,
  near: Float,
  far: Float,
) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneFogExp2")
fn set_exponential_fog_ffi(scene: Scene, color: Int, density: Float) -> Scene

/// Removes fog from a scene.
@external(javascript, "./scene.ffi.mjs", "clearSceneFog")
pub fn clear_fog(scene: Scene) -> Scene

/// Views a scene as an object so it can be used with object APIs.
@external(javascript, "./scene.ffi.mjs", "identity")
pub fn to_object3d(scene: Scene) -> object.Object3D
