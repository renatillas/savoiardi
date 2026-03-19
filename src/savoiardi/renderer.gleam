import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}
import savoiardi/camera.{type Camera}
import savoiardi/object.{type Object3D}
import savoiardi/scene.{type Scene}
import savoiardi/texture

pub type Renderer

pub type Canvas

pub type PowerPreference {
  DefaultPowerPreference
  LowPowerPreference
  HighPerformancePreference
}

pub type RendererOptions {
  RendererOptions(
    antialias: Bool,
    alpha: Bool,
    depth: Bool,
    stencil: Bool,
    premultiplied_alpha: Bool,
    preserve_drawing_buffer: Bool,
    fail_if_major_performance_caveat: Bool,
    logarithmic_depth_buffer: Bool,
    reversed_depth_buffer: Bool,
    power_preference: PowerPreference,
  )
}

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
  PCFSoftShadowMap
  VSMShadowMap
}

pub fn options() -> RendererOptions {
  RendererOptions(
    antialias: False,
    alpha: False,
    depth: True,
    stencil: False,
    premultiplied_alpha: True,
    preserve_drawing_buffer: False,
    fail_if_major_performance_caveat: False,
    logarithmic_depth_buffer: False,
    reversed_depth_buffer: False,
    power_preference: DefaultPowerPreference,
  )
}

pub fn with_antialias(
  options: RendererOptions,
  antialias: Bool,
) -> RendererOptions {
  RendererOptions(..options, antialias: antialias)
}

pub fn with_alpha(options: RendererOptions, alpha: Bool) -> RendererOptions {
  RendererOptions(..options, alpha: alpha)
}

pub fn with_power_preference(
  options: RendererOptions,
  power_preference: PowerPreference,
) -> RendererOptions {
  RendererOptions(..options, power_preference: power_preference)
}

pub fn with_preserve_drawing_buffer(
  options: RendererOptions,
  preserve_drawing_buffer: Bool,
) -> RendererOptions {
  RendererOptions(..options, preserve_drawing_buffer: preserve_drawing_buffer)
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

@external(javascript, "./renderer.ffi.mjs", "getPCFSoftShadowMap")
fn get_pcf_soft_shadow_map_constant() -> Int

fn shadow_map_type_to_int(shadow_map_type: ShadowMapType) -> Int {
  case shadow_map_type {
    BasicShadowMap -> get_basic_shadow_map_constant()
    PCFShadowMap -> get_pcf_shadow_map_constant()
    PCFSoftShadowMap -> get_pcf_soft_shadow_map_constant()
    VSMShadowMap -> get_vsm_shadow_map_constant()
  }
}

fn power_preference_to_string(power_preference: PowerPreference) -> String {
  case power_preference {
    DefaultPowerPreference -> "default"
    LowPowerPreference -> "low-power"
    HighPerformancePreference -> "high-performance"
  }
}

pub fn new(options options: RendererOptions) -> Renderer {
  create_renderer_ffi(
    options.antialias,
    options.alpha,
    options.depth,
    options.stencil,
    options.premultiplied_alpha,
    options.preserve_drawing_buffer,
    options.fail_if_major_performance_caveat,
    options.logarithmic_depth_buffer,
    options.reversed_depth_buffer,
    power_preference_to_string(options.power_preference),
  )
}

@external(javascript, "./renderer.ffi.mjs", "createRenderer")
fn create_renderer_ffi(
  antialias: Bool,
  alpha: Bool,
  depth: Bool,
  stencil: Bool,
  premultiplied_alpha: Bool,
  preserve_drawing_buffer: Bool,
  fail_if_major_performance_caveat: Bool,
  logarithmic_depth_buffer: Bool,
  reversed_depth_buffer: Bool,
  power_preference: String,
) -> Renderer

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

@external(javascript, "./renderer.ffi.mjs", "setViewport")
pub fn set_viewport(
  renderer: Renderer,
  x x: Int,
  y y: Int,
  width width: Int,
  height height: Int,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setScissor")
pub fn set_scissor(
  renderer: Renderer,
  x x: Int,
  y y: Int,
  width width: Int,
  height height: Int,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setScissorTest")
pub fn set_scissor_test(renderer: Renderer, enabled: Bool) -> Renderer

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
pub fn set_auto_clear_color(
  renderer: Renderer,
  auto_clear_color: Bool,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setAutoClearDepth")
pub fn set_auto_clear_depth(
  renderer: Renderer,
  auto_clear_depth: Bool,
) -> Renderer

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

pub fn set_tone_mapping(
  renderer: Renderer,
  tone_mapping: ToneMapping,
) -> Renderer {
  set_tone_mapping_ffi(renderer, tone_mapping_to_int(tone_mapping))
  renderer
}

@external(javascript, "./renderer.ffi.mjs", "setToneMapping")
fn set_tone_mapping_ffi(renderer: Renderer, tone_mapping: Int) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "setToneMappingExposure")
pub fn set_tone_mapping_exposure(
  renderer: Renderer,
  exposure: Float,
) -> Renderer

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
pub fn set_animation_loop(
  renderer: Renderer,
  on_frame: fn(Float) -> Nil,
) -> Renderer

@external(javascript, "./renderer.ffi.mjs", "dispose")
pub fn dispose(renderer: Renderer) -> Nil
