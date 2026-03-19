//// Material constructors and material property updates.
////
//// The module exposes option records for common Three.js material families and
//// a shared set of mutating helpers for runtime updates.

import gleam/option.{type Option, None}
import savoiardi/texture.{type Texture}
import vec/vec2.{type Vec2}

/// A render material.
pub type Material

/// The face sides a material can render.
pub type MaterialSide {
  FrontSide
  BackSide
  DoubleSide
}

/// Options for creating a basic material.
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

/// Options for creating a standard material.
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

/// Options for creating a physical material.
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

/// Options for creating a phong material.
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

/// Options for creating a lambert material.
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

/// Options for creating a toon material.
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

/// Options for creating a normal material.
pub type NormalOptions {
  NormalOptions(
    transparent: Bool,
    opacity: Float,
    wireframe: Bool,
    flat_shading: Bool,
    side: MaterialSide,
  )
}

/// Options for creating a matcap material.
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

/// Options for creating a shadow material.
pub type ShadowOptions {
  ShadowOptions(color: Int, transparent: Bool, opacity: Float)
}

/// Options for creating a basic line material.
pub type LineBasicOptions {
  LineBasicOptions(
    color: Int,
    transparent: Bool,
    opacity: Float,
    alpha_test: Float,
    depth_write: Bool,
    linewidth: Float,
  )
}

/// Returns default options for a basic material.
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

/// Returns default options for a standard material.
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

/// Returns default options for a physical material.
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

/// Returns default options for a phong material.
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

/// Returns default options for a lambert material.
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

/// Returns default options for a toon material.
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

/// Returns default options for a normal material.
pub fn normal_options() -> NormalOptions {
  NormalOptions(
    transparent: False,
    opacity: 1.0,
    wireframe: False,
    flat_shading: False,
    side: FrontSide,
  )
}

/// Returns default options for a matcap material.
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

/// Returns default options for a shadow material.
pub fn shadow_options() -> ShadowOptions {
  ShadowOptions(color: 0x000000, transparent: True, opacity: 1.0)
}

