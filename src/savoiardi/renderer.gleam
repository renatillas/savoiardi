import savoiardi/cameras.{type Camera}
import savoiardi/scenes.{type Scene}
import vec/vec2

pub type Renderer

pub type Canvas

@external(javascript, "../savoiardi.ffi.mjs", "createRenderer")
pub fn new(antialias antialias: Bool, alpha alpha: Bool) -> Renderer

@external(javascript, "../savoiardi.ffi.mjs", "enableRendererShadowMap")
pub fn set_shadow_map(renderer: Renderer, enabled: Bool) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "getRendererDomElement")
pub fn dom_element(renderer: Renderer) -> Canvas

@external(javascript, "../savoiardi.ffi.mjs", "getCanvasDimensions")
pub fn canvas_dimensions(renderer: Renderer) -> vec2.Vec2(Float)

@external(javascript, "../savoiardi.ffi.mjs", "setRendererSize")
pub fn set_size(renderer: Renderer, width: Int, height: Int) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "render")
pub fn render(renderer: Renderer, scene: Scene, camera: Camera) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setAnimationLoop")
pub fn set_animation_loop(renderer: Renderer, on_frame: fn(Float) -> Nil) -> Nil
