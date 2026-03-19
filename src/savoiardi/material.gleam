import gleam/option.{type Option, None}
import savoiardi/texture.{type Texture}
import vec/vec2.{type Vec2}

pub type Material

pub type MaterialSide {
  FrontSide
  BackSide
  DoubleSide
}

pub type BasicOptions {
  BasicOptions(
    color: Int,
    transparent: Bool,
    opacity: Float,
    color_map: Option(Texture),
    side: MaterialSide,
    alpha_test: Float,
    depth_write: Bool,
  )
}

pub type StandardOptions {
  StandardOptions(
    color: Int,
    metalness: Float,
    roughness: Float,
    transparent: Bool,
    opacity: Float,
    color_map: Option(Texture),
    normal_map: Option(Texture),
    ambient_occlusion_map: Option(Texture),
    displacement_map: Option(Texture),
    displacement_scale: Float,
    displacement_bias: Float,
    roughness_map: Option(Texture),
    metalness_map: Option(Texture),
    emissive: Int,
    emissive_intensity: Float,
    alpha_test: Float,
  )
}

pub type PhysicalOptions {
  PhysicalOptions(
    color: Int,
    metalness: Float,
    roughness: Float,
    transparent: Bool,
    opacity: Float,
    color_map: Option(Texture),
    normal_map: Option(Texture),
    ambient_occlusion_map: Option(Texture),
    displacement_map: Option(Texture),
    displacement_scale: Float,
    displacement_bias: Float,
    roughness_map: Option(Texture),
    metalness_map: Option(Texture),
    emissive: Int,
    emissive_intensity: Float,
    alpha_test: Float,
    clearcoat: Float,
    clearcoat_roughness: Float,
    transmission: Float,
    thickness: Float,
    ior: Float,
  )
}

pub type PhongOptions {
  PhongOptions(
    color: Int,
    shininess: Float,
    color_map: Option(Texture),
    normal_map: Option(Texture),
    ambient_occlusion_map: Option(Texture),
    transparent: Bool,
    opacity: Float,
    alpha_test: Float,
  )
}

pub type LambertOptions {
  LambertOptions(
    color: Int,
    color_map: Option(Texture),
    normal_map: Option(Texture),
    ambient_occlusion_map: Option(Texture),
    transparent: Bool,
    opacity: Float,
    alpha_test: Float,
  )
}

pub type ToonOptions {
  ToonOptions(
    color: Int,
    color_map: Option(Texture),
    normal_map: Option(Texture),
    ambient_occlusion_map: Option(Texture),
    transparent: Bool,
    opacity: Float,
    alpha_test: Float,
  )
}

pub type NormalOptions {
  NormalOptions(
    transparent: Bool,
    opacity: Float,
    wireframe: Bool,
    flat_shading: Bool,
    side: MaterialSide,
  )
}

pub type MatcapOptions {
  MatcapOptions(
    color: Int,
    matcap: Option(Texture),
    transparent: Bool,
    opacity: Float,
    flat_shading: Bool,
    side: MaterialSide,
  )
}

pub type ShadowOptions {
  ShadowOptions(color: Int, transparent: Bool, opacity: Float)
}

pub fn basic_options() -> BasicOptions {
  BasicOptions(
    color: 0xffffff,
    transparent: False,
    opacity: 1.0,
    color_map: None,
    side: FrontSide,
    alpha_test: 0.0,
    depth_write: True,
  )
}

pub fn standard_options() -> StandardOptions {
  StandardOptions(
    color: 0xffffff,
    metalness: 0.0,
    roughness: 1.0,
    transparent: False,
    opacity: 1.0,
    color_map: None,
    normal_map: None,
    ambient_occlusion_map: None,
    displacement_map: None,
    displacement_scale: 0.0,
    displacement_bias: 0.0,
    roughness_map: None,
    metalness_map: None,
    emissive: 0x000000,
    emissive_intensity: 1.0,
    alpha_test: 0.0,
  )
}

pub fn physical_options() -> PhysicalOptions {
  PhysicalOptions(
    color: 0xffffff,
    metalness: 0.0,
    roughness: 1.0,
    transparent: False,
    opacity: 1.0,
    color_map: None,
    normal_map: None,
    ambient_occlusion_map: None,
    displacement_map: None,
    displacement_scale: 0.0,
    displacement_bias: 0.0,
    roughness_map: None,
    metalness_map: None,
    emissive: 0x000000,
    emissive_intensity: 1.0,
    alpha_test: 0.0,
    clearcoat: 0.0,
    clearcoat_roughness: 0.0,
    transmission: 0.0,
    thickness: 0.0,
    ior: 1.5,
  )
}

