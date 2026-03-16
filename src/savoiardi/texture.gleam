import gleam/javascript/promise.{type Promise}

pub type Texture

pub type CubeTexture

pub type ColorSpace {
  SRGBColorSpace
  LinearSRGBColorSpace
}

@external(javascript, "../savoiardi.ffi.mjs", "getSRGBColorSpace")
fn get_srgb_color_space_constant() -> String

@external(javascript, "../savoiardi.ffi.mjs", "getLinearSRGBColorSpace")
fn get_linear_srgb_color_space_constant() -> String

fn color_space_to_string(space: ColorSpace) -> String {
  case space {
    SRGBColorSpace -> get_srgb_color_space_constant()
    LinearSRGBColorSpace -> get_linear_srgb_color_space_constant()
  }
}

@external(javascript, "../savoiardi.ffi.mjs", "loadTexture")
pub fn load(url: String) -> Promise(Result(Texture, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "loadEquirectangularTexture")
pub fn load_equirectangular(url: String) -> Promise(Result(Texture, Nil))

@external(javascript, "../savoiardi.ffi.mjs", "loadCubeTexture")
pub fn load_cube(urls: List(String)) -> Promise(Result(CubeTexture, Nil))

pub fn set_texture_color_space(texture: Texture, color_space: ColorSpace) -> Nil {
  set_texture_color_space_ffi(texture, color_space_to_string(color_space))
}

@external(javascript, "../savoiardi.ffi.mjs", "setTextureColorSpace")
fn set_texture_color_space_ffi(texture: Texture, color_space: String) -> Nil
