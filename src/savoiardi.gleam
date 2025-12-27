//// Savoiardi - Three.js bindings for Gleam
////
//// Part of the tiramisu game engine ecosystem.
//// Provides type-safe bindings to Three.js for 3D graphics in the browser.

import gleam/javascript/array
import gleam/javascript/promise.{type Promise}
import gleam/time/duration.{type Duration}

// ============================================================================
// CORE TYPES
// ============================================================================

/// Opaque type for Three.js Object3D - the base class for most Three.js objects.
pub type Object3D

/// Opaque type for Three.js Scene
pub type Scene

/// Opaque type for Three.js WebGLRenderer
pub type Renderer

/// Opaque type for Three.js Camera (base class)
pub type Camera

/// Opaque type for Three.js Geometry
pub type Geometry

/// Opaque type for Three.js Material
pub type Material

/// Opaque type for Three.js Texture
pub type Texture

/// Opaque type for Three.js CubeTexture (for skyboxes)
pub type CubeTexture

/// Opaque type for Three.js Light
pub type Light

/// Opaque type for Three.js AnimationClip
pub type AnimationClip

/// Opaque type for Three.js AnimationMixer
pub type AnimationMixer

/// Opaque type for Three.js AnimationAction
pub type AnimationAction

/// Opaque type for Three.js Audio
pub type Audio

/// Opaque type for Three.js AudioListener
pub type AudioListener

/// Opaque type for Three.js PositionalAudio
pub type PositionalAudio

/// Opaque type for Three.js LOD (Level of Detail)
pub type LOD

/// Opaque type for Three.js InstancedMesh
pub type InstancedMesh

/// Opaque type for Three.js Sprite
pub type Sprite

/// Opaque type for Three.js Points (particle system)
pub type Points

/// Opaque type for HTML Canvas element
pub type Canvas

/// Opaque type for loaded GLTF data
pub type GLTFData

/// Opaque type for loaded FBX data
pub type FBXData

/// Opaque type for CSS2DRenderer
pub type CSS2DRenderer

/// Opaque type for CSS2DObject
pub type CSS2DObject

/// Opaque type for CSS3DObject
pub type CSS3DObject

/// Opaque type for loaded font
pub type Font

// ============================================================================
// SCENE
// ============================================================================

/// Create a new Three.js scene
@external(javascript, "./savoiardi.ffi.mjs", "createScene")
pub fn create_scene() -> Scene

/// Set scene background to a solid color
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundColor")
pub fn set_scene_background_color(scene: Scene, color: Int) -> Scene

/// Set scene background to a texture
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundTexture")
pub fn set_scene_background_texture(scene: Scene, texture: Texture) -> Scene

