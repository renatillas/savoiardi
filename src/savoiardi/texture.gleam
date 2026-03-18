import gleam/javascript/array
import gleam/javascript/promise.{type Promise}
import savoiardi/loader.{type CubeTextureLoader, type TextureLoader}
import vec/vec2.{type Vec2}

pub type Texture

pub type CubeTexture

pub type ColorSpace {
  SRGB
  LinearSRGB
}

pub type Mapping {
  UV
  CubeReflection
  CubeRefraction
  EquirectangularReflection
  EquirectangularRefraction
}

pub type Wrapping {
  Repeat
  ClampToEdge
  MirroredRepeat
}

pub type MagnificationFilter {
  Nearest
  Linear
}

pub type MinificationFilter {
  NearestMinification
  NearestMipmapNearest
  NearestMipmapLinear
  LinearMinification
  LinearMipmapNearest
  LinearMipmapLinear
}

@external(javascript, "./texture.ffi.mjs", "getSRGBColorSpace")
fn get_srgb_color_space_constant() -> String

@external(javascript, "./texture.ffi.mjs", "getLinearSRGBColorSpace")
fn get_linear_srgb_color_space_constant() -> String

@external(javascript, "./texture.ffi.mjs", "getUVMapping")
fn get_uv_mapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getCubeReflectionMapping")
fn get_cube_reflection_mapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getCubeRefractionMapping")
fn get_cube_refraction_mapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getEquirectangularReflectionMapping")
fn get_equirectangular_reflection_mapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getEquirectangularRefractionMapping")
fn get_equirectangular_refraction_mapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getRepeatWrapping")
fn get_repeat_wrapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getClampToEdgeWrapping")
fn get_clamp_to_edge_wrapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getMirroredRepeatWrapping")
fn get_mirrored_repeat_wrapping_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getNearestFilter")
fn get_nearest_filter_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getLinearFilter")
fn get_linear_filter_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getNearestMipmapNearestFilter")
fn get_nearest_mipmap_nearest_filter_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getNearestMipmapLinearFilter")
fn get_nearest_mipmap_linear_filter_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getLinearMipmapNearestFilter")
fn get_linear_mipmap_nearest_filter_constant() -> Int

@external(javascript, "./texture.ffi.mjs", "getLinearMipmapLinearFilter")
fn get_linear_mipmap_linear_filter_constant() -> Int

pub fn color_space_to_string(space: ColorSpace) -> String {
  case space {
    SRGB -> get_srgb_color_space_constant()
    LinearSRGB -> get_linear_srgb_color_space_constant()
  }
}

fn mapping_to_int(mapping: Mapping) -> Int {
  case mapping {
    UV -> get_uv_mapping_constant()
    CubeReflection -> get_cube_reflection_mapping_constant()
    CubeRefraction -> get_cube_refraction_mapping_constant()
    EquirectangularReflection -> get_equirectangular_reflection_mapping_constant()
    EquirectangularRefraction -> get_equirectangular_refraction_mapping_constant()
  }
}

fn wrapping_to_int(wrapping: Wrapping) -> Int {
  case wrapping {
    Repeat -> get_repeat_wrapping_constant()
    ClampToEdge -> get_clamp_to_edge_wrapping_constant()
    MirroredRepeat -> get_mirrored_repeat_wrapping_constant()
  }
}

fn magnification_filter_to_int(filter: MagnificationFilter) -> Int {
  case filter {
    Nearest -> get_nearest_filter_constant()
    Linear -> get_linear_filter_constant()
  }
}

fn minification_filter_to_int(filter: MinificationFilter) -> Int {
  case filter {
    NearestMinification -> get_nearest_filter_constant()
    NearestMipmapNearest -> get_nearest_mipmap_nearest_filter_constant()
    NearestMipmapLinear -> get_nearest_mipmap_linear_filter_constant()
    LinearMinification -> get_linear_filter_constant()
    LinearMipmapNearest -> get_linear_mipmap_nearest_filter_constant()
    LinearMipmapLinear -> get_linear_mipmap_linear_filter_constant()
  }
}

