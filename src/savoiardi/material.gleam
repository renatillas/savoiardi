import gleam/option.{type Option}
import savoiardi/texture.{type Texture}
import vec/vec2.{type Vec2}

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

@external(javascript, "./material.ffi.mjs", "createNormalMaterial")
fn create_normal_material(
  transparent transparent: Bool,
  opacity opacity: Float,
  wireframe wireframe: Bool,
  flat_shading flat_shading: Bool,
  side side: Int,
) -> Material

pub fn normal(
  transparent transparent: Bool,
  opacity opacity: Float,
  wireframe wireframe: Bool,
  flat_shading flat_shading: Bool,
  side side: MaterialSide,
) -> Material {
  create_normal_material(
    transparent: transparent,
    opacity: opacity,
    wireframe: wireframe,
    flat_shading: flat_shading,
    side: material_side_to_int(side),
  )
}

@external(javascript, "./material.ffi.mjs", "createMatcapMaterial")
fn create_matcap_material(
  color color: Int,
  matcap matcap: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  flat_shading flat_shading: Bool,
  side side: Int,
) -> Material

pub fn matcap(
  color color: Int,
  matcap matcap: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  flat_shading flat_shading: Bool,
  side side: MaterialSide,
) -> Material {
  create_matcap_material(
    color: color,
    matcap: matcap,
    transparent: transparent,
    opacity: opacity,
    flat_shading: flat_shading,
    side: material_side_to_int(side),
  )
}

@external(javascript, "./material.ffi.mjs", "createShadowMaterial")
pub fn shadow(
  color color: Int,
  transparent transparent: Bool,
  opacity opacity: Float,
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

@external(javascript, "./material.ffi.mjs", "updateMaterialRoughness")
pub fn set_roughness(material: Material, roughness: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialMetalness")
pub fn set_metalness(material: Material, metalness: Float) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialEnvMap")
pub fn set_env_map(material: Material, env_map: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNormalMap")
pub fn set_normal_map(material: Material, normal_map: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialMatcap")
pub fn set_matcap(material: Material, matcap: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNormalScale")
pub fn set_normal_scale(material: Material, normal_scale: Vec2(Float)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialAlphaMap")
pub fn set_alpha_map(material: Material, alpha_map: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialEmissiveMap")
pub fn set_emissive_map(material: Material, emissive_map: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialAoMap")
pub fn set_ao_map(material: Material, ao_map: Option(Texture)) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialAoMapIntensity")
pub fn set_ao_map_intensity(material: Material, ao_map_intensity: Float) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialRoughnessMap")
pub fn set_roughness_map(
  material: Material,
  roughness_map: Option(Texture),
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialMetalnessMap")
pub fn set_metalness_map(
  material: Material,
  metalness_map: Option(Texture),
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementMap")
pub fn set_displacement_map(
  material: Material,
  displacement_map: Option(Texture),
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementScale")
pub fn set_displacement_scale(material: Material, displacement_scale: Float) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementBias")
pub fn set_displacement_bias(material: Material, displacement_bias: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialClearcoat")
pub fn set_clearcoat(material: Material, clearcoat: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialClearcoatRoughness")
pub fn set_clearcoat_roughness(
  material: Material,
  clearcoat_roughness: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialTransmission")
pub fn set_transmission(material: Material, transmission: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialThickness")
pub fn set_thickness(material: Material, thickness: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialIor")
pub fn set_ior(material: Material, ior: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialFlatShading")
pub fn set_flat_shading(material: Material, flat_shading: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialVertexColors")
pub fn set_vertex_colors(material: Material, vertex_colors: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialDepthTest")
pub fn set_depth_test(material: Material, depth_test: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialDepthWrite")
pub fn set_depth_write(material: Material, depth_write: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialFog")
pub fn set_fog(material: Material, fog: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialSide")
fn set_side_ffi(material: Material, side: Int) -> Material

pub fn set_side(material: Material, side: MaterialSide) -> Material {
  set_side_ffi(material, material_side_to_int(side))
}

@external(javascript, "./material.ffi.mjs", "setMaterialNeedsUpdate")
pub fn set_needs_update(material: Material, needs_update: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "disposeMaterial")
pub fn dispose(material: Material) -> Nil