/// Set scene background to a cube texture (skybox)
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundCubeTexture")
pub fn set_scene_background_cube_texture(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

/// Add an object to the scene
@external(javascript, "./savoiardi.ffi.mjs", "addToScene")
pub fn add_to_scene(scene: Scene, object: Object3D) -> Nil

/// Remove an object from the scene
@external(javascript, "./savoiardi.ffi.mjs", "removeFromScene")
pub fn remove_from_scene(scene: Scene, object: Object3D) -> Nil

// ============================================================================
// RENDERER
// ============================================================================

@external(javascript, "./savoiardi.ffi.mjs", "getCanvasDimensions")
pub fn get_canvas_dimensions(renderer: Renderer) -> #(Float, Float)

/// Create a new WebGL renderer
@external(javascript, "./savoiardi.ffi.mjs", "createRenderer")
pub fn create_renderer(options: a) -> Renderer

/// Get the canvas DOM element from the renderer
@external(javascript, "./savoiardi.ffi.mjs", "getRendererDomElement")
pub fn get_renderer_dom_element(renderer: Renderer) -> Canvas

/// Set renderer size
@external(javascript, "./savoiardi.ffi.mjs", "setRendererSize")
pub fn set_renderer_size(renderer: Renderer, width: Int, height: Int) -> Nil

/// Set renderer pixel ratio
@external(javascript, "./savoiardi.ffi.mjs", "setRendererPixelRatio")
pub fn set_renderer_pixel_ratio(renderer: Renderer, ratio: Float) -> Nil

/// Render a scene with a camera
@external(javascript, "./savoiardi.ffi.mjs", "render")
pub fn render(renderer: Renderer, scene: Scene, camera: Camera) -> Nil

/// Clear the renderer
@external(javascript, "./savoiardi.ffi.mjs", "clearRenderer")
pub fn clear_renderer(renderer: Renderer) -> Nil

/// Set viewport
@external(javascript, "./savoiardi.ffi.mjs", "setViewport")
pub fn set_viewport(
  renderer: Renderer,
  x: Int,
  y: Int,
  width: Int,
  height: Int,
) -> Nil

/// Set scissor region
@external(javascript, "./savoiardi.ffi.mjs", "setScissor")
pub fn set_scissor(
  renderer: Renderer,
  x: Int,
  y: Int,
  width: Int,
  height: Int,
) -> Nil

/// Enable/disable scissor test
@external(javascript, "./savoiardi.ffi.mjs", "setScissorTest")
pub fn set_scissor_test(renderer: Renderer, enabled: Bool) -> Nil

/// Get render stats (draw calls, triangles)
@external(javascript, "./savoiardi.ffi.mjs", "getRenderStats")
pub fn get_render_stats(renderer: Renderer) -> #(Int, Int)

// ============================================================================
// CANVAS
// ============================================================================

/// Set the global canvas reference
@external(javascript, "./savoiardi.ffi.mjs", "setCanvas")
pub fn set_canvas(canvas: Canvas) -> Nil

/// Get the global canvas reference
@external(javascript, "./savoiardi.ffi.mjs", "getCanvas")
pub fn get_canvas() -> Canvas

/// Get canvas client width
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasClientWidth")
pub fn get_canvas_client_width(canvas: Canvas) -> Float

/// Get canvas client height
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasClientHeight")
pub fn get_canvas_client_height(canvas: Canvas) -> Float

/// Get window inner width
@external(javascript, "./savoiardi.ffi.mjs", "getWindowWidth")
pub fn get_window_width() -> Float

/// Get window inner height
@external(javascript, "./savoiardi.ffi.mjs", "getWindowHeight")
pub fn get_window_height() -> Float

// ============================================================================
// CAMERA
// ============================================================================

/// Set the active camera (global state for rendering)
@external(javascript, "./savoiardi.ffi.mjs", "setActiveCamera")
pub fn set_active_camera(camera: Camera) -> Nil

/// Get the active camera
@external(javascript, "./savoiardi.ffi.mjs", "getActiveCamera")
pub fn get_active_camera() -> Camera

/// Create a perspective camera
@external(javascript, "./savoiardi.ffi.mjs", "createPerspectiveCamera")
pub fn create_perspective_camera(
  fov: Float,
  aspect: Float,
  near: Float,
  far: Float,
) -> Camera

/// Create an orthographic camera
@external(javascript, "./savoiardi.ffi.mjs", "createOrthographicCamera")
pub fn create_orthographic_camera(
  left: Float,
  right: Float,
  top: Float,
  bottom: Float,
  near: Float,
  far: Float,
) -> Camera

/// Update camera projection matrix after changes
@external(javascript, "./savoiardi.ffi.mjs", "updateProjectionMatrix")
pub fn update_projection_matrix(camera: Camera) -> Nil

/// Set camera aspect ratio
@external(javascript, "./savoiardi.ffi.mjs", "setCameraAspect")
pub fn set_camera_aspect(camera: Camera, aspect: Float) -> Nil

/// Make camera look at a point
@external(javascript, "./savoiardi.ffi.mjs", "cameraLookAt")
pub fn camera_look_at(camera: Camera, x: Float, y: Float, z: Float) -> Nil

/// Check if camera is perspective
@external(javascript, "./savoiardi.ffi.mjs", "isPerspectiveCamera")
pub fn is_perspective_camera(camera: Camera) -> Bool

/// Set user data on a camera (generic for any value type)
@external(javascript, "./savoiardi.ffi.mjs", "setCameraUserData")
pub fn set_camera_user_data(camera: Camera, key: String, value: a) -> Nil

/// Get user data from a camera (generic return type)
@external(javascript, "./savoiardi.ffi.mjs", "getCameraUserData")
pub fn get_camera_user_data(camera: Camera, key: String) -> a

/// Check if camera has specific user data key
@external(javascript, "./savoiardi.ffi.mjs", "hasCameraUserData")
pub fn has_camera_user_data(camera: Camera, key: String) -> Bool

/// Delete user data from camera
@external(javascript, "./savoiardi.ffi.mjs", "deleteCameraUserData")
pub fn delete_camera_user_data(camera: Camera, key: String) -> Nil

// ============================================================================
// OBJECT3D
// ============================================================================

/// Clone an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "cloneObject3D")
pub fn clone_object3d(object: Object3D) -> Object3D

/// Create a group (empty Object3D container)
@external(javascript, "./savoiardi.ffi.mjs", "createGroup")
pub fn create_group() -> Object3D

/// Create a mesh from geometry and material
@external(javascript, "./savoiardi.ffi.mjs", "createMesh")
pub fn create_mesh(geometry: Geometry, material: Material) -> Object3D

/// Add a child to an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "addChild")
pub fn add_child(parent: Object3D, child: Object3D) -> Nil

/// Apply transform (position, rotation, scale)
@external(javascript, "./savoiardi.ffi.mjs", "applyTransform")
pub fn apply_transform(
  object: Object3D,
  px: Float,
  py: Float,
  pz: Float,
  rx: Float,
  ry: Float,
  rz: Float,
  sx: Float,
  sy: Float,
  sz: Float,
) -> Nil

/// Update the world matrix
@external(javascript, "./savoiardi.ffi.mjs", "updateMatrixWorld")
pub fn update_matrix_world(object: Object3D) -> Nil

/// Update the world matrix with force flag
@external(javascript, "./savoiardi.ffi.mjs", "updateMatrixWorldForce")
pub fn update_matrix_world_force(object: Object3D, force: Bool) -> Nil

/// Dispose an Object3D and its resources
@external(javascript, "./savoiardi.ffi.mjs", "disposeObject3D")
pub fn dispose_object3d(object: Object3D) -> Nil

/// Extract mesh and material pairs from an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "extractMeshMaterialPairs")
pub fn extract_mesh_material_pairs(
  object: Object3D,
) -> #(array.Array(Geometry), array.Array(Material))

// ============================================================================
// LOD (Level of Detail)
// ============================================================================

/// Create a LOD object
@external(javascript, "./savoiardi.ffi.mjs", "createLOD")
pub fn create_lod() -> LOD

/// Add a level to a LOD object
@external(javascript, "./savoiardi.ffi.mjs", "addLODLevel")
pub fn add_lod_level(lod: LOD, object: Object3D, distance: Float) -> Nil

/// Remove a level from a LOD object
@external(javascript, "./savoiardi.ffi.mjs", "removeLODLevel")
pub fn remove_lod_level(lod: LOD, distance: Float) -> Nil

// ============================================================================
// INSTANCED MESH
// ============================================================================

/// Create an instanced mesh
@external(javascript, "./savoiardi.ffi.mjs", "createInstancedMesh")
pub fn create_instanced_mesh(
  geometry: Geometry,
  material: Material,
  count: Int,
) -> InstancedMesh

/// Set instance matrix at index
@external(javascript, "./savoiardi.ffi.mjs", "setInstanceMatrix")
pub fn set_instance_matrix(mesh: InstancedMesh, index: Int, matrix: a) -> Nil

/// Update instance matrix buffer
@external(javascript, "./savoiardi.ffi.mjs", "updateInstanceMatrix")
pub fn update_instance_matrix(mesh: InstancedMesh) -> Nil

// ============================================================================
// GEOMETRIES
// ============================================================================

/// Create box geometry
@external(javascript, "./savoiardi.ffi.mjs", "createBoxGeometry")
pub fn create_box_geometry(
  width: Float,
  height: Float,
  depth: Float,
) -> Geometry

/// Create sphere geometry
@external(javascript, "./savoiardi.ffi.mjs", "createSphereGeometry")
pub fn create_sphere_geometry(
  radius: Float,
  width_segments: Int,
  height_segments: Int,
) -> Geometry

/// Create cone geometry
@external(javascript, "./savoiardi.ffi.mjs", "createConeGeometry")
pub fn create_cone_geometry(
  radius: Float,
  height: Float,
  segments: Int,
) -> Geometry

/// Create plane geometry
@external(javascript, "./savoiardi.ffi.mjs", "createPlaneGeometry")
pub fn create_plane_geometry(
  width: Float,
  height: Float,
  width_segments: Int,
  height_segments: Int,
) -> Geometry

/// Create circle geometry
@external(javascript, "./savoiardi.ffi.mjs", "createCircleGeometry")
pub fn create_circle_geometry(radius: Float, segments: Int) -> Geometry

/// Create cylinder geometry
@external(javascript, "./savoiardi.ffi.mjs", "createCylinderGeometry")
pub fn create_cylinder_geometry(
  radius_top: Float,
  radius_bottom: Float,
  height: Float,
  radial_segments: Int,
) -> Geometry

/// Create torus geometry
@external(javascript, "./savoiardi.ffi.mjs", "createTorusGeometry")
pub fn create_torus_geometry(
  radius: Float,
  tube: Float,
  radial_segments: Int,
  tubular_segments: Int,
) -> Geometry

/// Create tetrahedron geometry
@external(javascript, "./savoiardi.ffi.mjs", "createTetrahedronGeometry")
pub fn create_tetrahedron_geometry(radius: Float, detail: Int) -> Geometry

/// Create icosahedron geometry
@external(javascript, "./savoiardi.ffi.mjs", "createIcosahedronGeometry")
pub fn create_icosahedron_geometry(radius: Float, detail: Int) -> Geometry

/// Create text geometry (requires loaded Font)
@external(javascript, "./savoiardi.ffi.mjs", "createTextGeometry")
pub fn create_text_geometry(
  text: String,
  font: Font,
  size: Float,
  depth: Float,
  curve_segments: Int,
  bevel_enabled: Bool,
  bevel_thickness: Float,
  bevel_size: Float,
  bevel_offset: Float,
  bevel_segments: Int,
) -> Geometry

// ============================================================================
// MATERIALS
// ============================================================================

/// Create basic material
@external(javascript, "./savoiardi.ffi.mjs", "createBasicMaterial")
pub fn create_basic_material(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: a,
) -> Material

/// Create standard PBR material
@external(javascript, "./savoiardi.ffi.mjs", "createStandardMaterial")
pub fn create_standard_material(
  color: Int,
  metalness: Float,
  roughness: Float,
  transparent: Bool,
  opacity: Float,
  map: a,
  normal_map: b,
  ao_map: c,
  displacement_map: d,
  displacement_scale: Float,
  displacement_bias: Float,
  roughness_map: e,
  metalness_map: f,
  emissive: Int,
  emissive_intensity: Float,
) -> Material

/// Create phong material
@external(javascript, "./savoiardi.ffi.mjs", "createPhongMaterial")
pub fn create_phong_material(
  color: Int,
  shininess: Float,
  map: a,
  normal_map: b,
  ao_map: c,
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Create lambert material
@external(javascript, "./savoiardi.ffi.mjs", "createLambertMaterial")
pub fn create_lambert_material(
  color: Int,
  map: a,
  normal_map: b,
  ao_map: c,
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Create toon material
@external(javascript, "./savoiardi.ffi.mjs", "createToonMaterial")
pub fn create_toon_material(
  color: Int,
  map: a,
  normal_map: b,
  ao_map: c,
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Create line material
@external(javascript, "./savoiardi.ffi.mjs", "createLineMaterial")
pub fn create_line_material(color: Int, linewidth: Float) -> Material

/// Create sprite material
@external(javascript, "./savoiardi.ffi.mjs", "createSpriteMaterial")
pub fn create_sprite_material(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: a,
) -> Material

/// Create points material
@external(javascript, "./savoiardi.ffi.mjs", "createPointsMaterial")
pub fn create_points_material(
  size: Float,
  vertex_colors: Bool,
  transparent: Bool,
  opacity: Float,
  depth_write: Bool,
  blending: Int,
  size_attenuation: Bool,
) -> Material

// ============================================================================
// LIGHTS
// ============================================================================

/// Create ambient light
@external(javascript, "./savoiardi.ffi.mjs", "createAmbientLight")
pub fn create_ambient_light(color: Int, intensity: Float) -> Light

/// Create directional light
@external(javascript, "./savoiardi.ffi.mjs", "createDirectionalLight")
pub fn create_directional_light(
  color: Int,
  intensity: Float,
  cast_shadow: Bool,
  shadow_resolution: Int,
  shadow_bias: Float,
) -> Light

/// Create point light
@external(javascript, "./savoiardi.ffi.mjs", "createPointLight")
pub fn create_point_light(
  color: Int,
  intensity: Float,
  distance: Float,
  cast_shadow: Bool,
  shadow_resolution: Int,
  shadow_bias: Float,
) -> Light

/// Create spot light
@external(javascript, "./savoiardi.ffi.mjs", "createSpotLight")
pub fn create_spot_light(
  color: Int,
  intensity: Float,
  distance: Float,
  angle: Float,
  penumbra: Float,
  cast_shadow: Bool,
  shadow_resolution: Int,
  shadow_bias: Float,
) -> Light

/// Create hemisphere light
@external(javascript, "./savoiardi.ffi.mjs", "createHemisphereLight")
pub fn create_hemisphere_light(
  sky_color: Int,
  ground_color: Int,
  intensity: Float,
) -> Light

// ============================================================================
// OBJECTS
// ============================================================================

/// Create a sprite
@external(javascript, "./savoiardi.ffi.mjs", "createSprite")
pub fn create_sprite(material: Material) -> Sprite

/// Create points (particle system)
@external(javascript, "./savoiardi.ffi.mjs", "createPoints")
pub fn create_points(geometry: Geometry, material: Material) -> Points

/// Create line segments
@external(javascript, "./savoiardi.ffi.mjs", "createLineSegments")
pub fn create_line_segments(geometry: Geometry, material: Material) -> Object3D

/// Clone an object
@external(javascript, "./savoiardi.ffi.mjs", "cloneObject")
pub fn clone_object(object: Object3D) -> Object3D

// ============================================================================
// SCENE GRAPH MANIPULATION
// ============================================================================

/// Remove child from parent
@external(javascript, "./savoiardi.ffi.mjs", "removeChild")
pub fn remove_child(parent: Object3D, child: Object3D) -> Nil

/// Set object position
@external(javascript, "./savoiardi.ffi.mjs", "setPosition")
pub fn set_position(object: Object3D, x: Float, y: Float, z: Float) -> Nil

/// Set object rotation (Euler angles)
@external(javascript, "./savoiardi.ffi.mjs", "setRotation")
pub fn set_rotation(object: Object3D, x: Float, y: Float, z: Float) -> Nil

/// Set object scale
@external(javascript, "./savoiardi.ffi.mjs", "setScale")
pub fn set_scale(object: Object3D, x: Float, y: Float, z: Float) -> Nil

/// Get world position from object
@external(javascript, "./savoiardi.ffi.mjs", "getWorldPosition")
pub fn get_world_position(object: Object3D) -> Vec3

/// Get world quaternion from object
@external(javascript, "./savoiardi.ffi.mjs", "getWorldQuaternion")
pub fn get_world_quaternion(object: Object3D) -> #(Float, Float, Float, Float)

/// Copy position from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyPosition")
pub fn copy_position(object: Object3D, source: Object3D) -> Nil

/// Copy rotation from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyRotation")
pub fn copy_rotation(object: Object3D, source: Object3D) -> Nil

/// Copy scale from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyScale")
pub fn copy_scale(object: Object3D, source: Object3D) -> Nil

/// Opaque type for Vec3 returned from FFI
pub type Vec3

// ============================================================================
// ANIMATION
// ============================================================================

/// Create animation mixer for an object
@external(javascript, "./savoiardi.ffi.mjs", "createAnimationMixer")
pub fn create_animation_mixer(root: Object3D) -> AnimationMixer

/// Get clip action from mixer
@external(javascript, "./savoiardi.ffi.mjs", "clipAction")
pub fn clip_action(
  mixer: AnimationMixer,
  clip: AnimationClip,
) -> AnimationAction

/// Update animation mixer (delta in milliseconds)
@external(javascript, "./savoiardi.ffi.mjs", "updateMixer")
pub fn update_mixer(mixer: AnimationMixer, delta_time: Float) -> Nil

/// Play animation action
@external(javascript, "./savoiardi.ffi.mjs", "playAction")
pub fn play_action(action: AnimationAction) -> Nil

/// Stop animation action
@external(javascript, "./savoiardi.ffi.mjs", "stopAction")
pub fn stop_action(action: AnimationAction) -> Nil

/// Set action loop mode
@external(javascript, "./savoiardi.ffi.mjs", "setActionLoop")
pub fn set_action_loop(action: AnimationAction, loop_mode: Int) -> Nil

/// Set action time scale
@external(javascript, "./savoiardi.ffi.mjs", "setActionTimeScale")
pub fn set_action_time_scale(action: AnimationAction, time_scale: Float) -> Nil

/// Set action weight
@external(javascript, "./savoiardi.ffi.mjs", "setActionWeight")
pub fn set_action_weight(action: AnimationAction, weight: Float) -> Nil

/// Get animation clip name
@external(javascript, "./savoiardi.ffi.mjs", "getClipName")
pub fn get_clip_name(clip: AnimationClip) -> String

/// Get animation clip duration
@external(javascript, "./savoiardi.ffi.mjs", "getClipDuration")
pub fn get_clip_duration(clip: AnimationClip) -> Float

// ============================================================================
// TEXTURES
// ============================================================================

/// Clone texture for independent animation
@external(javascript, "./savoiardi.ffi.mjs", "cloneTexture")
pub fn clone_texture(texture: Texture) -> Texture

/// Set texture offset (UV coordinates)
@external(javascript, "./savoiardi.ffi.mjs", "setTextureOffset")
pub fn set_texture_offset(texture: Texture, x: Float, y: Float) -> Nil

/// Set texture repeat (UV scaling)
@external(javascript, "./savoiardi.ffi.mjs", "setTextureRepeat")
pub fn set_texture_repeat(texture: Texture, x: Float, y: Float) -> Nil

/// Set texture wrapping mode
@external(javascript, "./savoiardi.ffi.mjs", "setTextureWrapMode")
pub fn set_texture_wrap_mode(texture: Texture, wrap_s: Int, wrap_t: Int) -> Nil

/// Set texture filtering mode
@external(javascript, "./savoiardi.ffi.mjs", "setTextureFilterMode")
pub fn set_texture_filter_mode(
  texture: Texture,
  min_filter: Int,
  mag_filter: Int,
) -> Nil

/// Get RepeatWrapping constant
@external(javascript, "./savoiardi.ffi.mjs", "getRepeatWrapping")
pub fn get_repeat_wrapping() -> Int

/// Get ClampToEdgeWrapping constant
@external(javascript, "./savoiardi.ffi.mjs", "getClampToEdgeWrapping")
pub fn get_clamp_to_edge_wrapping() -> Int

/// Get MirroredRepeatWrapping constant
@external(javascript, "./savoiardi.ffi.mjs", "getMirroredRepeatWrapping")
pub fn get_mirrored_repeat_wrapping() -> Int

/// Get NearestFilter constant (for pixel art)
@external(javascript, "./savoiardi.ffi.mjs", "getNearestFilter")
pub fn get_nearest_filter() -> Int

/// Get LinearFilter constant (for smooth textures)
@external(javascript, "./savoiardi.ffi.mjs", "getLinearFilter")
pub fn get_linear_filter() -> Int

// ============================================================================
// AUDIO
// ============================================================================

/// Create audio listener
@external(javascript, "./savoiardi.ffi.mjs", "createAudioListener")
pub fn create_audio_listener() -> AudioListener

/// Create global audio (non-positional)
@external(javascript, "./savoiardi.ffi.mjs", "createAudio")
pub fn create_audio(listener: AudioListener) -> Audio

/// Create positional audio (3D audio)
@external(javascript, "./savoiardi.ffi.mjs", "createPositionalAudio")
pub fn create_positional_audio(listener: AudioListener) -> PositionalAudio

/// Opaque type for AudioBuffer
pub type AudioBuffer

/// Set audio buffer
@external(javascript, "./savoiardi.ffi.mjs", "setAudioBuffer")
pub fn set_audio_buffer(audio: Audio, buffer: AudioBuffer) -> Nil

/// Play audio
@external(javascript, "./savoiardi.ffi.mjs", "playAudio")
pub fn play_audio(audio: Audio) -> Nil

/// Pause audio
@external(javascript, "./savoiardi.ffi.mjs", "pauseAudio")
pub fn pause_audio(audio: Audio) -> Nil

/// Stop audio
@external(javascript, "./savoiardi.ffi.mjs", "stopAudio")
pub fn stop_audio(audio: Audio) -> Nil

/// Set audio volume
@external(javascript, "./savoiardi.ffi.mjs", "setAudioVolume")
pub fn set_audio_volume(audio: Audio, volume: Float) -> Nil

/// Set audio loop
@external(javascript, "./savoiardi.ffi.mjs", "setAudioLoop")
pub fn set_audio_loop(audio: Audio, loop: Bool) -> Nil

/// Set audio playback rate
@external(javascript, "./savoiardi.ffi.mjs", "setAudioPlaybackRate")
pub fn set_audio_playback_rate(audio: Audio, rate: Float) -> Nil

/// Check if audio is playing
@external(javascript, "./savoiardi.ffi.mjs", "isAudioPlaying")
pub fn is_audio_playing(audio: Audio) -> Bool

/// Set positional audio reference distance
@external(javascript, "./savoiardi.ffi.mjs", "setRefDistance")
pub fn set_ref_distance(audio: PositionalAudio, distance: Float) -> Nil

/// Set positional audio rolloff factor
@external(javascript, "./savoiardi.ffi.mjs", "setRolloffFactor")
pub fn set_rolloff_factor(audio: PositionalAudio, factor: Float) -> Nil

/// Set positional audio max distance
@external(javascript, "./savoiardi.ffi.mjs", "setMaxDistance")
pub fn set_max_distance(audio: PositionalAudio, distance: Float) -> Nil

/// Check if audio has a buffer
@external(javascript, "./savoiardi.ffi.mjs", "hasAudioBuffer")
pub fn has_audio_buffer(audio: Audio) -> Bool

/// Get audio loop state
@external(javascript, "./savoiardi.ffi.mjs", "getAudioLoop")
pub fn get_audio_loop(audio: Audio) -> Bool

/// Get AudioContext state
@external(javascript, "./savoiardi.ffi.mjs", "getAudioContextState")
pub fn get_audio_context_state() -> String

/// Resume AudioContext
@external(javascript, "./savoiardi.ffi.mjs", "resumeAudioContext")
pub fn resume_audio_context() -> Nil

/// Play audio with fade in effect
pub fn play_audio_with_fade_in(
  audio: Audio,
  fade_duration: Duration,
  target_volume: Float,
) -> Nil {
  let fade_ms = duration.to_seconds(fade_duration) *. 1000.0
  play_audio_with_fade_in_ffi(audio, fade_ms, target_volume)
}

@external(javascript, "./savoiardi.ffi.mjs", "playAudioWithFadeIn")
fn play_audio_with_fade_in_ffi(
  audio: Audio,
  fade_duration_ms: Float,
  target_volume: Float,
) -> Nil

/// Stop audio with fade out effect
pub fn stop_audio_with_fade_out(
  audio: Audio,
  fade_duration: Duration,
  pause_instead_of_stop: Bool,
) -> Nil {
  let fade_ms = duration.to_seconds(fade_duration) *. 1000.0
  stop_audio_with_fade_out_ffi(audio, fade_ms, pause_instead_of_stop)
}

@external(javascript, "./savoiardi.ffi.mjs", "stopAudioWithFadeOut")
fn stop_audio_with_fade_out_ffi(
  audio: Audio,
  fade_duration_ms: Float,
  pause_instead_of_stop: Bool,
) -> Nil

// ============================================================================
// DEBUG HELPERS
// ============================================================================

/// Create axes helper
@external(javascript, "./savoiardi.ffi.mjs", "createAxesHelper")
pub fn create_axes_helper(size: Float) -> Object3D

/// Create grid helper
@external(javascript, "./savoiardi.ffi.mjs", "createGridHelper")
pub fn create_grid_helper(size: Float, divisions: Int, color: Int) -> Object3D

/// Create box helper (wireframe around object)
@external(javascript, "./savoiardi.ffi.mjs", "createBoxHelper")
pub fn create_box_helper(object: Object3D, color: Int) -> Object3D

// ============================================================================
// BUFFER GEOMETRY MANIPULATION
// ============================================================================

/// Create empty buffer geometry
@external(javascript, "./savoiardi.ffi.mjs", "createBufferGeometry")
pub fn create_buffer_geometry() -> Geometry

/// Opaque type for buffer attribute
pub type BufferAttribute

/// Create buffer attribute
@external(javascript, "./savoiardi.ffi.mjs", "createBufferAttribute")
pub fn create_buffer_attribute(array: a, item_size: Int) -> BufferAttribute

/// Set geometry attribute
@external(javascript, "./savoiardi.ffi.mjs", "setGeometryAttribute")
pub fn set_geometry_attribute(
  geometry: Geometry,
  name: String,
  attribute: BufferAttribute,
) -> Nil

/// Mark buffer attribute as needing update
@external(javascript, "./savoiardi.ffi.mjs", "markAttributeNeedsUpdate")
pub fn mark_attribute_needs_update(attribute: BufferAttribute) -> Nil

/// Set geometry draw range
@external(javascript, "./savoiardi.ffi.mjs", "setDrawRange")
pub fn set_draw_range(geometry: Geometry, start: Int, count: Int) -> Nil

// ============================================================================
// MATH UTILITIES
// ============================================================================

/// Opaque type for Matrix4
pub type Matrix4

/// Opaque type for Vector3 (Three.js)
pub type Vector3

/// Opaque type for Euler
pub type Euler

/// Opaque type for Quaternion (Three.js)
pub type Quaternion

/// Opaque type for Color
pub type Color

/// Create Matrix4
@external(javascript, "./savoiardi.ffi.mjs", "createMatrix4")
pub fn create_matrix4() -> Matrix4

/// Compose matrix from position, quaternion, scale
@external(javascript, "./savoiardi.ffi.mjs", "composeMatrix")
pub fn compose_matrix(
  matrix: Matrix4,
  position: Vector3,
  quaternion: Quaternion,
  scale: Vector3,
) -> Nil

/// Create Vector3
@external(javascript, "./savoiardi.ffi.mjs", "createVector3")
pub fn create_vector3(x: Float, y: Float, z: Float) -> Vector3

/// Create Euler
@external(javascript, "./savoiardi.ffi.mjs", "createEuler")
pub fn create_euler(x: Float, y: Float, z: Float) -> Euler

/// Create Quaternion
@external(javascript, "./savoiardi.ffi.mjs", "createQuaternion")
pub fn create_quaternion() -> Quaternion

/// Set quaternion from Euler
@external(javascript, "./savoiardi.ffi.mjs", "setQuaternionFromEuler")
pub fn set_quaternion_from_euler(quaternion: Quaternion, euler: Euler) -> Nil

/// Create Color from hex
@external(javascript, "./savoiardi.ffi.mjs", "createColor")
pub fn create_color(hex: Int) -> Color

/// Lerp between two colors
@external(javascript, "./savoiardi.ffi.mjs", "lerpColor")
pub fn lerp_color(color1: Color, color2: Color, t: Float) -> Color

// ============================================================================
// CONSTANTS
// ============================================================================

/// Get LoopOnce constant
@external(javascript, "./savoiardi.ffi.mjs", "getLoopOnce")
pub fn get_loop_once() -> Int

/// Get LoopRepeat constant
@external(javascript, "./savoiardi.ffi.mjs", "getLoopRepeat")
pub fn get_loop_repeat() -> Int

/// Get LoopPingPong constant
@external(javascript, "./savoiardi.ffi.mjs", "getLoopPingPong")
pub fn get_loop_ping_pong() -> Int

/// Get AdditiveBlending constant
@external(javascript, "./savoiardi.ffi.mjs", "getAdditiveBlending")
pub fn get_additive_blending() -> Int

/// Get NormalBlending constant
@external(javascript, "./savoiardi.ffi.mjs", "getNormalBlending")
pub fn get_normal_blending() -> Int

// ============================================================================
// PARTICLE SYSTEMS HELPERS
// ============================================================================

/// Get red component from color
@external(javascript, "./savoiardi.ffi.mjs", "getColorR")
pub fn get_color_r(color: Color) -> Float

/// Get green component from color
@external(javascript, "./savoiardi.ffi.mjs", "getColorG")
pub fn get_color_g(color: Color) -> Float

/// Get blue component from color
@external(javascript, "./savoiardi.ffi.mjs", "getColorB")
pub fn get_color_b(color: Color) -> Float

/// Opaque type for Float32Array
pub type Float32Array

/// Create Float32Array
@external(javascript, "./savoiardi.ffi.mjs", "createFloat32Array")
pub fn create_float32_array(size: Int) -> Float32Array

/// Set buffer attribute directly
@external(javascript, "./savoiardi.ffi.mjs", "setBufferAttribute")
pub fn set_buffer_attribute(
  geometry: Geometry,
  name: String,
  array: Float32Array,
  item_size: Int,
) -> Nil

/// Get geometry from Points object
@external(javascript, "./savoiardi.ffi.mjs", "getGeometry")
pub fn get_geometry(points: Points) -> Geometry

/// Get attribute from geometry
@external(javascript, "./savoiardi.ffi.mjs", "getAttribute")
pub fn get_attribute(geometry: Geometry, name: String) -> BufferAttribute

/// Set XYZ values in buffer attribute at index
@external(javascript, "./savoiardi.ffi.mjs", "setBufferXYZ")
pub fn set_buffer_xyz(
  attribute: BufferAttribute,
  index: Int,
  x: Float,
  y: Float,
  z: Float,
) -> Nil

/// Set single value in buffer attribute at index
@external(javascript, "./savoiardi.ffi.mjs", "setBufferX")
pub fn set_buffer_x(attribute: BufferAttribute, index: Int, value: Float) -> Nil

/// Set attribute needs update
@external(javascript, "./savoiardi.ffi.mjs", "setAttributeNeedsUpdate")
pub fn set_attribute_needs_update(
  attribute: BufferAttribute,
  needs_update: Bool,
) -> Nil

// ============================================================================
// RENDERER PATCH APPLICATION
// ============================================================================

/// Apply transform with quaternion
@external(javascript, "./savoiardi.ffi.mjs", "applyTransformWithQuaternion")
pub fn apply_transform_with_quaternion(
  object: Object3D,
  position: a,
  quaternion: b,
  scale: c,
) -> Nil

/// Apply camera lookAt
@external(javascript, "./savoiardi.ffi.mjs", "applyCameraLookAt")
pub fn apply_camera_look_at(camera: Camera, target: a) -> Nil

/// Set shadow properties on an object
@external(javascript, "./savoiardi.ffi.mjs", "setShadowProperties")
pub fn set_shadow_properties(
  object: Object3D,
  cast_shadow: Bool,
  receive_shadow: Bool,
) -> Nil

// ============================================================================
// OBJECT3D UTILITIES
// ============================================================================

/// Check if object is an OrthographicCamera
@external(javascript, "./savoiardi.ffi.mjs", "isOrthographicCamera")
pub fn is_orthographic_camera(object: a) -> Bool

/// Check if object is an InstancedMesh
@external(javascript, "./savoiardi.ffi.mjs", "isInstancedMesh")
pub fn is_instanced_mesh(object: a) -> Bool

/// Check if object is an LOD
@external(javascript, "./savoiardi.ffi.mjs", "isLOD")
pub fn is_lod(object: a) -> Bool

/// Clear all LOD levels
@external(javascript, "./savoiardi.ffi.mjs", "clearLODLevels")
pub fn clear_lod_levels(lod: LOD) -> Nil

/// Update instanced mesh transforms
@external(javascript, "./savoiardi.ffi.mjs", "updateInstancedMeshTransforms")
pub fn update_instanced_mesh_transforms(
  mesh: InstancedMesh,
  instances: a,
) -> Nil

/// Update all instanced meshes in a group with transforms
@external(javascript, "./savoiardi.ffi.mjs", "updateGroupInstancedMeshes")
pub fn update_group_instanced_meshes(group: Object3D, instances: a) -> Nil

/// Update camera projection matrix
@external(javascript, "./savoiardi.ffi.mjs", "updateCameraProjectionMatrix")
pub fn update_camera_projection_matrix(camera: Camera) -> Nil

/// Set perspective camera parameters
@external(javascript, "./savoiardi.ffi.mjs", "setPerspectiveCameraParams")
pub fn set_perspective_camera_params(
  camera: Camera,
  fov: Float,
  aspect: Float,
  near: Float,
  far: Float,
) -> Nil

/// Set orthographic camera parameters
@external(javascript, "./savoiardi.ffi.mjs", "setOrthographicCameraParams")
pub fn set_orthographic_camera_params(
  camera: Camera,
  left: Float,
  right: Float,
  top: Float,
  bottom: Float,
  near: Float,
  far: Float,
) -> Nil

/// Get object geometry
@external(javascript, "./savoiardi.ffi.mjs", "getObjectGeometry")
pub fn get_object_geometry(object: Object3D) -> Geometry

/// Get object material
@external(javascript, "./savoiardi.ffi.mjs", "getObjectMaterial")
pub fn get_object_material(object: Object3D) -> Material

/// Set object geometry
@external(javascript, "./savoiardi.ffi.mjs", "setObjectGeometry")
pub fn set_object_geometry(object: Object3D, geometry: Geometry) -> Nil

/// Set object material
@external(javascript, "./savoiardi.ffi.mjs", "setObjectMaterial")
pub fn set_object_material(object: Object3D, material: Material) -> Nil

/// Get object position
@external(javascript, "./savoiardi.ffi.mjs", "getObjectPosition")
pub fn get_object_position(object: Object3D) -> Vec3

/// Get object rotation (Euler angles)
@external(javascript, "./savoiardi.ffi.mjs", "getObjectRotation")
pub fn get_object_rotation(object: Object3D) -> Vec3

/// Get object scale
@external(javascript, "./savoiardi.ffi.mjs", "getObjectScale")
pub fn get_object_scale(object: Object3D) -> Vec3

/// Get object quaternion
@external(javascript, "./savoiardi.ffi.mjs", "getObjectQuaternion")
pub fn get_object_quaternion(object: Object3D) -> #(Float, Float, Float, Float)

/// Set object quaternion
@external(javascript, "./savoiardi.ffi.mjs", "setObjectQuaternion")
pub fn set_object_quaternion(
  object: Object3D,
  x: Float,
  y: Float,
  z: Float,
  w: Float,
) -> Nil

/// Enable transparency on all materials in an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "enableTransparency")
pub fn enable_transparency(object: Object3D) -> Nil

/// Apply material to all meshes in an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "applyMaterialToObject")
pub fn apply_material_to_object(object: Object3D, material: Material) -> Nil

/// Apply texture to all materials in an Object3D
@external(javascript, "./savoiardi.ffi.mjs", "applyTextureToObject")
pub fn apply_texture_to_object(
  object: Object3D,
  texture: Texture,
  filter_mode: String,
) -> Nil

// ============================================================================
// RESOURCE DISPOSAL
// ============================================================================

/// Dispose of a texture
@external(javascript, "./savoiardi.ffi.mjs", "disposeTexture")
pub fn dispose_texture(texture: Texture) -> Nil

/// Dispose of a geometry
@external(javascript, "./savoiardi.ffi.mjs", "disposeGeometry")
pub fn dispose_geometry(geometry: Geometry) -> Nil

/// Dispose of a material
@external(javascript, "./savoiardi.ffi.mjs", "disposeMaterial")
pub fn dispose_material(material: Material) -> Nil

// ============================================================================
// DEBUG VISUALIZATION
// ============================================================================

/// Create debug wireframe box
@external(javascript, "./savoiardi.ffi.mjs", "createDebugBox")
pub fn create_debug_box(min: a, max: b, color: Int) -> Object3D

/// Create debug wireframe sphere
@external(javascript, "./savoiardi.ffi.mjs", "createDebugSphere")
pub fn create_debug_sphere(center: a, radius: Float, color: Int) -> Object3D

/// Create debug line
@external(javascript, "./savoiardi.ffi.mjs", "createDebugLine")
pub fn create_debug_line(from: a, to: b, color: Int) -> Object3D

/// Create debug axes
@external(javascript, "./savoiardi.ffi.mjs", "createDebugAxes")
pub fn create_debug_axes(origin: a, size: Float) -> Object3D

/// Create debug grid
@external(javascript, "./savoiardi.ffi.mjs", "createDebugGrid")
pub fn create_debug_grid(size: Float, divisions: Int, color: Int) -> Object3D

/// Create debug point marker
@external(javascript, "./savoiardi.ffi.mjs", "createDebugPoint")
pub fn create_debug_point(position: a, size: Float, color: Int) -> Object3D

// ============================================================================
// CSS2D RENDERER
// ============================================================================

/// Create CSS2DRenderer
@external(javascript, "./savoiardi.ffi.mjs", "createCSS2DRenderer")
pub fn create_css2d_renderer() -> CSS2DRenderer

/// Set CSS2DRenderer size
@external(javascript, "./savoiardi.ffi.mjs", "setCSS2DRendererSize")
pub fn set_css2d_renderer_size(
  renderer: CSS2DRenderer,
  width: Int,
  height: Int,
) -> Nil

/// Get CSS2DRenderer DOM element
@external(javascript, "./savoiardi.ffi.mjs", "getCSS2DRendererDomElement")
pub fn get_css2d_renderer_dom_element(renderer: CSS2DRenderer) -> a

/// Render CSS2D
@external(javascript, "./savoiardi.ffi.mjs", "renderCSS2D")
pub fn render_css2d(
  renderer: CSS2DRenderer,
  scene: Scene,
  camera: Camera,
) -> Nil

/// Create CSS2DObject from HTML string
@external(javascript, "./savoiardi.ffi.mjs", "createCSS2DObject")
pub fn create_css2d_object(html: String) -> CSS2DObject

/// Update CSS2DObject HTML content
@external(javascript, "./savoiardi.ffi.mjs", "updateCSS2DObjectHTML")
pub fn update_css2d_object_html(object: CSS2DObject, html: String) -> Nil

/// Create CSS3DObject from HTML string
@external(javascript, "./savoiardi.ffi.mjs", "createCSS3DObject")
pub fn create_css3d_object(html: String) -> CSS3DObject

/// Update CSS3DObject HTML content
@external(javascript, "./savoiardi.ffi.mjs", "updateCSS3DObjectHTML")
pub fn update_css3d_object_html(object: CSS3DObject, html: String) -> Nil

// ============================================================================
// CANVAS SPRITE LABELS (paint library integration)
// ============================================================================

/// Create canvas texture from encoded paint.Picture
@external(javascript, "./savoiardi.ffi.mjs", "createCanvasTextureFromPicture")
pub fn create_canvas_texture_from_picture(
  encoded_picture: String,
  width: Int,
  height: Int,
) -> Texture

/// Create a plane mesh with texture for canvas drawing
@external(javascript, "./savoiardi.ffi.mjs", "createCanvasPlane")
pub fn create_canvas_plane(
  texture: Texture,
  width: Float,
  height: Float,
) -> Object3D

/// Update canvas texture on object
@external(javascript, "./savoiardi.ffi.mjs", "updateCanvasTexture")
pub fn update_canvas_texture(object: Object3D, texture: Texture) -> Nil

/// Update canvas plane size
@external(javascript, "./savoiardi.ffi.mjs", "updateCanvasSize")
pub fn update_canvas_size(object: Object3D, width: Float, height: Float) -> Nil

/// Get cached encoded picture from canvas object
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasCachedPicture")
pub fn get_canvas_cached_picture(object: Object3D) -> String

/// Store encoded picture in canvas object for caching
@external(javascript, "./savoiardi.ffi.mjs", "setCanvasCachedPicture")
pub fn set_canvas_cached_picture(
  object: Object3D,
  encoded_picture: String,
) -> Nil

// ============================================================================
// UTILITY FUNCTIONS
// ============================================================================

/// Get renderer info
@external(javascript, "./savoiardi.ffi.mjs", "getRendererInfo")
pub fn get_renderer_info(renderer: Renderer) -> a

/// Check if WebGL context is valid
@external(javascript, "./savoiardi.ffi.mjs", "isContextValid")
pub fn is_context_valid(renderer: Renderer) -> Bool

// ============================================================================
// ASSET LOADING
// ============================================================================

/// Load a texture from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadTexture")
pub fn load_texture(url: String) -> Promise(Result(Texture, Nil))

/// Load an audio file from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadAudio")
pub fn load_audio(url: String) -> Promise(Result(AudioBuffer, Nil))

/// Load an STL model from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadSTL")
pub fn load_stl(url: String) -> Promise(Result(Geometry, Nil))

/// Load a GLTF/GLB model from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadGLTF")
pub fn load_gltf(url: String) -> Promise(Result(GLTFData, Nil))

/// Load an OBJ model from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadOBJ")
pub fn load_obj(url: String) -> Promise(Result(Object3D, Nil))

/// Load an FBX model from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadFBX")
pub fn load_fbx(url: String) -> Promise(Result(FBXData, Nil))

/// Load a font for text geometry
@external(javascript, "./savoiardi.ffi.mjs", "loadFont")
pub fn load_font(url: String) -> Promise(Result(Font, Nil))

/// Load an equirectangular (360°) texture from URL
@external(javascript, "./savoiardi.ffi.mjs", "loadEquirectangularTexture")
pub fn load_equirectangular_texture(
  url: String,
) -> Promise(Result(Texture, Nil))

/// Load a cube texture (skybox) from 6 URLs [px, nx, py, ny, pz, nz]
@external(javascript, "./savoiardi.ffi.mjs", "loadCubeTexture")
pub fn load_cube_texture(
  urls: List(String),
) -> Promise(Result(CubeTexture, Nil))

/// Cast a Light to Object3D for scene graph operations.
/// Safe because Light extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn light_to_object3d(light: Light) -> Object3D

/// Cast a Camera to Object3D for scene graph operations.
/// Safe because Camera extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn camera_to_object3d(camera: Camera) -> Object3D

/// Cast a Sprite to Object3D for scene graph operations.
/// Safe because Sprite extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn sprite_to_object3d(sprite: Sprite) -> Object3D

/// Cast Points to Object3D for scene graph operations.
/// Safe because Points extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn points_to_object3d(points: Points) -> Object3D

/// Cast LOD to Object3D for scene graph operations.
/// Safe because LOD extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn lod_to_object3d(lod: LOD) -> Object3D

/// Cast InstancedMesh to Object3D for scene graph operations.
/// Safe because InstancedMesh extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn instanced_mesh_to_object3d(mesh: InstancedMesh) -> Object3D

/// Cast Audio to Object3D for scene graph operations.
/// Safe because Audio extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn audio_to_object3d(audio: Audio) -> Object3D

/// Cast PositionalAudio to Object3D for scene graph operations.
/// Safe because PositionalAudio extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn positional_audio_to_object3d(audio: PositionalAudio) -> Object3D

/// Cast AudioListener to Object3D for scene graph operations.
/// Safe because AudioListener extends Object3D in Three.js.
@external(javascript, "../../gleam_stdlib/gleam/function.mjs", "identity")
pub fn audio_listener_to_object3d(listener: AudioListener) -> Object3D

// ============================================================================
// POSITIONAL AUDIO OPERATIONS
// ============================================================================

/// Set buffer on positional audio
@external(javascript, "./savoiardi.ffi.mjs", "setAudioBuffer")
pub fn set_positional_audio_buffer(
  audio: PositionalAudio,
  buffer: AudioBuffer,
) -> Nil

/// Set volume on positional audio
@external(javascript, "./savoiardi.ffi.mjs", "setAudioVolume")
pub fn set_positional_audio_volume(audio: PositionalAudio, volume: Float) -> Nil

/// Set loop on positional audio
@external(javascript, "./savoiardi.ffi.mjs", "setAudioLoop")
pub fn set_positional_audio_loop(audio: PositionalAudio, loop: Bool) -> Nil

/// Set playback rate on positional audio
@external(javascript, "./savoiardi.ffi.mjs", "setAudioPlaybackRate")
pub fn set_positional_audio_playback_rate(
  audio: PositionalAudio,
  rate: Float,
) -> Nil

/// Play positional audio
@external(javascript, "./savoiardi.ffi.mjs", "playAudio")
pub fn play_positional_audio(audio: PositionalAudio) -> Nil

/// Pause positional audio
@external(javascript, "./savoiardi.ffi.mjs", "pauseAudio")
pub fn pause_positional_audio(audio: PositionalAudio) -> Nil

/// Stop positional audio
@external(javascript, "./savoiardi.ffi.mjs", "stopAudio")
pub fn stop_positional_audio(audio: PositionalAudio) -> Nil

/// Check if positional audio is playing
@external(javascript, "./savoiardi.ffi.mjs", "isAudioPlaying")
pub fn is_positional_audio_playing(audio: PositionalAudio) -> Bool

/// Check if positional audio has a buffer
@external(javascript, "./savoiardi.ffi.mjs", "hasAudioBuffer")
pub fn has_positional_audio_buffer(audio: PositionalAudio) -> Bool

/// Get loop state of positional audio
@external(javascript, "./savoiardi.ffi.mjs", "getAudioLoop")
pub fn get_positional_audio_loop(audio: PositionalAudio) -> Bool

/// Play positional audio with fade in
pub fn play_positional_audio_with_fade_in(
  audio: PositionalAudio,
  fade_duration: Duration,
  target_volume: Float,
) -> Nil {
  let fade_ms = duration.to_seconds(fade_duration) *. 1000.0
  play_positional_audio_with_fade_in_ffi(audio, fade_ms, target_volume)
}

@external(javascript, "./savoiardi.ffi.mjs", "playAudioWithFadeIn")
fn play_positional_audio_with_fade_in_ffi(
  audio: PositionalAudio,
  fade_duration_ms: Float,
  target_volume: Float,
) -> Nil

/// Stop positional audio with fade out
pub fn stop_positional_audio_with_fade_out(
  audio: PositionalAudio,
  fade_duration: Duration,
  pause_instead_of_stop: Bool,
) -> Nil {
  let fade_ms = duration.to_seconds(fade_duration) *. 1000.0
  stop_positional_audio_with_fade_out_ffi(audio, fade_ms, pause_instead_of_stop)
}

@external(javascript, "./savoiardi.ffi.mjs", "stopAudioWithFadeOut")
fn stop_positional_audio_with_fade_out_ffi(
  audio: PositionalAudio,
  fade_duration_ms: Float,
  pause_instead_of_stop: Bool,
) -> Nil
