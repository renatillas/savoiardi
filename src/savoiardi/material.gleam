import gleam/option.{type Option}
import savoiardi/texture.{type Texture}

pub type Material

pub type MaterialSide {
  FrontSide
  BackSide
  DoubleSide
}

@external(javascript, "./material.ffi.mjs", "getFrontSide")
fn get_front_side_constant() -> Int

@external(javascript, "./material.ffi.mjs", "getBackSide")
fn get_back_side_constant() -> Int

@external(javascript, "./material.ffi.mjs", "getDoubleSide")
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

@external(javascript, "./material.ffi.mjs", "createBasicMaterial")
fn create_basic_material_ffi(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  side: Int,
  alpha_test: Float,
  depth_write: Bool,
) -> Material

@external(javascript, "./material.ffi.mjs", "createStandardMaterial")
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

@external(javascript, "./material.ffi.mjs", "createPhysicalMaterial")
pub fn physical(
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
  clearcoat clearcoat: Float,
  clearcoat_roughness clearcoat_roughness: Float,
  transmission transmission: Float,
  thickness thickness: Float,
  ior ior: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "createPhongMaterial")
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

@external(javascript, "./material.ffi.mjs", "createLambertMaterial")
pub fn lambert(
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "createToonMaterial")
pub fn toon(
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialWireframe")
pub fn set_wireframe(material: Material, wireframe: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialColor")
pub fn set_color(material: Material, color: Int) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialTransparent")
pub fn set_transparent(material: Material, transparent: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialOpacity")
pub fn set_opacity(material: Material, opacity: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialEmissive")
pub fn set_emissive(material: Material, emissive: Int) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialEmissiveIntensity")
pub fn set_emissive_intensity(material: Material, emissive_intensity: Float) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialTexture")
pub fn set_texture(
  material: Material,
  property_name: String,
  texture: Texture,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialSide")
pub fn set_side(material: Material, side: MaterialSide) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNeedsUpdate")
pub fn set_needs_update(material: Material, needs_update: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "disposeMaterial")
pub fn dispose(material: Material) -> Nil
