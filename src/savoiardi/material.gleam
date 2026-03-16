import gleam/option.{type Option}
import savoiardi/textures.{type Texture}

pub type Material

pub type MaterialSide {
  FrontSide
  BackSide
  DoubleSide
}

@external(javascript, "../savoiardi.ffi.mjs", "getFrontSide")
fn get_front_side_constant() -> Int

@external(javascript, "../savoiardi.ffi.mjs", "getBackSide")
fn get_back_side_constant() -> Int

@external(javascript, "../savoiardi.ffi.mjs", "getDoubleSide")
fn get_double_side_constant() -> Int

fn material_side_to_int(side: MaterialSide) -> Int {
  case side {
    FrontSide -> get_front_side_constant()
    BackSide -> get_back_side_constant()
    DoubleSide -> get_double_side_constant()
  }
}

pub fn basic(
  color color: Int,
  transparent transparent: Bool,
  opacity opacity: Float,
  color_map map: Option(Texture),
  side side: MaterialSide,
  alpha_test alpha_test: Float,
  depth_write depth_write: Bool,
) -> Material {
  create_basic_material_ffi(
    color,
    transparent,
    opacity,
    map,
    material_side_to_int(side),
    alpha_test,
    depth_write,
  )
}

@external(javascript, "../savoiardi.ffi.mjs", "createBasicMaterial")
fn create_basic_material_ffi(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  side: Int,
  alpha_test: Float,
  depth_write: Bool,
) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "createStandardMaterial")
pub fn standard(
  color color: Int,
  metalness metalness: Float,
  roughness roughness: Float,
  transparent transparent: Bool,
  opacity opacity: Float,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  displacement_map displacement_map: Option(Texture),
  displacement_scale displacement_scale: Float,
  displacement_bias displacement_bias: Float,
  roughness_map roughness_map: Option(Texture),
  metalness_map metalness_map: Option(Texture),
  emissive emissive: Int,
  emissive_intensity emissive_intensity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "createPhongMaterial")
pub fn phong(
  color color: Int,
  shininess shininess: Float,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "createLambertMaterial")
pub fn lambert(
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "createToonMaterial")
pub fn toon(
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "../savoiardi.ffi.mjs", "updateMaterialWireframe")
pub fn set_wireframe(material: Material, wireframe: Bool) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "setMaterialTexture")
pub fn set_texture(
  material: Material,
  property_name: String,
  texture: Texture,
) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "updateMaterialSide")
pub fn set_side(material: Material, side: MaterialSide) -> Nil

@external(javascript, "../savoiardi.ffi.mjs", "disposeMaterial")
pub fn dispose_material(material: Material) -> Nil
