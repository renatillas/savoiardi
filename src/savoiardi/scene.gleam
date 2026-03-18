import savoiardi/object
import savoiardi/texture.{type CubeTexture, type Texture}

pub type Scene

@external(javascript, "./scene.ffi.mjs", "createScene")
pub fn new() -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundColor")
pub fn set_background_color(scene: Scene, color: Int) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundTexture")
pub fn set_background_texture(scene: Scene, texture: Texture) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundCubeTexture")
pub fn set_background_cube_texture(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

@external(javascript, "./scene.ffi.mjs", "clearSceneBackground")
pub fn clear_background(scene: Scene) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundBlurriness")
pub fn set_background_blurriness(scene: Scene, blurriness: Float) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneBackgroundIntensity")
pub fn set_background_intensity(scene: Scene, intensity: Float) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentTexture")
pub fn set_environment_texture(scene: Scene, texture: Texture) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentCubeTexture")
pub fn set_environment_cube_texture(scene: Scene, cube_texture: CubeTexture) -> Scene

@external(javascript, "./scene.ffi.mjs", "clearSceneEnvironment")
pub fn clear_environment(scene: Scene) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneEnvironmentIntensity")
pub fn set_environment_intensity(scene: Scene, intensity: Float) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneFog")
pub fn set_fog(
  scene: Scene,
  color color: Int,
  near near: Float,
  far far: Float,
) -> Scene

@external(javascript, "./scene.ffi.mjs", "setSceneFogExp2")
pub fn set_fog_exp2(
  scene: Scene,
  color color: Int,
  density density: Float,
) -> Scene

@external(javascript, "./scene.ffi.mjs", "clearSceneFog")
pub fn clear_fog(scene: Scene) -> Scene

@external(javascript, "./scene.ffi.mjs", "identity")
pub fn to_object3d(scene: Scene) -> object.Object3D
