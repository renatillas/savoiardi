import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}
import savoiardi/camera.{type Camera}
import savoiardi/object.{type Object3D}
import savoiardi/scene.{type Scene}
import savoiardi/texture

pub type Renderer

pub type Canvas

pub type ToneMapping {
  NoToneMapping
  LinearToneMapping
  ReinhardToneMapping
  CineonToneMapping
  ACESFilmicToneMapping
  AgXToneMapping
  NeutralToneMapping
}

pub type ShadowMapType {
  BasicShadowMap
  PCFShadowMap
  VSMShadowMap
}

@external(javascript, "./renderer.ffi.mjs", "getNoToneMapping")
fn get_no_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getLinearToneMapping")
fn get_linear_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getReinhardToneMapping")
fn get_reinhard_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getCineonToneMapping")
fn get_cineon_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getACESFilmicToneMapping")
fn get_aces_filmic_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getAgXToneMapping")
fn get_agx_tone_mapping_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getNeutralToneMapping")
fn get_neutral_tone_mapping_constant() -> Int

fn tone_mapping_to_int(tone_mapping: ToneMapping) -> Int {
  case tone_mapping {
    NoToneMapping -> get_no_tone_mapping_constant()
    LinearToneMapping -> get_linear_tone_mapping_constant()
    ReinhardToneMapping -> get_reinhard_tone_mapping_constant()
    CineonToneMapping -> get_cineon_tone_mapping_constant()
    ACESFilmicToneMapping -> get_aces_filmic_tone_mapping_constant()
    AgXToneMapping -> get_agx_tone_mapping_constant()
    NeutralToneMapping -> get_neutral_tone_mapping_constant()
  }
}

@external(javascript, "./renderer.ffi.mjs", "getBasicShadowMap")
fn get_basic_shadow_map_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getPCFShadowMap")
fn get_pcf_shadow_map_constant() -> Int

@external(javascript, "./renderer.ffi.mjs", "getVSMShadowMap")
fn get_vsm_shadow_map_constant() -> Int

fn shadow_map_type_to_int(shadow_map_type: ShadowMapType) -> Int {
  case shadow_map_type {
    BasicShadowMap -> get_basic_shadow_map_constant()
    PCFShadowMap -> get_pcf_shadow_map_constant()
    VSMShadowMap -> get_vsm_shadow_map_constant()
  }
}

@external(javascript, "./renderer.ffi.mjs", "createRenderer")
pub fn new(antialias antialias: Bool, alpha alpha: Bool) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "enableRendererShadowMap")
pub fn set_shadow_map(renderer: Renderer, enabled: Bool) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "getRendererDomElement")
pub fn canvas(renderer: Renderer) -> Canvas

@external(javascript, "./renderer.ffi.mjs", "setRendererSize")
pub fn set_size(renderer: Renderer, width: Int, height: Int) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setPixelRatio")
pub fn set_pixel_ratio(renderer: Renderer, pixel_ratio: Float) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setDrawingBufferSize")
pub fn set_drawing_buffer_size(
  renderer: Renderer,
  width: Int,
  height: Int,
  pixel_ratio: Float,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "render")
pub fn render(renderer: Renderer, scene: Scene, camera: Camera) -> Nil

@external(javascript, "./renderer.ffi.mjs", "clear")
pub fn clear(
  renderer: Renderer,
  color color: Bool,
  depth depth: Bool,
  stencil stencil: Bool,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "clearColor")
pub fn clear_color(renderer: Renderer) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "clearDepth")
pub fn clear_depth(renderer: Renderer) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "clearStencil")
pub fn clear_stencil(renderer: Renderer) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setClearAlpha")
pub fn set_clear_alpha(renderer: Renderer, alpha: Float) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setClearColor")
pub fn set_clear_color(renderer: Renderer, color: Int, alpha: Float) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAutoClear")
pub fn set_auto_clear(renderer: Renderer, auto_clear: Bool) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAutoClearColor")
pub fn set_auto_clear_color(renderer: Renderer, auto_clear_color: Bool) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAutoClearDepth")
pub fn set_auto_clear_depth(renderer: Renderer, auto_clear_depth: Bool) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAutoClearStencil")
pub fn set_auto_clear_stencil(
  renderer: Renderer,
  auto_clear_stencil: Bool,
) -> Renderer

pub fn set_output_color_space(
  renderer: Renderer,
  output_color_space: texture.ColorSpace,
) -> Renderer {
  set_output_color_space_ffi(
    renderer,
    texture.color_space_to_string(output_color_space),
  )
  renderer
}

@external(javascript, "./renderer.ffi.mjs", "setOutputColorSpace")
fn set_output_color_space_ffi(
  renderer: Renderer,
  output_color_space: String,
) -> Renderer

pub fn set_tone_mapping(renderer: Renderer, tone_mapping: ToneMapping) -> Renderer {
  set_tone_mapping_ffi(renderer, tone_mapping_to_int(tone_mapping))
  renderer
}

@external(javascript, "./renderer.ffi.mjs", "setToneMapping")
fn set_tone_mapping_ffi(renderer: Renderer, tone_mapping: Int) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setToneMappingExposure")
pub fn set_tone_mapping_exposure(renderer: Renderer, exposure: Float) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setTransmissionResolutionScale")
pub fn set_transmission_resolution_scale(
  renderer: Renderer,
  scale: Float,
) -> Renderer

pub fn set_shadow_map_type(
  renderer: Renderer,
  shadow_map_type: ShadowMapType,
) -> Renderer {
  set_shadow_map_type_ffi(renderer, shadow_map_type_to_int(shadow_map_type))
  renderer
}

@external(javascript, "./renderer.ffi.mjs", "setShadowMapType")
fn set_shadow_map_type_ffi(renderer: Renderer, shadow_map_type: Int) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "compile")
pub fn compile(
  renderer: Renderer,
  object: Object3D,
  camera: Camera,
  target_scene: Option(Scene),
) -> Nil

@external(javascript, "./renderer.ffi.mjs", "compileAsync")
pub fn compile_async(
  renderer: Renderer,
  object: Object3D,
  camera: Camera,
  target_scene: Option(Scene),
) -> Promise(Nil)

@external(javascript, "./renderer.ffi.mjs", "resetState")
pub fn reset_state(renderer: Renderer) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAnimationLoop")
pub fn set_animation_loop(renderer: Renderer, on_frame: fn(Float) -> Nil) -> Renderer