@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load(
  loader: TextureLoader,
  url: String,
  on_load: fn(Texture) -> Nil,
  on_error: fn() -> Nil,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_async(
  loader: TextureLoader,
  url: String,
) -> Promise(Result(Texture, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load_equirectangular(
  loader: TextureLoader,
  url: String,
  on_load: fn(Texture) -> Nil,
  on_error: fn() -> Nil,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_equirectangular_async(
  loader: TextureLoader,
  url: String,
) -> Promise(Result(Texture, Nil))

pub fn load_cube(
  loader: CubeTextureLoader,
  urls: List(String),
  on_load: fn(CubeTexture) -> Nil,
  on_error: fn() -> Nil,
) {
  do_load_cube(loader, array.from_list(urls), on_load, on_error)
}

@external(javascript, "../savoiardi.ffi.mjs", "load")
fn do_load_cube(
  loader: CubeTextureLoader,
  urls: array.Array(String),
  on_load: fn(CubeTexture) -> Nil,
  on_error: fn() -> Nil,
) -> Nil

pub fn load_cube_async(
  loader: CubeTextureLoader,
  urls: List(String),
) -> Promise(Result(CubeTexture, Nil)) {
  do_load_cube_async(loader, array.from_list(urls))
}

@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
fn do_load_cube_async(
  loader: CubeTextureLoader,
  urls: array.Array(String),
) -> Promise(Result(CubeTexture, Nil))

pub fn set_color_space(texture: Texture, color_space: ColorSpace) -> Texture {
  set_color_space_ffi(texture, color_space_to_string(color_space))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureColorSpace")
fn set_color_space_ffi(texture: Texture, color_space: String) -> Texture

pub fn set_mapping(texture: Texture, mapping: Mapping) -> Texture {
  set_mapping_ffi(texture, mapping_to_int(mapping))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureMapping")
fn set_mapping_ffi(texture: Texture, mapping: Int) -> Texture

pub fn set_wrap_s(texture: Texture, wrapping: Wrapping) -> Texture {
  set_wrap_s_ffi(texture, wrapping_to_int(wrapping))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureWrapS")
fn set_wrap_s_ffi(texture: Texture, wrapping: Int) -> Texture

pub fn set_wrap_t(texture: Texture, wrapping: Wrapping) -> Texture {
  set_wrap_t_ffi(texture, wrapping_to_int(wrapping))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureWrapT")
fn set_wrap_t_ffi(texture: Texture, wrapping: Int) -> Texture

pub fn set_wrap(texture: Texture, wrap_s: Wrapping, wrap_t: Wrapping) -> Texture {
  set_wrap_s(texture, wrap_s)
  set_wrap_t(texture, wrap_t)
  texture
}

pub fn set_mag_filter(texture: Texture, filter: MagnificationFilter) -> Texture {
  set_mag_filter_ffi(texture, magnification_filter_to_int(filter))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureMagFilter")
fn set_mag_filter_ffi(texture: Texture, filter: Int) -> Texture

pub fn set_min_filter(texture: Texture, filter: MinificationFilter) -> Texture {
  set_min_filter_ffi(texture, minification_filter_to_int(filter))
  texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureMinFilter")
fn set_min_filter_ffi(texture: Texture, filter: Int) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureRepeat")
pub fn set_repeat(texture: Texture, repeat: Vec2(Float)) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureOffset")
pub fn set_offset(texture: Texture, offset: Vec2(Float)) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureRotation")
pub fn set_rotation(texture: Texture, rotation: Float) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureCenter")
pub fn set_center(texture: Texture, center: Vec2(Float)) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureAnisotropy")
pub fn set_anisotropy(texture: Texture, anisotropy: Int) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureFlipY")
pub fn set_flip_y(texture: Texture, flip_y: Bool) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureGenerateMipmaps")
pub fn set_generate_mipmaps(texture: Texture, generate_mipmaps: Bool) -> Texture

@external(javascript, "./texture.ffi.mjs", "setTextureNeedsUpdate")
pub fn set_needs_update(texture: Texture, needs_update: Bool) -> Texture

@external(javascript, "./texture.ffi.mjs", "disposeTexture")
pub fn dispose(texture: Texture) -> Nil

pub fn set_cube_mapping(cube_texture: CubeTexture, mapping: Mapping) -> CubeTexture {
  set_cube_mapping_ffi(cube_texture, mapping_to_int(mapping))
  cube_texture
}

@external(javascript, "./texture.ffi.mjs", "setTextureMapping")
fn set_cube_mapping_ffi(cube_texture: CubeTexture, mapping: Int) -> CubeTexture