/// Returns default options for a line basic material.
pub fn line_basic_options() -> LineBasicOptions {
  LineBasicOptions(
    color: 0xffffff,
    transparent: False,
    opacity: 1.0,
    alpha_test: 0.0,
    depth_write: True,
    linewidth: 1.0,
  )
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

/// Creates a basic material.
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

/// Creates a standard material.
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

/// Creates a physical material.
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

/// Creates a phong material.
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

/// Creates a lambert material.
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

/// Creates a toon material.
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

/// Creates a normal material.
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

/// Creates a matcap material.
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

/// Creates a shadow material.
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

/// Creates a line basic material.
pub fn line_basic(options: LineBasicOptions) -> Material {
  create_line_basic_material_ffi(
    options.color,
    options.transparent,
    options.opacity,
    options.alpha_test,
    options.depth_write,
    options.linewidth,
  )
}

@external(javascript, "./material.ffi.mjs", "createLineBasicMaterial")
fn create_line_basic_material_ffi(
  color: Int,
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
  depth_write: Bool,
  linewidth: Float,
) -> Material

/// Enables or disables wireframe rendering.
@external(javascript, "./material.ffi.mjs", "updateMaterialWireframe")
pub fn set_wireframe(material: Material, wireframe: Bool) -> Material

/// Sets the base color of a material.
pub fn set_color(material: Material, color: Int) -> Material {
  set_color_ffi(material, color)
}

@external(javascript, "./material.ffi.mjs", "updateMaterialColor")
fn set_color_ffi(material: Material, color: Int) -> Material

/// Sets whether a material is transparent.
@external(javascript, "./material.ffi.mjs", "updateMaterialTransparent")
pub fn set_transparent(material: Material, transparent: Bool) -> Material

/// Sets the opacity of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialOpacity")
pub fn set_opacity(material: Material, opacity: Float) -> Material

/// Sets the emissive color of a material.
pub fn set_emissive(material: Material, emissive: Int) -> Material {
  set_emissive_ffi(material, emissive)
}

@external(javascript, "./material.ffi.mjs", "updateMaterialEmissive")
fn set_emissive_ffi(material: Material, emissive: Int) -> Material

/// Sets the emissive intensity of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialEmissiveIntensity")
pub fn set_emissive_intensity(
  material: Material,
  emissive_intensity: Float,
) -> Material

/// Sets the roughness of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialRoughness")
pub fn set_roughness(material: Material, roughness: Float) -> Material

/// Sets the metalness of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialMetalness")
pub fn set_metalness(material: Material, metalness: Float) -> Material

/// Sets the environment map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialEnvMap")
pub fn set_env_map(material: Material, env_map: Texture) -> Material

/// Sets the normal map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialNormalMap")
pub fn set_normal_map(material: Material, normal_map: Texture) -> Material

/// Sets the matcap texture of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialMatcap")
pub fn set_matcap(material: Material, matcap: Texture) -> Material

/// Sets the normal scale of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialNormalScale")
pub fn set_normal_scale(
  material: Material,
  normal_scale: Vec2(Float),
) -> Material

/// Sets the alpha map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialAlphaMap")
pub fn set_alpha_map(material: Material, alpha_map: Texture) -> Material

/// Sets the emissive map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialEmissiveMap")
pub fn set_emissive_map(material: Material, emissive_map: Texture) -> Material

/// Sets the ambient occlusion map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialAoMap")
pub fn set_ambient_occlusion_map(
  material: Material,
  ambient_occlusion_map: Texture,
) -> Material

/// Sets the ambient occlusion map intensity.
@external(javascript, "./material.ffi.mjs", "updateMaterialAoMapIntensity")
pub fn set_ambient_occlusion_map_intensity(
  material: Material,
  ambient_occlusion_map_intensity: Float,
) -> Material

/// Sets the roughness map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialRoughnessMap")
pub fn set_roughness_map(material: Material, roughness_map: Texture) -> Material

/// Sets the metalness map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialMetalnessMap")
pub fn set_metalness_map(material: Material, metalness_map: Texture) -> Material

/// Sets the displacement map of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementMap")
pub fn set_displacement_map(
  material: Material,
  displacement_map: Texture,
) -> Material

/// Sets the displacement scale of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementScale")
pub fn set_displacement_scale(
  material: Material,
  displacement_scale: Float,
) -> Material

/// Sets the displacement bias of a material.
@external(javascript, "./material.ffi.mjs", "setMaterialDisplacementBias")
pub fn set_displacement_bias(
  material: Material,
  displacement_bias: Float,
) -> Material

/// Sets the clearcoat amount of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialClearcoat")
pub fn set_clearcoat(material: Material, clearcoat: Float) -> Material

/// Sets the clearcoat roughness of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialClearcoatRoughness")
pub fn set_clearcoat_roughness(
  material: Material,
  clearcoat_roughness: Float,
) -> Material

/// Sets the transmission amount of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialTransmission")
pub fn set_transmission(material: Material, transmission: Float) -> Material

/// Sets the thickness of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialThickness")
pub fn set_thickness(material: Material, thickness: Float) -> Material

/// Sets the index of refraction of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialIor")
pub fn set_ior(material: Material, ior: Float) -> Material

/// Enables or disables flat shading.
@external(javascript, "./material.ffi.mjs", "updateMaterialFlatShading")
pub fn set_flat_shading(material: Material, flat_shading: Bool) -> Material

/// Enables or disables vertex colors.
@external(javascript, "./material.ffi.mjs", "updateMaterialVertexColors")
pub fn set_vertex_colors(material: Material, vertex_colors: Bool) -> Material

/// Enables or disables depth testing.
@external(javascript, "./material.ffi.mjs", "updateMaterialDepthTest")
pub fn set_depth_test(material: Material, depth_test: Bool) -> Material

/// Enables or disables depth writing.
@external(javascript, "./material.ffi.mjs", "updateMaterialDepthWrite")
pub fn set_depth_write(material: Material, depth_write: Bool) -> Material

/// Sets the line width of a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialLineWidth")
pub fn set_line_width(material: Material, linewidth: Float) -> Material

/// Enables or disables scene fog for a material.
@external(javascript, "./material.ffi.mjs", "updateMaterialFog")
pub fn set_fog(material: Material, fog: Bool) -> Material

/// Sets which sides of geometry a material should render.
pub fn set_side(material: Material, side: MaterialSide) -> Material {
  set_side_ffi(material, material_side_to_int(side))
}

@external(javascript, "./material.ffi.mjs", "updateMaterialSide")
fn set_side_ffi(material: Material, side: Int) -> Material

/// Marks a material as needing an update.
@external(javascript, "./material.ffi.mjs", "setMaterialNeedsUpdate")
pub fn set_needs_update(material: Material, needs_update: Bool) -> Material

/// Disposes a material.
@external(javascript, "../savoiardi.ffi.mjs", "disposeMaterial")
pub fn dispose(material: Material) -> Nil
