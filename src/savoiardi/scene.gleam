import savoiardi/object
import savoiardi/textures.{type CubeTexture, type Texture}

pub type Scene

@external(javascript, "../savoiardi.ffi.mjs", "createScene")
pub fn new() -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "setSceneBackgroundColor")
pub fn set_background_color(scene: Scene, color: Int) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "setSceneBackgroundTexture")
pub fn set_background_texture(scene: Scene, texture: Texture) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "setSceneBackgroundCubeTexture")
pub fn set_background_cube_texture(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "clearSceneBackground")
pub fn clear_background(scene: Scene) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "setSceneFog")
pub fn set_fog(scene: Scene, color: Int, near: Float, far: Float) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "setSceneFogExp2")
pub fn set_fog_exp2(scene: Scene, color: Int, density: Float) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "clearSceneFog")
pub fn clear_fog(scene: Scene) -> Scene

@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn to_object3d(scene: Scene) -> object.Object3D