pub fn phong_options() -> PhongOptions {
  PhongOptions(
    color: 0xffffff,
    shininess: 30.0,
    color_map: None,
    normal_map: None,
    ambient_occlusion_map: None,
    transparent: False,
    opacity: 1.0,
    alpha_test: 0.0,
  )
}

pub fn lambert_options() -> LambertOptions {
  LambertOptions(
    color: 0xffffff,
    color_map: None,
    normal_map: None,
    ambient_occlusion_map: None,
    transparent: False,
    opacity: 1.0,
    alpha_test: 0.0,
  )
}

pub fn toon_options() -> ToonOptions {
  ToonOptions(
    color: 0xffffff,
    color_map: None,
    normal_map: None,
    ambient_occlusion_map: None,
    transparent: False,
    opacity: 1.0,
    alpha_test: 0.0,
  )
}

pub fn normal_options() -> NormalOptions {
  NormalOptions(
    transparent: False,
    opacity: 1.0,
    wireframe: False,
    flat_shading: False,
    side: FrontSide,
  )
}

pub fn matcap_options() -> MatcapOptions {
  MatcapOptions(
    color: 0xffffff,
    matcap: None,
    transparent: False,
    opacity: 1.0,
    flat_shading: False,
    side: FrontSide,
  )
}

pub fn shadow_options() -> ShadowOptions {
  ShadowOptions(color: 0x000000, transparent: True, opacity: 1.0)
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

pub fn basic(options: BasicOptions) -> Material {
  create_basic_material_ffi(
    options.color,
    options.transparent,
    options.opacity,
    options.color_map,
    material_side_to_int(options.side),
    options.alpha_test,
    options.depth_write,
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

pub fn standard(options: StandardOptions) -> Material {
  create_standard_material_ffi(
    options.color,
    options.metalness,
    options.roughness,
    options.transparent,
    options.opacity,
    options.color_map,
    options.normal_map,
    options.ambient_occlusion_map,
    options.displacement_map,
    options.displacement_scale,
    options.displacement_bias,
    options.roughness_map,
    options.metalness_map,
    options.emissive,
    options.emissive_intensity,
    options.alpha_test,
  )
}

@external(javascript, "./material.ffi.mjs", "createStandardMaterial")
fn create_standard_material_ffi(
  color: Int,
  metalness: Float,
  roughness: Float,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  normal_map: Option(Texture),
  ambient_occlusion_map: Option(Texture),
  displacement_map: Option(Texture),
  displacement_scale: Float,
  displacement_bias: Float,
  roughness_map: Option(Texture),
  metalness_map: Option(Texture),
  emissive: Int,
  emissive_intensity: Float,
  alpha_test: Float,
) -> Material

pub fn physical(options: PhysicalOptions) -> Material {
  create_physical_material_ffi(
    options.color,
    options.metalness,
    options.roughness,
    options.transparent,
    options.opacity,
    options.color_map,
    options.normal_map,
    options.ambient_occlusion_map,
    options.displacement_map,
    options.displacement_scale,
    options.displacement_bias,
    options.roughness_map,
    options.metalness_map,
    options.emissive,
    options.emissive_intensity,
    options.alpha_test,
    options.clearcoat,
    options.clearcoat_roughness,
    options.transmission,
    options.thickness,
    options.ior,
  )
}

@external(javascript, "./material.ffi.mjs", "createPhysicalMaterial")
fn create_physical_material_ffi(
  color: Int,
  metalness: Float,
  roughness: Float,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  normal_map: Option(Texture),
  ambient_occlusion_map: Option(Texture),
  displacement_map: Option(Texture),
  displacement_scale: Float,
  displacement_bias: Float,
  roughness_map: Option(Texture),
  metalness_map: Option(Texture),
  emissive: Int,
  emissive_intensity: Float,
  alpha_test: Float,
  clearcoat: Float,
  clearcoat_roughness: Float,
  transmission: Float,
  thickness: Float,
  ior: Float,
) -> Material

pub fn phong(options: PhongOptions) -> Material {
  create_phong_material_ffi(
    options.color,
    options.shininess,
    options.color_map,
    options.normal_map,
    options.ambient_occlusion_map,
    options.transparent,
    options.opacity,
    options.alpha_test,
  )
}

@external(javascript, "./material.ffi.mjs", "createPhongMaterial")
fn create_phong_material_ffi(
  color: Int,
  shininess: Float,
  map: Option(Texture),
  normal_map: Option(Texture),
  ambient_occlusion_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

pub fn lambert(options: LambertOptions) -> Material {
  create_lambert_material_ffi(
    options.color,
    options.color_map,
    options.normal_map,
    options.ambient_occlusion_map,
    options.transparent,
    options.opacity,
    options.alpha_test,
  )
}

@external(javascript, "./material.ffi.mjs", "createLambertMaterial")
fn create_lambert_material_ffi(
  color: Int,
  map: Option(Texture),
  normal_map: Option(Texture),
  ambient_occlusion_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

pub fn toon(options: ToonOptions) -> Material {
  create_toon_material_ffi(
    options.color,
    options.color_map,
    options.normal_map,
    options.ambient_occlusion_map,
    options.transparent,
    options.opacity,
    options.alpha_test,
  )
}

@external(javascript, "./material.ffi.mjs", "createToonMaterial")
fn create_toon_material_ffi(
  color: Int,
  map: Option(Texture),
  normal_map: Option(Texture),
  ambient_occlusion_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

pub fn normal(options: NormalOptions) -> Material {
  create_normal_material(
    transparent: options.transparent,
    opacity: options.opacity,
    wireframe: options.wireframe,
    flat_shading: options.flat_shading,
    side: material_side_to_int(options.side),
  )
}

@external(javascript, "./material.ffi.mjs", "createNormalMaterial")
fn create_normal_material(
  transparent transparent: Bool,
  opacity opacity: Float,
  wireframe wireframe: Bool,
  flat_shading flat_shading: Bool,
  side side: Int,
) -> Material

pub fn matcap(options: MatcapOptions) -> Material {
  create_matcap_material(
    color: options.color,
    matcap: options.matcap,
    transparent: options.transparent,
    opacity: options.opacity,
    flat_shading: options.flat_shading,
    side: material_side_to_int(options.side),
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

pub fn shadow(options: ShadowOptions) -> Material {
  create_shadow_material_ffi(
    options.color,
    options.transparent,
    options.opacity,
  )
}

@external(javascript, "./material.ffi.mjs", "createShadowMaterial")
fn create_shadow_material_ffi(
  color: Int,
  transparent: Bool,
  opacity: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialWireframe")
pub fn set_wireframe(material: Material, wireframe: Bool) -> Material

pub fn set_color(material: Material, color: Int) -> Material {
  set_color_ffi(material, color)
}

@external(javascript, "./material.ffi.mjs", "updateMaterialColor")
fn set_color_ffi(material: Material, color: Int) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialTransparent")
pub fn set_transparent(material: Material, transparent: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialOpacity")
pub fn set_opacity(material: Material, opacity: Float) -> Material

pub fn set_emissive(material: Material, emissive: Int) -> Material {
  set_emissive_ffi(material, emissive)
}

@external(javascript, "./material.ffi.mjs", "updateMaterialEmissive")
fn set_emissive_ffi(material: Material, emissive: Int) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialEmissiveIntensity")
pub fn set_emissive_intensity(
  material: Material,
  emissive_intensity: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialRoughness")
pub fn set_roughness(material: Material, roughness: Float) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialMetalness")
pub fn set_metalness(material: Material, metalness: Float) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialEnvMap")
pub fn set_env_map(material: Material, env_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNormalMap")
pub fn set_normal_map(material: Material, normal_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialMatcap")
pub fn set_matcap(material: Material, matcap: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNormalScale")
pub fn set_normal_scale(
  material: Material,
  normal_scale: Vec2(Float),
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialAlphaMap")
pub fn set_alpha_map(material: Material, alpha_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialEmissiveMap")
pub fn set_emissive_map(material: Material, emissive_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialAoMap")
pub fn set_ambient_occlusion_map(
  material: Material,
  ambient_occlusion_map: Texture,
) -> Material

@external(javascript, "./material.ffi.mjs", "updateMaterialAoMapIntensity")
pub fn set_ambient_occlusion_map_intensity(
  material: Material,
  ambient_occlusion_map_intensity: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialRoughnessMap")
pub fn set_roughness_map(material: Material, roughness_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialMetalnessMap")
pub fn set_metalness_map(material: Material, metalness_map: Texture) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementMap")
pub fn set_displacement_map(
  material: Material,
  displacement_map: Texture,
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementScale")
pub fn set_displacement_scale(
  material: Material,
  displacement_scale: Float,
) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementBias")
pub fn set_displacement_bias(
  material: Material,
  displacement_bias: Float,
) -> Material

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

pub fn set_side(material: Material, side: MaterialSide) -> Material {
  set_side_ffi(material, material_side_to_int(side))
}

@external(javascript, "./material.ffi.mjs", "updateMaterialSide")
fn set_side_ffi(material: Material, side: Int) -> Material

@external(javascript, "./material.ffi.mjs", "setMaterialNeedsUpdate")
pub fn set_needs_update(material: Material, needs_update: Bool) -> Material

@external(javascript, "./material.ffi.mjs", "disposeMaterial")
pub fn dispose(material: Material) -> Nil
