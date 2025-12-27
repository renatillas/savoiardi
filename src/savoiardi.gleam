//// <script>
//// const docs = [
////   {
////     header: "Scene",
////     functions: [
////       "create_scene",
////       "set_scene_background_color",
////       "set_scene_background_texture",
////       "set_scene_background_cube_texture",
////       "add_to_scene",
////       "remove_from_scene"
////     ]
////   },
////   {
////     header: "Renderer",
////     functions: [
////       "default_renderer_options",
////       "create_renderer",
////       "get_renderer_dom_element",
////       "set_renderer_size",
////       "set_renderer_pixel_ratio",
////       "render",
////       "clear_renderer",
////       "set_viewport",
////       "set_scissor",
////       "set_scissor_test",
////       "get_render_stats",
////       "get_canvas_dimensions",
////       "get_renderer_info",
////       "is_context_valid"
////     ]
////   },
////   {
////     header: "Camera",
////     functions: [
////       "create_perspective_camera",
////       "create_orthographic_camera",
////       "set_active_camera",
////       "get_active_camera",
////       "set_camera_aspect",
////       "set_camera_look_at",
////       "update_camera_projection_matrix",
////       "set_perspective_camera_params",
////       "set_orthographic_camera_params",
////       "is_perspective_camera",
////       "is_orthographic_camera",
////       "set_camera_user_data",
////       "get_camera_user_data",
////       "has_camera_user_data",
////       "delete_camera_user_data"
////     ]
////   },
////   {
////     header: "Object3D",
////     functions: [
////       "create_group",
////       "create_mesh",
////       "clone_object",
////       "add_child",
////       "remove_child",
////       "apply_transform",
////       "apply_transform_with_quaternion",
////       "update_matrix_world",
////       "update_matrix_world_force",
////       "dispose_object",
////       "set_object_position",
////       "set_object_rotation",
////       "set_object_scale",
////       "set_object_quaternion",
////       "get_object_position",
////       "get_object_rotation",
////       "get_object_scale",
////       "get_object_quaternion",
////       "get_world_position",
////       "get_world_quaternion",
////       "copy_position",
////       "copy_rotation",
////       "copy_scale",
////       "set_shadow_properties",
////       "get_object_geometry",
////       "get_object_material",
////       "set_object_geometry",
////       "set_object_material",
////       "enable_transparency",
////       "apply_material_to_object",
////       "apply_texture_to_object",
////       "extract_mesh_material_pairs"
////     ]
////   },
////   {
////     header: "Geometries",
////     functions: [
////       "create_box_geometry",
////       "create_sphere_geometry",
////       "create_cone_geometry",
////       "create_plane_geometry",
////       "create_circle_geometry",
////       "create_cylinder_geometry",
////       "create_torus_geometry",
////       "create_tetrahedron_geometry",
////       "create_icosahedron_geometry",
////       "create_text_geometry",
////       "create_buffer_geometry",
////       "dispose_geometry"
////     ]
////   },
////   {
////     header: "Materials",
////     functions: [
////       "create_basic_material",
////       "create_standard_material",
////       "create_phong_material",
////       "create_lambert_material",
////       "create_toon_material",
////       "create_line_material",
////       "create_sprite_material",
////       "create_points_material",
////       "dispose_material"
////     ]
////   },
////   {
////     header: "Lights",
////     functions: [
////       "create_ambient_light",
////       "create_directional_light",
////       "create_point_light",
////       "create_spot_light",
////       "create_hemisphere_light"
////     ]
////   },
////   {
////     header: "Textures",
////     functions: [
////       "load_texture",
////       "load_equirectangular_texture",
////       "load_cube_texture",
////       "clone_texture",
////       "set_texture_offset",
////       "set_texture_repeat",
////       "set_texture_wrap_mode",
////       "set_texture_filter_mode",
////       "get_repeat_wrapping",
////       "get_clamp_to_edge_wrapping",
////       "get_mirrored_repeat_wrapping",
////       "get_nearest_filter",
////       "get_linear_filter",
////       "dispose_texture"
////     ]
////   },
////   {
////     header: "Animation",
////     functions: [
////       "create_animation_mixer",
////       "clip_action",
////       "update_mixer",
////       "play_action",
////       "stop_action",
////       "set_action_loop",
////       "set_action_time_scale",
////       "set_action_weight",
////       "get_clip_name",
////       "get_clip_duration",
////       "get_loop_once",
////       "get_loop_repeat",
////       "get_loop_ping_pong"
////     ]
////   },
////   {
////     header: "Audio",
////     functions: [
////       "create_audio_listener",
////       "create_audio",
////       "create_positional_audio",
////       "load_audio",
////       "set_audio_buffer",
////       "play_audio",
////       "pause_audio",
////       "stop_audio",
////       "set_audio_volume",
////       "set_audio_loop",
////       "set_audio_playback_rate",
////       "is_audio_playing",
////       "has_audio_buffer",
////       "get_audio_loop",
////       "play_audio_with_fade_in",
////       "stop_audio_with_fade_out",
////       "get_audio_context_state",
////       "resume_audio_context"
////     ]
////   },
////   {
////     header: "Positional Audio",
////     functions: [
////       "set_positional_audio_buffer",
////       "set_positional_audio_volume",
////       "set_positional_audio_loop",
////       "set_positional_audio_playback_rate",
////       "play_positional_audio",
////       "pause_positional_audio",
////       "stop_positional_audio",
////       "is_positional_audio_playing",
////       "has_positional_audio_buffer",
////       "get_positional_audio_loop",
////       "play_positional_audio_with_fade_in",
////       "stop_positional_audio_with_fade_out",
////       "set_ref_distance",
////       "set_rolloff_factor",
////       "set_max_distance"
////     ]
////   },
////   {
////     header: "Asset Loading",
////     functions: [
////       "load_texture",
////       "load_audio",
////       "load_stl",
////       "load_gltf",
////       "load_obj",
////       "load_fbx",
////       "load_font",
////       "load_equirectangular_texture",
////       "load_cube_texture"
////     ]
////   },
////   {
////     header: "LOD & Instancing",
////     functions: [
////       "create_lod",
////       "add_lod_level",
////       "remove_lod_level",
////       "clear_lod_levels",
////       "is_lod",
////       "create_instanced_mesh",
////       "set_instance_matrix",
////       "update_instance_matrix",
////       "is_instanced_mesh",
////       "update_instanced_mesh_transforms",
////       "update_group_instanced_meshes"
////     ]
////   },
////   {
////     header: "Sprites & Particles",
////     functions: [
////       "create_sprite",
////       "create_points",
////       "create_line_segments",
////       "create_float32_array",
////       "set_buffer_attribute",
////       "get_geometry",
////       "get_attribute",
////       "set_buffer_xyz",
////       "set_buffer_x",
////       "set_attribute_needs_update",
////       "set_draw_range"
////     ]
////   },
////   {
////     header: "Buffer Geometry",
////     functions: [
////       "create_buffer_geometry",
////       "create_buffer_attribute",
////       "set_geometry_attribute",
////       "mark_attribute_needs_update"
////     ]
////   },
////   {
////     header: "Math Utilities",
////     functions: [
////       "create_matrix4",
////       "compose_matrix",
////       "create_color",
////       "lerp_color",
////       "get_color_r",
////       "get_color_g",
////       "get_color_b"
////     ]
////   },
////   {
////     header: "CSS Renderers",
////     functions: [
////       "create_css2d_renderer",
////       "set_css2d_renderer_size",
////       "get_css2d_renderer_dom_element",
////       "render_css2d",
////       "create_css2d_object",
////       "update_css2d_object_html",
////       "create_css3d_object",
////       "update_css3d_object_html"
////     ]
////   },
////   {
////     header: "Canvas Sprites",
////     functions: [
////       "create_canvas_texture_from_picture",
////       "create_canvas_plane",
////       "update_canvas_texture",
////       "update_canvas_size",
////       "get_canvas_cached_picture",
////       "set_canvas_cached_picture"
////     ]
////   },
////   {
////     header: "Debug Helpers",
////     functions: [
////       "create_axes_helper",
////       "create_grid_helper",
////       "create_box_helper",
////       "create_debug_box",
////       "create_debug_sphere",
////       "create_debug_line",
////       "create_debug_axes",
////       "create_debug_grid",
////       "create_debug_point"
////     ]
////   },
////   {
////     header: "Canvas",
////     functions: [
////       "set_canvas",
////       "get_canvas",
////       "get_canvas_client_width",
////       "get_canvas_client_height"
////     ]
////   },
////   {
////     header: "Constants",
////     functions: [
////       "get_additive_blending",
////       "get_normal_blending"
////     ]
////   }
//// ]
////
//// const callback = () => {
////   const list = document.querySelector(".sidebar > ul:last-of-type")
////   const sortedLists = document.createDocumentFragment()
////   const sortedMembers = document.createDocumentFragment()
////
////   for (const section of docs) {
////     sortedLists.append((() => {
////       const node = document.createElement("h3")
////       node.append(section.header)
////       return node
////     })())
////     sortedMembers.append((() => {
////       const node = document.createElement("h2")
////       node.append(section.header)
////       return node
////     })())
////
////     const sortedList = document.createElement("ul")
////     sortedLists.append(sortedList)
////
////
////     for (const funcName of section.functions) {
////       const href = `#${funcName}`
////       const member = document.querySelector(
////         `.member:has(h2 > a[href="${href}"])`
////       )
////       const sidebar = list.querySelector(`li:has(a[href="${href}"])`)
////       sortedList.append(sidebar)
////       sortedMembers.append(member)
////     }
////   }
////
////   document.querySelector(".sidebar").insertBefore(sortedLists, list)
////   document
////     .querySelector(".module-members:has(#module-values)")
////     .insertBefore(
////       sortedMembers,
////       document.querySelector("#module-values").nextSibling
////     )
//// }
////
//// document.readyState !== "loading"
////   ? callback()
////   : document.addEventListener(
////     "DOMContentLoaded",
////     callback,
////     { once: true }
////   )
//// </script>
////
//// # Savoiardi
////
//// Type-safe [Three.js](https://threejs.org/) bindings for Gleam, part of the
//// [tiramisu](https://github.com/renatillas/tiramisu) game engine ecosystem.
////
//// ## Overview
////
//// Savoiardi provides comprehensive bindings to Three.js, enabling you to build
//// 3D graphics applications in Gleam that run in the browser. It covers:
////
//// - **Scene management** - Create and manage 3D scenes with backgrounds
//// - **Cameras** - Perspective and orthographic cameras with full control
//// - **Geometries** - Box, sphere, plane, cylinder, torus, text, and more
//// - **Materials** - Basic, standard PBR, phong, lambert, toon materials
//// - **Lighting** - Ambient, directional, point, spot, and hemisphere lights
//// - **Textures** - Load and configure textures with filtering and wrapping
//// - **Animation** - Animation mixers and actions for skeletal/keyframe animation
//// - **Audio** - Global and positional 3D audio with fade effects
//// - **Asset loading** - GLTF, FBX, OBJ, STL models and fonts
//// - **LOD & Instancing** - Level of detail and instanced mesh rendering
//// - **Particle systems** - Points-based particle systems
//// - **CSS renderers** - CSS2D and CSS3D object overlays
////
//// ## Quick Start
////
//// ```gleam
//// import savoiardi
//// import gleam/option
////
//// pub fn main() {
////   // Create the renderer with default options (fullscreen, antialiased)
////   let renderer = savoiardi.create_renderer(savoiardi.default_renderer_options())
////
////   // Create a scene with a dark blue background
////   let scene = savoiardi.create_scene()
////     |> savoiardi.set_scene_background_color(0x1a1a2e)
////
////   // Create a perspective camera
////   let camera = savoiardi.create_perspective_camera(75.0, 16.0 /. 9.0, 0.1, 1000.0)
////
////   // Create a simple cube
////   let geometry = savoiardi.create_box_geometry(1.0, 1.0, 1.0)
////   let material = savoiardi.create_basic_material(0xff0000, False, 1.0, option.None)
////   let cube = savoiardi.create_mesh(geometry, material)
////
////   // Add the cube to the scene
////   savoiardi.add_to_scene(scene: scene, object: cube)
////
////   // Render the scene
////   savoiardi.render(renderer, scene, camera)
//// }
//// ```
////
//// ## Working with Transforms
////
//// Objects can be positioned, rotated, and scaled using Vec3 from the `vec` package:
////
//// ```gleam
//// import vec/vec3
////
//// // Position an object
//// savoiardi.set_object_position(cube, vec3.new(0.0, 1.0, -5.0))
////
//// // Rotate (Euler angles in radians)
//// savoiardi.set_object_rotation(cube, vec3.new(0.0, 3.14159, 0.0))
////
//// // Scale uniformly
//// savoiardi.set_object_scale(cube, vec3.new(2.0, 2.0, 2.0))
//// ```
////
//// ## Loading Assets
////
//// All asset loaders return `Promise(Result(asset, Nil))`:
////
//// ```gleam
//// import gleam/javascript/promise
////
//// // Load a GLTF model
//// savoiardi.load_gltf("/models/character.glb")
//// |> promise.map(fn(result) {
////   case result {
////     Ok(gltf_data) -> {
////       // Add model to scene
////       todo
////     }
////     Error(Nil) -> {
////       // Handle loading error
////       todo
////     }
////   }
//// })
//// ```
////
//// ## Animation
////
//// Create animation mixers for objects with animation clips:
////
//// ```gleam
//// let mixer = savoiardi.create_animation_mixer(model)
//// let action = savoiardi.clip_action(mixer, animation_clip)
//// savoiardi.play_action(action)
////
//// // In your render loop, update the mixer with delta time in milliseconds
//// savoiardi.update_mixer(mixer, delta_ms)
//// ```
////
//// ## Audio
////
//// Savoiardi supports both global and positional 3D audio:
////
//// ```gleam
//// // Create an audio listener (attach to camera)
//// let listener = savoiardi.create_audio_listener()
////
//// // Create positional audio for 3D sound
//// let sound = savoiardi.create_positional_audio(listener)
////
//// // Load and play audio
//// savoiardi.load_audio("/sounds/ambient.mp3")
//// |> promise.map(fn(result) {
////   case result {
////     Ok(buffer) -> {
////       savoiardi.set_positional_audio_buffer(sound, buffer)
////       savoiardi.set_positional_audio_loop(sound, True)
////       savoiardi.play_positional_audio(sound)
////     }
////     Error(Nil) -> Nil
////   }
//// })
//// ```
////
//// ## Related Packages
////
//// - [vec](https://hexdocs.pm/vec) - Vector mathematics (Vec2, Vec3, Vec4)
//// - [quaterni](https://hexdocs.pm/quaterni) - Quaternion mathematics for rotations
//// - [tiramisu](https://github.com/renatillas/tiramisu) - The full game engine

import gleam/javascript/array
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}
import gleam/time/duration.{type Duration}
import quaternion.{type Quaternion}
import vec/vec3.{type Vec3}

// ============================================================================
// CORE TYPES
// ============================================================================

/// Opaque type wrapping Three.js [Object3D](https://threejs.org/docs/#api/en/core/Object3D).
///
/// Object3D is the base class for most objects in Three.js. It provides properties
/// and methods for manipulating objects in 3D space including position, rotation,
/// scale, and parent/child relationships.
///
/// Common subclasses include Mesh, Group, Camera, Light, and more.
pub type Object3D

/// Opaque type wrapping Three.js [Scene](https://threejs.org/docs/#api/en/scenes/Scene).
///
/// Scenes allow you to set up what is to be rendered and where. This is where you
/// place objects, lights and cameras. The scene forms the root of the scene graph.
pub type Scene

/// Opaque type wrapping Three.js [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer).
///
/// The WebGL renderer displays your scenes using WebGL. It handles all the low-level
/// graphics operations and provides hardware-accelerated rendering.
pub type Renderer

/// Opaque type wrapping Three.js [Camera](https://threejs.org/docs/#api/en/cameras/Camera).
///
/// Abstract base class for cameras. This class should not be instantiated directly.
/// Use `create_perspective_camera` or `create_orthographic_camera` instead.
pub type Camera

/// Opaque type wrapping Three.js [BufferGeometry](https://threejs.org/docs/#api/en/core/BufferGeometry).
///
/// A representation of mesh, line, or point geometry using typed arrays.
/// BufferGeometry is more efficient than the deprecated Geometry class as it stores
/// all data in buffers that can be sent directly to the GPU.
pub type Geometry

/// Opaque type wrapping Three.js [Material](https://threejs.org/docs/#api/en/materials/Material).
///
/// Abstract base class for materials. Materials describe the appearance of objects
/// and how they interact with light. Use specific material constructors like
/// `create_basic_material` or `create_standard_material`.
pub type Material

/// Opaque type wrapping Three.js [Texture](https://threejs.org/docs/#api/en/textures/Texture).
///
/// Creates a texture to apply to a surface or as a reflection/refraction map.
/// Textures are loaded asynchronously via `load_texture`.
pub type Texture

/// Opaque type wrapping Three.js [CubeTexture](https://threejs.org/docs/#api/en/textures/CubeTexture).
///
/// Creates a cube texture made up of six images for skyboxes and environment maps.
/// Load with `load_cube_texture` providing 6 image URLs in order: +X, -X, +Y, -Y, +Z, -Z.
pub type CubeTexture

/// Opaque type wrapping Three.js [Light](https://threejs.org/docs/#api/en/lights/Light).
///
/// Abstract base class for lights. Use specific light constructors like
/// `create_ambient_light`, `create_directional_light`, `create_point_light`, etc.
pub type Light

/// Opaque type wrapping Three.js [AnimationClip](https://threejs.org/docs/#api/en/animation/AnimationClip).
///
/// An AnimationClip is a reusable set of keyframe tracks which represent an animation.
/// Clips are typically loaded from GLTF/FBX models and played via AnimationAction.
pub type AnimationClip

/// Opaque type wrapping Three.js [AnimationMixer](https://threejs.org/docs/#api/en/animation/AnimationMixer).
///
/// The AnimationMixer is a player for animations on a particular object in the scene.
/// When multiple objects are animated independently, one mixer per object is required.
/// Call `update_mixer` with delta time each frame to advance animations.
pub type AnimationMixer

/// Opaque type wrapping Three.js [AnimationAction](https://threejs.org/docs/#api/en/animation/AnimationAction).
///
/// AnimationActions schedule the performance of animations stored in AnimationClips.
/// Actions can be played, paused, stopped, looped, crossfaded, and blended.
pub type AnimationAction

/// Opaque type wrapping Three.js [Audio](https://threejs.org/docs/#api/en/audio/Audio).
///
/// Creates a non-positional (global) audio object. This audio is not affected by
/// the listener's position - it plays at constant volume regardless of distance.
/// Use for background music, UI sounds, etc.
pub type Audio

/// Opaque type wrapping Three.js [AudioListener](https://threejs.org/docs/#api/en/audio/AudioListener).
///
/// Represents a virtual listener for all positional and non-positional audio.
/// Typically attached to the camera. A single AudioListener is required for
/// the Web Audio API to process audio in the scene.
pub type AudioListener

/// Opaque type wrapping Three.js [PositionalAudio](https://threejs.org/docs/#api/en/audio/PositionalAudio).
///
/// Creates a positional audio object that uses the Web Audio API's PannerNode.
/// Audio volume and panning are affected by the listener's position and orientation
/// relative to the audio source. Use for 3D sound effects attached to objects.
pub type PositionalAudio

/// Opaque type wrapping Three.js [LOD](https://threejs.org/docs/#api/en/objects/LOD).
///
/// Level of Detail - shows meshes with varying levels of detail based on distance
/// from the camera. Useful for optimizing rendering of complex objects by showing
/// simpler meshes when far away.
pub type LOD

/// Opaque type wrapping Three.js [InstancedMesh](https://threejs.org/docs/#api/en/objects/InstancedMesh).
///
/// A special version of Mesh with instanced rendering support. Use InstancedMesh
/// to render a large number of objects with the same geometry and material but
/// different world transformations efficiently in a single draw call.
pub type InstancedMesh

/// Opaque type wrapping Three.js [Sprite](https://threejs.org/docs/#api/en/objects/Sprite).
///
/// A sprite is a plane that always faces towards the camera. Commonly used for
/// billboards, particles, and UI elements in 3D space.
pub type Sprite

/// Opaque type wrapping Three.js [Points](https://threejs.org/docs/#api/en/objects/Points).
///
/// A class for displaying particles. Points are rendered as a cloud of points
/// using WebGL's POINTS primitive. Used for particle systems, point clouds, etc.
pub type Points

/// Opaque type for the HTML [Canvas](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas) element.
///
/// The canvas element used by the WebGL renderer for drawing.
pub type Canvas

/// Opaque type for loaded GLTF data from [GLTFLoader](https://threejs.org/docs/#examples/en/loaders/GLTFLoader).
///
/// Contains the loaded scene, animations, cameras, and other assets from a GLTF/GLB file.
/// GLTF is the recommended format for 3D models in Three.js.
pub type GLTFData

/// Opaque type for loaded FBX data from [FBXLoader](https://threejs.org/docs/#examples/en/loaders/FBXLoader).
///
/// Contains the loaded scene and animations from an FBX file. FBX is commonly
/// exported from tools like Blender, Maya, and 3ds Max.
pub type FBXData

/// Opaque type wrapping [CSS2DRenderer](https://threejs.org/docs/#examples/en/renderers/CSS2DRenderer).
///
/// Renders DOM elements as 2D sprites that are positioned in 3D space but always
/// face the camera. Useful for labels, health bars, and UI elements.
pub type CSS2DRenderer

/// Opaque type wrapping [CSS2DObject](https://threejs.org/docs/#examples/en/renderers/CSS2DRenderer).
///
/// A DOM element that can be positioned in 3D space and rendered by CSS2DRenderer.
/// The element always faces the camera (billboard behavior).
pub type CSS2DObject

/// Opaque type wrapping [CSS3DObject](https://threejs.org/docs/#examples/en/renderers/CSS3DRenderer).
///
/// A DOM element that exists in full 3D space. Unlike CSS2DObject, CSS3DObject
/// can be rotated and transformed in 3D.
pub type CSS3DObject

/// Opaque type for fonts loaded via [FontLoader](https://threejs.org/docs/#examples/en/loaders/FontLoader).
///
/// Fonts are required for creating 3D text geometry with `create_text_geometry`.
/// Fonts must be in Three.js JSON font format (converted from TTF/OTF).
pub type Font

/// Opaque type wrapping the Web Audio API [AudioBuffer](https://developer.mozilla.org/en-US/docs/Web/API/AudioBuffer).
///
/// Represents audio data loaded into memory. Load audio files with `load_audio`
/// and assign to Audio or PositionalAudio objects with `set_audio_buffer`.
pub type AudioBuffer

/// Opaque type wrapping Three.js [BufferAttribute](https://threejs.org/docs/#api/en/core/BufferAttribute).
///
/// Stores data for an attribute (such as vertex positions, normals, colors, UVs)
/// in a typed array buffer. Used for custom geometry and particle systems.
pub type BufferAttribute

/// Opaque type wrapping Three.js [Matrix4](https://threejs.org/docs/#api/en/math/Matrix4).
///
/// A 4x4 matrix commonly used for 3D transformations (translation, rotation, scale).
/// Represented internally as a column-major 16-element array.
pub type Matrix4

/// Opaque type wrapping Three.js [Euler](https://threejs.org/docs/#api/en/math/Euler).
///
/// Represents rotation as Euler angles (rotation around X, Y, Z axes in order).
/// Default order is 'XYZ'. Be aware of gimbal lock issues with Euler angles.
pub type Euler

/// Opaque type wrapping Three.js [Color](https://threejs.org/docs/#api/en/math/Color).
///
/// Represents a color. Can be created from hex values with `create_color`.
/// Supports color operations like `lerp_color` for smooth transitions.
pub type Color

/// Opaque type wrapping JavaScript [Float32Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Float32Array).
///
/// A typed array of 32-bit floating point numbers. Used for buffer geometry
/// attributes like positions, normals, colors, and UVs.
pub type Float32Array

// ============================================================================
// CONFIGURATION TYPES
// ============================================================================

/// Canvas dimensions for the renderer.
///
/// Used with `RendererOptions` to specify a fixed canvas size instead of fullscreen.
pub type Dimensions {
  Dimensions(width: Float, height: Float)
}

/// Options for creating a [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer).
///
/// ## Fields
///
/// - `antialias` - Whether to perform antialiasing. Smooths jagged edges but has
///   a performance cost. Default: `True`
/// - `alpha` - Whether the canvas contains an alpha (transparency) buffer.
///   Set to `True` if you need the canvas background to be transparent. Default: `False`
/// - `dimensions` - Fixed canvas size, or `None` for fullscreen mode
///
/// ## Example
///
/// ```gleam
/// // Fixed size renderer
/// let options = RendererOptions(
///   antialias: True,
///   alpha: False,
///   dimensions: option.Some(Dimensions(800.0, 600.0)),
/// )
/// let renderer = create_renderer(options)
/// ```
pub type RendererOptions {
  RendererOptions(
    /// Enable antialiasing (smooths jagged edges, costs performance)
    antialias: Bool,
    /// Enable alpha channel (transparent canvas background)
    alpha: Bool,
    /// Canvas dimensions (None for fullscreen mode)
    dimensions: Option(Dimensions),
  )
}

/// Returns default renderer options: fullscreen, antialiased, opaque background.
///
/// Equivalent to `RendererOptions(antialias: True, alpha: False, dimensions: option.None)`.
///
/// See [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer)
/// for all available options in Three.js.
pub fn default_renderer_options() -> RendererOptions {
  RendererOptions(antialias: True, alpha: False, dimensions: option.None)
}

// ============================================================================
// SCENE
// ============================================================================

/// Creates a new Three.js [Scene](https://threejs.org/docs/#api/en/scenes/Scene).
///
/// The scene is the container for all objects, lights, and cameras. It forms
/// the root of the scene graph that gets rendered.
///
/// ## Example
///
/// ```gleam
/// let scene = create_scene()
///   |> set_scene_background_color(0x000000)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createScene")
pub fn create_scene() -> Scene

/// Sets the scene background to a solid color.
///
/// Wraps [Scene.background](https://threejs.org/docs/#api/en/scenes/Scene.background)
/// with a Three.js Color.
///
/// ## Parameters
///
/// - `scene` - The scene to modify
/// - `color` - Hex color value (e.g., `0x1a1a2e` for dark blue)
///
/// ## Example
///
/// ```gleam
/// let scene = create_scene()
///   |> set_scene_background_color(0x87ceeb)  // Sky blue
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundColor")
pub fn set_scene_background_color(scene: Scene, color: Int) -> Scene

/// Sets the scene background to a texture (e.g., an image).
///
/// Wraps [Scene.background](https://threejs.org/docs/#api/en/scenes/Scene.background).
/// The texture will be stretched to fill the entire background.
///
/// ## Parameters
///
/// - `scene` - The scene to modify
/// - `texture` - A texture loaded via `load_texture` or `load_equirectangular_texture`
///
/// ## Example
///
/// ```gleam
/// load_texture("/images/background.jpg")
/// |> promise.map(fn(result) {
///   case result {
///     Ok(texture) -> set_scene_background_texture(scene, texture)
///     Error(Nil) -> scene
///   }
/// })
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundTexture")
pub fn set_scene_background_texture(scene: Scene, texture: Texture) -> Scene

/// Sets the scene background to a cube texture (skybox).
///
/// Wraps [Scene.background](https://threejs.org/docs/#api/en/scenes/Scene.background)
/// with a CubeTexture. Creates an immersive 360° environment.
///
/// ## Parameters
///
/// - `scene` - The scene to modify
/// - `cube_texture` - A cube texture loaded via `load_cube_texture`
///
/// ## Example
///
/// ```gleam
/// let urls = [
///   "/skybox/px.jpg", "/skybox/nx.jpg",  // +X, -X
///   "/skybox/py.jpg", "/skybox/ny.jpg",  // +Y, -Y
///   "/skybox/pz.jpg", "/skybox/nz.jpg",  // +Z, -Z
/// ]
/// load_cube_texture(urls)
/// |> promise.map(fn(result) {
///   case result {
///     Ok(cube) -> set_scene_background_cube_texture(scene, cube)
///     Error(Nil) -> scene
///   }
/// })
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setSceneBackgroundCubeTexture")
pub fn set_scene_background_cube_texture(
  scene: Scene,
  cube_texture: CubeTexture,
) -> Scene

/// Adds an object to the scene.
///
/// Wraps [Object3D.add](https://threejs.org/docs/#api/en/core/Object3D.add).
/// The object becomes a child of the scene and will be rendered.
///
/// ## Parameters
///
/// - `scene` - The scene to add to
/// - `object` - Any Object3D (mesh, light, group, camera, etc.)
///
/// ## Example
///
/// ```gleam
/// let cube = create_mesh(geometry, material)
/// add_to_scene(scene: scene, object: cube)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "addToScene")
pub fn add_to_scene(scene scene: Scene, object object: Object3D) -> Nil

/// Removes an object from the scene.
///
/// Wraps [Object3D.remove](https://threejs.org/docs/#api/en/core/Object3D.remove).
/// The object is detached from the scene graph and will no longer be rendered.
///
/// **Note:** This does not dispose of the object's geometry or materials.
/// Call `dispose_object` if you want to free GPU memory.
///
/// ## Parameters
///
/// - `scene` - The scene to remove from
/// - `object` - The object to remove
@external(javascript, "./savoiardi.ffi.mjs", "removeFromScene")
pub fn remove_from_scene(scene scene: Scene, object object: Object3D) -> Nil

// ============================================================================
// RENDERER
// ============================================================================

/// Gets the current canvas dimensions from the renderer.
///
/// Returns a tuple of `#(width, height)` in pixels.
///
/// See [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer).
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasDimensions")
pub fn get_canvas_dimensions(renderer: Renderer) -> #(Float, Float)

/// Creates a new [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer).
///
/// The WebGL renderer uses WebGL to render your scene. It automatically creates
/// a canvas element and appends it to the document body (in fullscreen mode).
///
/// ## Parameters
///
/// - `options` - Renderer configuration (see `RendererOptions`)
///
/// ## Example
///
/// ```gleam
/// // Fullscreen with antialiasing
/// let renderer = create_renderer(default_renderer_options())
///
/// // Fixed size, transparent background
/// let renderer = create_renderer(RendererOptions(
///   antialias: True,
///   alpha: True,
///   dimensions: option.Some(Dimensions(1280.0, 720.0)),
/// ))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createRenderer")
pub fn create_renderer(options: RendererOptions) -> Renderer

/// Gets the canvas DOM element from the renderer.
///
/// Wraps [WebGLRenderer.domElement](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.domElement).
/// Useful for adding event listeners or appending to a specific container.
///
/// ## Example
///
/// ```gleam
/// let canvas = get_renderer_dom_element(renderer)
/// // Now you can use the canvas for input handling
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "getRendererDomElement")
pub fn get_renderer_dom_element(renderer: Renderer) -> Canvas

/// Sets the renderer output canvas size.
///
/// Wraps [WebGLRenderer.setSize](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setSize).
/// Call this when the window resizes to update the rendering resolution.
///
/// ## Parameters
///
/// - `renderer` - The renderer to resize
/// - `width` - New width in pixels
/// - `height` - New height in pixels
///
/// ## Example
///
/// ```gleam
/// // Handle window resize
/// set_renderer_size(renderer, window_width, window_height)
/// set_camera_aspect(camera, int.to_float(window_width) /. int.to_float(window_height))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setRendererSize")
pub fn set_renderer_size(renderer: Renderer, width: Int, height: Int) -> Nil

/// Sets the device pixel ratio for the renderer.
///
/// Wraps [WebGLRenderer.setPixelRatio](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setPixelRatio).
/// Higher values render at higher resolution for sharper images on HiDPI displays,
/// but cost more performance.
///
/// ## Parameters
///
/// - `renderer` - The renderer to configure
/// - `ratio` - Pixel ratio (typically `window.devicePixelRatio`, usually 1.0-3.0)
///
/// ## Example
///
/// ```gleam
/// // Match device pixel ratio for sharp rendering
/// set_renderer_pixel_ratio(renderer, 2.0)  // Retina display
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setRendererPixelRatio")
pub fn set_renderer_pixel_ratio(renderer: Renderer, ratio: Float) -> Nil

/// Renders the scene using the given camera.
///
/// Wraps [WebGLRenderer.render](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.render).
/// This is the main render call - invoke it each frame in your render loop.
///
/// ## Parameters
///
/// - `renderer` - The WebGL renderer
/// - `scene` - The scene containing objects to render
/// - `camera` - The camera defining the view
///
/// ## Example
///
/// ```gleam
/// // Basic render loop
/// fn render_loop() {
///   render(renderer, scene, camera)
///   request_animation_frame(render_loop)
/// }
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "render")
pub fn render(renderer: Renderer, scene: Scene, camera: Camera) -> Nil

/// Clears the renderer's color, depth, and stencil buffers.
///
/// Wraps [WebGLRenderer.clear](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.clear).
/// Useful when manually compositing multiple render passes.
@external(javascript, "./savoiardi.ffi.mjs", "clearRenderer")
pub fn clear_renderer(renderer: Renderer) -> Nil

/// Sets the viewport for rendering.
///
/// Wraps [WebGLRenderer.setViewport](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setViewport).
/// Defines the rectangular region of the canvas to render to. Useful for
/// split-screen, picture-in-picture, or multiple views.
///
/// ## Parameters
///
/// - `renderer` - The renderer
/// - `x` - Left edge in pixels
/// - `y` - Bottom edge in pixels (WebGL uses bottom-left origin)
/// - `width` - Viewport width in pixels
/// - `height` - Viewport height in pixels
///
/// ## Example
///
/// ```gleam
/// // Render to left half of screen
/// set_viewport(renderer, 0, 0, width / 2, height)
/// render(renderer, scene, left_camera)
///
/// // Render to right half
/// set_viewport(renderer, width / 2, 0, width / 2, height)
/// render(renderer, scene, right_camera)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setViewport")
pub fn set_viewport(
  renderer: Renderer,
  x: Int,
  y: Int,
  width: Int,
  height: Int,
) -> Nil

/// Sets the scissor region for rendering.
///
/// Wraps [WebGLRenderer.setScissor](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setScissor).
/// When scissor test is enabled, only pixels within this region are affected.
/// Use with `set_scissor_test(renderer, True)`.
///
/// ## Parameters
///
/// - `renderer` - The renderer
/// - `x` - Left edge in pixels
/// - `y` - Bottom edge in pixels
/// - `width` - Scissor region width
/// - `height` - Scissor region height
@external(javascript, "./savoiardi.ffi.mjs", "setScissor")
pub fn set_scissor(
  renderer: Renderer,
  x: Int,
  y: Int,
  width: Int,
  height: Int,
) -> Nil

/// Enables or disables the scissor test.
///
/// Wraps [WebGLRenderer.setScissorTest](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setScissorTest).
/// When enabled, only the scissor region defined by `set_scissor` is rendered.
///
/// ## Parameters
///
/// - `renderer` - The renderer
/// - `enabled` - `True` to enable scissor test, `False` to disable
@external(javascript, "./savoiardi.ffi.mjs", "setScissorTest")
pub fn set_scissor_test(renderer: Renderer, enabled: Bool) -> Nil

/// Gets render statistics from the last frame.
///
/// Accesses [WebGLRenderer.info](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.info).
/// Useful for performance monitoring and debugging.
///
/// ## Returns
///
/// A tuple of `#(draw_calls, triangles)`:
/// - `draw_calls` - Number of WebGL draw calls
/// - `triangles` - Number of triangles rendered
///
/// ## Example
///
/// ```gleam
/// let #(calls, tris) = get_render_stats(renderer)
/// io.println("Draw calls: " <> int.to_string(calls))
/// io.println("Triangles: " <> int.to_string(tris))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "getRenderStats")
pub fn get_render_stats(renderer: Renderer) -> #(Int, Int)

// ============================================================================
// CANVAS
// ============================================================================

/// Sets the global canvas reference for the library.
///
/// Some operations require access to the canvas element. This stores a
/// reference that can be retrieved with `get_canvas`.
@external(javascript, "./savoiardi.ffi.mjs", "setCanvas")
pub fn set_canvas(canvas: Canvas) -> Nil

/// Gets the global canvas reference.
///
/// Returns the canvas previously set with `set_canvas`.
@external(javascript, "./savoiardi.ffi.mjs", "getCanvas")
pub fn get_canvas() -> Canvas

/// Gets the canvas client width (CSS pixels).
///
/// Accesses [Element.clientWidth](https://developer.mozilla.org/en-US/docs/Web/API/Element/clientWidth).
/// This is the visible width of the canvas including padding but not borders.
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasClientWidth")
pub fn get_canvas_client_width(canvas: Canvas) -> Float

/// Gets the canvas client height (CSS pixels).
///
/// Accesses [Element.clientHeight](https://developer.mozilla.org/en-US/docs/Web/API/Element/clientHeight).
/// This is the visible height of the canvas including padding but not borders.
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasClientHeight")
pub fn get_canvas_client_height(canvas: Canvas) -> Float

// ============================================================================
// CAMERA
// ============================================================================

/// Sets the active camera for global access.
///
/// Stores a reference to the camera that can be retrieved with `get_active_camera`.
/// Useful for systems that need access to the current camera without passing it around.
@external(javascript, "./savoiardi.ffi.mjs", "setActiveCamera")
pub fn set_active_camera(camera: Camera) -> Nil

/// Gets the currently active camera.
///
/// Returns the camera previously set with `set_active_camera`.
@external(javascript, "./savoiardi.ffi.mjs", "getActiveCamera")
pub fn get_active_camera() -> Camera

/// Creates a [PerspectiveCamera](https://threejs.org/docs/#api/en/cameras/PerspectiveCamera).
///
/// The most common projection mode for 3D rendering. Mimics how the human eye sees,
/// with objects getting smaller as they move further away (perspective foreshortening).
///
/// ## Parameters
///
/// - `fov` - Field of view in degrees (vertical). Typical values: 45-75. Higher = wider view
/// - `aspect` - Aspect ratio (width / height). Should match canvas aspect ratio
/// - `near` - Near clipping plane. Objects closer than this won't render. Typical: 0.1
/// - `far` - Far clipping plane. Objects further than this won't render. Typical: 1000-10000
///
/// ## Important Notes
///
/// - Keep `near` as large as possible to avoid z-fighting (depth buffer precision issues)
/// - The ratio `far/near` should be as small as possible for best depth precision
/// - After changing `fov` or `aspect`, call `update_camera_projection_matrix`
///
/// ## Example
///
/// ```gleam
/// // Standard 16:9 camera
/// let camera = create_perspective_camera(75.0, 16.0 /. 9.0, 0.1, 1000.0)
/// set_object_position(camera, vec3.new(0.0, 5.0, 10.0))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createPerspectiveCamera")
pub fn create_perspective_camera(
  fov: Float,
  aspect: Float,
  near: Float,
  far: Float,
) -> Camera

/// Creates an [OrthographicCamera](https://threejs.org/docs/#api/en/cameras/OrthographicCamera).
///
/// In orthographic projection, object size stays constant regardless of distance.
/// Useful for 2D games, isometric views, UI elements, and CAD-style applications.
///
/// ## Parameters
///
/// - `left` - Left plane of the camera frustum
/// - `right` - Right plane of the camera frustum
/// - `top` - Top plane of the camera frustum
/// - `bottom` - Bottom plane of the camera frustum
/// - `near` - Near clipping plane
/// - `far` - Far clipping plane
///
/// ## Example
///
/// ```gleam
/// // Orthographic camera for 2D game (origin at center)
/// let half_width = 10.0
/// let half_height = 10.0 /. aspect
/// let camera = create_orthographic_camera(
///   -half_width, half_width,
///   half_height, -half_height,
///   0.1, 1000.0
/// )
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createOrthographicCamera")
pub fn create_orthographic_camera(
  left: Float,
  right: Float,
  top: Float,
  bottom: Float,
  near: Float,
  far: Float,
) -> Camera

/// Sets the aspect ratio of a perspective camera.
///
/// Wraps [PerspectiveCamera.aspect](https://threejs.org/docs/#api/en/cameras/PerspectiveCamera.aspect).
/// Call this when the canvas/window is resized, followed by `update_camera_projection_matrix`.
///
/// ## Parameters
///
/// - `camera` - The perspective camera to update
/// - `aspect` - New aspect ratio (width / height)
///
/// ## Example
///
/// ```gleam
/// // On window resize
/// let aspect = int.to_float(width) /. int.to_float(height)
/// set_camera_aspect(camera, aspect)
/// update_camera_projection_matrix(camera)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setCameraAspect")
pub fn set_camera_aspect(camera: Camera, aspect: Float) -> Nil

/// Checks if an object is a [PerspectiveCamera](https://threejs.org/docs/#api/en/cameras/PerspectiveCamera).
///
/// Uses Three.js's `isPerspectiveCamera` property for type checking.
///
/// ## Returns
///
/// `True` if the object is a PerspectiveCamera, `False` otherwise.
@external(javascript, "./savoiardi.ffi.mjs", "isPerspectiveCamera")
pub fn is_perspective_camera(object: a) -> Bool

/// Stores arbitrary user data on a camera.
///
/// Wraps [Object3D.userData](https://threejs.org/docs/#api/en/core/Object3D.userData).
/// Useful for attaching game-specific data to cameras.
///
/// ## Parameters
///
/// - `camera` - The camera to store data on
/// - `key` - String key for the data
/// - `value` - Any value to store
@external(javascript, "./savoiardi.ffi.mjs", "setCameraUserData")
pub fn set_camera_user_data(camera: Camera, key: String, value: a) -> Nil

/// Retrieves user data from a camera.
///
/// Wraps [Object3D.userData](https://threejs.org/docs/#api/en/core/Object3D.userData).
///
/// ## Parameters
///
/// - `camera` - The camera to get data from
/// - `key` - String key for the data
///
/// ## Returns
///
/// The stored value, or undefined if not set.
@external(javascript, "./savoiardi.ffi.mjs", "getCameraUserData")
pub fn get_camera_user_data(camera: Camera, key: String) -> a

/// Checks if a camera has user data for a specific key.
///
/// ## Parameters
///
/// - `camera` - The camera to check
/// - `key` - String key to look for
///
/// ## Returns
///
/// `True` if the key exists in userData, `False` otherwise.
@external(javascript, "./savoiardi.ffi.mjs", "hasCameraUserData")
pub fn has_camera_user_data(camera: Camera, key: String) -> Bool

/// Deletes user data from a camera.
///
/// ## Parameters
///
/// - `camera` - The camera to remove data from
/// - `key` - String key to delete
@external(javascript, "./savoiardi.ffi.mjs", "deleteCameraUserData")
pub fn delete_camera_user_data(camera: Camera, key: String) -> Nil

// ============================================================================
// OBJECT3D
// ============================================================================

/// Clones an [Object3D](https://threejs.org/docs/#api/en/core/Object3D.clone) and its descendants.
///
/// Creates a deep copy of the object including all children. Geometry and materials
/// are shared by reference (not cloned) for efficiency.
///
/// ## Returns
///
/// A new Object3D that is a copy of the original.
@external(javascript, "./savoiardi.ffi.mjs", "cloneObject3D")
pub fn clone_object(object: Object3D) -> Object3D

/// Creates an empty [Group](https://threejs.org/docs/#api/en/objects/Group) (Object3D container).
///
/// Groups are useful for organizing objects hierarchically. Transforming a group
/// affects all its children. Groups have no visual representation themselves.
///
/// ## Example
///
/// ```gleam
/// let car = create_group()
/// add_child(parent: car, child: body_mesh)
/// add_child(parent: car, child: wheel1)
/// add_child(parent: car, child: wheel2)
/// // Now moving the car moves all parts together
/// set_object_position(car, vec3.new(10.0, 0.0, 0.0))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createGroup")
pub fn create_group() -> Object3D

/// Creates a [Mesh](https://threejs.org/docs/#api/en/objects/Mesh) from geometry and material.
///
/// A mesh is a 3D object composed of triangular polygons. It combines geometry
/// (shape) with material (appearance) to create a renderable object.
///
/// ## Parameters
///
/// - `geometry` - The shape of the mesh (vertices, faces, UVs, normals)
/// - `material` - The surface appearance (color, texture, shading)
///
/// ## Example
///
/// ```gleam
/// let geometry = create_box_geometry(1.0, 1.0, 1.0)
/// let material = create_standard_material(0xff0000, 0.5, 0.5, ...)
/// let cube = create_mesh(geometry, material)
/// add_to_scene(scene: scene, object: cube)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createMesh")
pub fn create_mesh(geometry: Geometry, material: Material) -> Object3D

/// Adds a child to an [Object3D](https://threejs.org/docs/#api/en/core/Object3D.add).
///
/// The child's transform becomes relative to the parent. Moving the parent
/// moves all children with it.
///
/// ## Parameters
///
/// - `parent` - The parent object
/// - `child` - The object to add as a child
@external(javascript, "./savoiardi.ffi.mjs", "addChild")
pub fn add_child(parent parent: Object3D, child child: Object3D) -> Nil

/// Applies position, rotation, and scale to an object in one call.
///
/// More efficient than setting each property individually. Sets
/// [Object3D.position](https://threejs.org/docs/#api/en/core/Object3D.position),
/// [Object3D.rotation](https://threejs.org/docs/#api/en/core/Object3D.rotation), and
/// [Object3D.scale](https://threejs.org/docs/#api/en/core/Object3D.scale).
///
/// ## Parameters
///
/// - `object` - The object to transform
/// - `position` - Position in world units
/// - `rotation` - Euler rotation in radians (x, y, z)
/// - `scale` - Scale factors (1.0 = original size)
@external(javascript, "./savoiardi.ffi.mjs", "applyTransform")
pub fn apply_transform(
  object object: Object3D,
  position position: vec3.Vec3(Float),
  rotation rotation: vec3.Vec3(Float),
  scale scale: vec3.Vec3(Float),
) -> Nil

/// Updates the object's world matrix.
///
/// Wraps [Object3D.updateMatrixWorld](https://threejs.org/docs/#api/en/core/Object3D.updateMatrixWorld).
/// Computes the world matrix from local position/rotation/scale and parent transforms.
/// Usually called automatically during rendering, but needed for manual matrix access.
@external(javascript, "./savoiardi.ffi.mjs", "updateMatrixWorld")
pub fn update_matrix_world(object: Object3D) -> Nil

/// Updates the object's world matrix with optional force flag.
///
/// Wraps [Object3D.updateMatrixWorld](https://threejs.org/docs/#api/en/core/Object3D.updateMatrixWorld).
///
/// ## Parameters
///
/// - `object` - The object to update
/// - `force` - If `True`, forces update of all descendants even if not dirty
@external(javascript, "./savoiardi.ffi.mjs", "updateMatrixWorldForce")
pub fn update_matrix_world_force(object: Object3D, force: Bool) -> Nil

/// Disposes of an Object3D and its resources.
///
/// Frees GPU memory by disposing geometry and materials. Call this when
/// removing objects permanently to prevent memory leaks.
///
/// **Important:** After disposal, the object should not be used.
///
/// See [How to dispose of objects](https://threejs.org/docs/#manual/en/introduction/How-to-dispose-of-objects).
@external(javascript, "./savoiardi.ffi.mjs", "disposeObject3D")
pub fn dispose_object(object: Object3D) -> Nil

/// Extracts all geometries and materials from an Object3D hierarchy.
///
/// Traverses the object and its children, collecting all unique geometries
/// and materials found on meshes.
///
/// ## Returns
///
/// A tuple of `#(geometries, materials)` as JavaScript arrays.
@external(javascript, "./savoiardi.ffi.mjs", "extractMeshMaterialPairs")
pub fn extract_mesh_material_pairs(
  object: Object3D,
) -> #(array.Array(Geometry), array.Array(Material))

// ============================================================================
// LOD (Level of Detail)
// ============================================================================

/// Creates a [LOD](https://threejs.org/docs/#api/en/objects/LOD) (Level of Detail) object.
///
/// LOD shows different meshes based on distance from the camera. Use simpler
/// meshes for distant objects to improve performance.
///
/// ## Example
///
/// ```gleam
/// let lod = create_lod()
/// add_lod_level(lod: lod, object: high_detail_mesh, distance: 0.0)
/// add_lod_level(lod: lod, object: medium_detail_mesh, distance: 50.0)
/// add_lod_level(lod: lod, object: low_detail_mesh, distance: 100.0)
/// add_to_scene(scene: scene, object: lod)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createLOD")
pub fn create_lod() -> LOD

/// Adds a level to a [LOD](https://threejs.org/docs/#api/en/objects/LOD.addLevel) object.
///
/// Objects are shown when the camera is at or beyond the specified distance
/// (until the next level's distance is reached).
///
/// ## Parameters
///
/// - `lod` - The LOD object
/// - `object` - The mesh to show at this level
/// - `distance` - Distance threshold for this level (0.0 = closest/most detailed)
@external(javascript, "./savoiardi.ffi.mjs", "addLODLevel")
pub fn add_lod_level(
  lod lod: LOD,
  object object: Object3D,
  distance distance: Float,
) -> Nil

/// Removes a level from a LOD object by distance.
///
/// ## Parameters
///
/// - `lod` - The LOD object
/// - `distance` - The distance of the level to remove
@external(javascript, "./savoiardi.ffi.mjs", "removeLODLevel")
pub fn remove_lod_level(lod: LOD, distance: Float) -> Nil

// ============================================================================
// INSTANCED MESH
// ============================================================================

/// Creates an [InstancedMesh](https://threejs.org/docs/#api/en/objects/InstancedMesh).
///
/// Renders many copies of the same geometry/material with different transforms
/// in a single draw call. Extremely efficient for rendering large numbers of
/// similar objects (trees, particles, crowd, etc.).
///
/// ## Parameters
///
/// - `geometry` - Shared geometry for all instances
/// - `material` - Shared material for all instances
/// - `count` - Maximum number of instances
///
/// ## Example
///
/// ```gleam
/// // Render 1000 trees efficiently
/// let tree_geometry = create_cone_geometry(1.0, 3.0, 8)
/// let tree_material = create_basic_material(0x228b22, False, 1.0, option.None)
/// let trees = create_instanced_mesh(tree_geometry, tree_material, 1000)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createInstancedMesh")
pub fn create_instanced_mesh(
  geometry: Geometry,
  material: Material,
  count: Int,
) -> InstancedMesh

/// Sets the transform matrix for an instance.
///
/// Wraps [InstancedMesh.setMatrixAt](https://threejs.org/docs/#api/en/objects/InstancedMesh.setMatrixAt).
/// After setting matrices, call `update_instance_matrix` to apply changes.
///
/// ## Parameters
///
/// - `mesh` - The instanced mesh
/// - `index` - Instance index (0 to count-1)
/// - `matrix` - 4x4 transformation matrix
@external(javascript, "./savoiardi.ffi.mjs", "setInstanceMatrix")
pub fn set_instance_matrix(
  mesh: InstancedMesh,
  index: Int,
  matrix: Matrix4,
) -> Nil

/// Marks the instance matrix buffer for GPU upload.
///
/// Wraps [InstancedMesh.instanceMatrix.needsUpdate](https://threejs.org/docs/#api/en/objects/InstancedMesh).
/// Call this after modifying instance matrices with `set_instance_matrix`.
@external(javascript, "./savoiardi.ffi.mjs", "updateInstanceMatrix")
pub fn update_instance_matrix(mesh: InstancedMesh) -> Nil

// ============================================================================
// GEOMETRIES
// ============================================================================

/// Creates a [BoxGeometry](https://threejs.org/docs/#api/en/geometries/BoxGeometry) (rectangular cuboid).
///
/// The geometry is centered at the origin. The box has 6 faces with correct
/// normals and UVs for texturing.
///
/// ## Parameters
///
/// - `width` - Width (X axis)
/// - `height` - Height (Y axis)
/// - `depth` - Depth (Z axis)
///
/// ## Example
///
/// ```gleam
/// let cube = create_box_geometry(1.0, 1.0, 1.0)
/// let mesh = create_mesh(cube, material)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createBoxGeometry")
pub fn create_box_geometry(
  width: Float,
  height: Float,
  depth: Float,
) -> Geometry

/// Creates a [SphereGeometry](https://threejs.org/docs/#api/en/geometries/SphereGeometry).
///
/// The sphere is centered at the origin. Higher segment counts produce smoother spheres
/// but use more triangles.
///
/// ## Parameters
///
/// - `radius` - Sphere radius
/// - `width_segments` - Horizontal segments (longitude). Minimum 3, typical 32
/// - `height_segments` - Vertical segments (latitude). Minimum 2, typical 16
///
/// ## Example
///
/// ```gleam
/// // Smooth sphere
/// let sphere = create_sphere_geometry(1.0, 32, 16)
///
/// // Low-poly sphere
/// let low_poly = create_sphere_geometry(1.0, 8, 6)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createSphereGeometry")
pub fn create_sphere_geometry(
  radius: Float,
  width_segments: Int,
  height_segments: Int,
) -> Geometry

/// Creates a [ConeGeometry](https://threejs.org/docs/#api/en/geometries/ConeGeometry).
///
/// The cone points up along the Y axis with its base centered at the origin.
///
/// ## Parameters
///
/// - `radius` - Base radius
/// - `height` - Cone height
/// - `segments` - Number of radial segments. Higher = smoother circular base
@external(javascript, "./savoiardi.ffi.mjs", "createConeGeometry")
pub fn create_cone_geometry(
  radius: Float,
  height: Float,
  segments: Int,
) -> Geometry

/// Creates a [PlaneGeometry](https://threejs.org/docs/#api/en/geometries/PlaneGeometry).
///
/// A flat rectangular surface in the XY plane, facing the +Z direction.
/// Commonly used for floors, walls, billboards, and UI elements.
///
/// ## Parameters
///
/// - `width` - Width (X axis)
/// - `height` - Height (Y axis)
/// - `width_segments` - Subdivisions along width (1 = single quad)
/// - `height_segments` - Subdivisions along height (1 = single quad)
///
/// ## Example
///
/// ```gleam
/// // Simple floor (rotate to lie flat)
/// let floor = create_plane_geometry(100.0, 100.0, 1, 1)
/// set_object_rotation(floor_mesh, vec3.new(-3.14159 /. 2.0, 0.0, 0.0))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createPlaneGeometry")
pub fn create_plane_geometry(
  width: Float,
  height: Float,
  width_segments: Int,
  height_segments: Int,
) -> Geometry

/// Creates a [CircleGeometry](https://threejs.org/docs/#api/en/geometries/CircleGeometry).
///
/// A flat circular disc in the XY plane, facing the +Z direction.
///
/// ## Parameters
///
/// - `radius` - Circle radius
/// - `segments` - Number of segments. Higher = smoother circle (minimum 3)
@external(javascript, "./savoiardi.ffi.mjs", "createCircleGeometry")
pub fn create_circle_geometry(radius: Float, segments: Int) -> Geometry

/// Creates a [CylinderGeometry](https://threejs.org/docs/#api/en/geometries/CylinderGeometry).
///
/// A cylinder along the Y axis, centered at the origin. Can also create cones
/// by setting one radius to 0.
///
/// ## Parameters
///
/// - `radius_top` - Top cap radius (0 for a cone)
/// - `radius_bottom` - Bottom cap radius
/// - `height` - Cylinder height
/// - `radial_segments` - Number of faces around the circumference
///
/// ## Example
///
/// ```gleam
/// // Regular cylinder
/// let cylinder = create_cylinder_geometry(1.0, 1.0, 2.0, 32)
///
/// // Tapered cylinder (cone-like)
/// let tapered = create_cylinder_geometry(0.5, 1.0, 2.0, 32)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createCylinderGeometry")
pub fn create_cylinder_geometry(
  radius_top: Float,
  radius_bottom: Float,
  height: Float,
  radial_segments: Int,
) -> Geometry

/// Creates a [TorusGeometry](https://threejs.org/docs/#api/en/geometries/TorusGeometry) (donut shape).
///
/// A torus centered at the origin, lying in the XY plane.
///
/// ## Parameters
///
/// - `radius` - Distance from center to the middle of the tube
/// - `tube` - Radius of the tube (thickness)
/// - `radial_segments` - Segments around the tube cross-section
/// - `tubular_segments` - Segments around the torus circumference
@external(javascript, "./savoiardi.ffi.mjs", "createTorusGeometry")
pub fn create_torus_geometry(
  radius: Float,
  tube: Float,
  radial_segments: Int,
  tubular_segments: Int,
) -> Geometry

/// Creates a [TetrahedronGeometry](https://threejs.org/docs/#api/en/geometries/TetrahedronGeometry) (4-faced polyhedron).
///
/// A tetrahedron (triangular pyramid) centered at the origin.
///
/// ## Parameters
///
/// - `radius` - Radius of the circumscribed sphere
/// - `detail` - Subdivision level (0 = base shape, higher = more triangles)
@external(javascript, "./savoiardi.ffi.mjs", "createTetrahedronGeometry")
pub fn create_tetrahedron_geometry(radius: Float, detail: Int) -> Geometry

/// Creates an [IcosahedronGeometry](https://threejs.org/docs/#api/en/geometries/IcosahedronGeometry) (20-faced polyhedron).
///
/// An icosahedron centered at the origin. With detail > 0, becomes a good
/// approximation of a sphere with evenly distributed vertices.
///
/// ## Parameters
///
/// - `radius` - Radius of the circumscribed sphere
/// - `detail` - Subdivision level (0 = 20 faces, 1 = 80 faces, etc.)
@external(javascript, "./savoiardi.ffi.mjs", "createIcosahedronGeometry")
pub fn create_icosahedron_geometry(radius: Float, detail: Int) -> Geometry

/// Creates a [TextGeometry](https://threejs.org/docs/#examples/en/geometries/TextGeometry) for 3D text.
///
/// Generates extruded 3D text from a string. Requires a font loaded via `load_font`.
///
/// ## Parameters
///
/// - `text` - The text string to render
/// - `font` - A Font loaded via `load_font`
/// - `size` - Font size
/// - `depth` - Extrusion depth (thickness)
/// - `curve_segments` - Curve smoothness for rounded letters
/// - `bevel_enabled` - Whether to add beveled edges
/// - `bevel_thickness` - Bevel depth
/// - `bevel_size` - Bevel extent from text outline
/// - `bevel_offset` - Bevel start offset
/// - `bevel_segments` - Bevel smoothness
///
/// ## Example
///
/// ```gleam
/// load_font("/fonts/helvetiker.json")
/// |> promise.map(fn(result) {
///   case result {
///     Ok(font) -> {
///       let text_geo = create_text_geometry(
///         "Hello", font, 1.0, 0.2, 12,
///         True, 0.03, 0.02, 0.0, 3
///       )
///       create_mesh(text_geo, material)
///     }
///     Error(Nil) -> panic
///   }
/// })
/// ```
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

/// Creates a [MeshBasicMaterial](https://threejs.org/docs/#api/en/materials/MeshBasicMaterial).
///
/// A simple material that is not affected by lights. Displays a flat color
/// or texture. Useful for unlit objects, wireframes, and debugging.
///
/// ## Parameters
///
/// - `color` - Base color as hex (e.g., `0xff0000` for red)
/// - `transparent` - Enable transparency (required for opacity < 1.0)
/// - `opacity` - Opacity from 0.0 (invisible) to 1.0 (opaque)
/// - `map` - Optional color texture
///
/// ## Example
///
/// ```gleam
/// // Solid red material
/// let red = create_basic_material(0xff0000, False, 1.0, option.None)
///
/// // Textured with transparency
/// let textured = create_basic_material(0xffffff, True, 0.8, option.Some(texture))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createBasicMaterial")
pub fn create_basic_material(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
) -> Material

/// Creates a [MeshStandardMaterial](https://threejs.org/docs/#api/en/materials/MeshStandardMaterial).
///
/// A physically-based rendering (PBR) material using the metallic-roughness workflow.
/// This is the recommended material for realistic rendering with proper lighting.
///
/// ## Parameters
///
/// - `color` - Base color (albedo) as hex
/// - `metalness` - How metallic the surface is (0.0 = dielectric, 1.0 = metal)
/// - `roughness` - How rough the surface is (0.0 = mirror, 1.0 = diffuse)
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `map` - Color/albedo texture
/// - `normal_map` - Normal map for surface detail
/// - `ao_map` - Ambient occlusion map
/// - `displacement_map` - Displacement map for vertex displacement
/// - `displacement_scale` - Displacement strength
/// - `displacement_bias` - Displacement offset
/// - `roughness_map` - Per-pixel roughness
/// - `metalness_map` - Per-pixel metalness
/// - `emissive` - Emissive (glow) color
/// - `emissive_intensity` - Emissive strength
///
/// ## Example
///
/// ```gleam
/// // Shiny metal
/// let metal = create_standard_material(
///   0xcccccc, 1.0, 0.2,  // Silver, full metal, slightly rough
///   False, 1.0,          // Opaque
///   option.None, option.None, option.None,  // No textures
///   option.None, 0.0, 0.0,  // No displacement
///   option.None, option.None,  // No maps
///   0x000000, 0.0         // No emission
/// )
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createStandardMaterial")
pub fn create_standard_material(
  color: Int,
  metalness: Float,
  roughness: Float,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  normal_map: Option(Texture),
  ao_map: Option(Texture),
  displacement_map: Option(Texture),
  displacement_scale: Float,
  displacement_bias: Float,
  roughness_map: Option(Texture),
  metalness_map: Option(Texture),
  emissive: Int,
  emissive_intensity: Float,
) -> Material

/// Creates a [MeshPhongMaterial](https://threejs.org/docs/#api/en/materials/MeshPhongMaterial).
///
/// A material for shiny surfaces with specular highlights. Less realistic than
/// StandardMaterial but faster to render. Good for stylized graphics.
///
/// ## Parameters
///
/// - `color` - Base color as hex
/// - `shininess` - Specular highlight size (higher = smaller, sharper highlights)
/// - `map` - Color texture
/// - `normal_map` - Normal map
/// - `ao_map` - Ambient occlusion map
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `alpha_test` - Alpha cutoff threshold (pixels below this are discarded)
@external(javascript, "./savoiardi.ffi.mjs", "createPhongMaterial")
pub fn create_phong_material(
  color: Int,
  shininess: Float,
  map: Option(Texture),
  normal_map: Option(Texture),
  ao_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Creates a [MeshLambertMaterial](https://threejs.org/docs/#api/en/materials/MeshLambertMaterial).
///
/// A material for non-shiny surfaces (matte). Cheaper than Phong/Standard.
/// Uses Lambertian reflectance (diffuse only, no specular).
///
/// ## Parameters
///
/// - `color` - Base color as hex
/// - `map` - Color texture
/// - `normal_map` - Normal map
/// - `ao_map` - Ambient occlusion map
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `alpha_test` - Alpha cutoff threshold
@external(javascript, "./savoiardi.ffi.mjs", "createLambertMaterial")
pub fn create_lambert_material(
  color: Int,
  map: Option(Texture),
  normal_map: Option(Texture),
  ao_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Creates a [MeshToonMaterial](https://threejs.org/docs/#api/en/materials/MeshToonMaterial).
///
/// A cel-shaded (cartoon) material with hard lighting transitions.
/// Great for stylized, anime-like graphics.
///
/// ## Parameters
///
/// - `color` - Base color as hex
/// - `map` - Color texture
/// - `normal_map` - Normal map
/// - `ao_map` - Ambient occlusion map
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `alpha_test` - Alpha cutoff threshold
@external(javascript, "./savoiardi.ffi.mjs", "createToonMaterial")
pub fn create_toon_material(
  color: Int,
  map: Option(Texture),
  normal_map: Option(Texture),
  ao_map: Option(Texture),
  transparent: Bool,
  opacity: Float,
  alpha_test: Float,
) -> Material

/// Creates a [LineBasicMaterial](https://threejs.org/docs/#api/en/materials/LineBasicMaterial).
///
/// Material for Line and LineSegments objects.
///
/// ## Parameters
///
/// - `color` - Line color as hex
/// - `linewidth` - Line width in pixels (note: line width > 1 not supported on all platforms)
@external(javascript, "./savoiardi.ffi.mjs", "createLineMaterial")
pub fn create_line_material(color: Int, linewidth: Float) -> Material

/// Creates a [SpriteMaterial](https://threejs.org/docs/#api/en/materials/SpriteMaterial).
///
/// Material for Sprite objects (always camera-facing planes).
///
/// ## Parameters
///
/// - `color` - Tint color as hex
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `map` - Sprite texture
@external(javascript, "./savoiardi.ffi.mjs", "createSpriteMaterial")
pub fn create_sprite_material(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
) -> Material

/// Creates a [PointsMaterial](https://threejs.org/docs/#api/en/materials/PointsMaterial).
///
/// Material for Points (particle) objects. Each vertex is rendered as a point/sprite.
///
/// ## Parameters
///
/// - `size` - Point size in world units (or pixels if size_attenuation is False)
/// - `vertex_colors` - Use per-vertex colors from geometry
/// - `transparent` - Enable transparency
/// - `opacity` - Opacity value
/// - `depth_write` - Write to depth buffer (False for additive particles)
/// - `blending` - Blending mode (use `get_additive_blending` or `get_normal_blending`)
/// - `size_attenuation` - If True, points get smaller with distance
///
/// ## Example
///
/// ```gleam
/// // Additive particle material
/// let particles = create_points_material(
///   0.1, False, True, 0.8,
///   False, get_additive_blending(), True
/// )
/// ```
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

/// Creates an [AmbientLight](https://threejs.org/docs/#api/en/lights/AmbientLight).
///
/// Illuminates all objects equally from all directions. Provides baseline
/// illumination so shadows aren't completely black. Does not cast shadows.
///
/// ## Parameters
///
/// - `color` - Light color as hex
/// - `intensity` - Light strength (typically 0.1-1.0)
///
/// ## Example
///
/// ```gleam
/// // Soft ambient light
/// let ambient = create_ambient_light(0x404040, 0.5)
/// add_to_scene(scene: scene, object: ambient)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createAmbientLight")
pub fn create_ambient_light(color: Int, intensity: Float) -> Light

/// Creates a [DirectionalLight](https://threejs.org/docs/#api/en/lights/DirectionalLight).
///
/// A light that shines in a specific direction, as if from infinitely far away
/// (like the sun). All rays are parallel. Can cast shadows.
///
/// ## Parameters
///
/// - `color` - Light color as hex
/// - `intensity` - Light strength
/// - `cast_shadow` - Enable shadow casting
/// - `shadow_resolution` - Shadow map size (e.g., 1024, 2048). Higher = sharper shadows
/// - `shadow_bias` - Bias to prevent shadow acne. Typical: -0.0001 to -0.001
///
/// ## Example
///
/// ```gleam
/// let sun = create_directional_light(0xffffff, 1.0, True, 2048, -0.0001)
/// set_object_position(sun, vec3.new(10.0, 20.0, 10.0))
/// add_to_scene(scene: scene, object: sun)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createDirectionalLight")
pub fn create_directional_light(
  color: Int,
  intensity: Float,
  cast_shadow: Bool,
  shadow_resolution: Int,
  shadow_bias: Float,
) -> Light

/// Creates a [PointLight](https://threejs.org/docs/#api/en/lights/PointLight).
///
/// A light that emits in all directions from a single point (like a light bulb).
/// Intensity falls off with distance. Can cast shadows (expensive).
///
/// ## Parameters
///
/// - `color` - Light color as hex
/// - `intensity` - Light strength
/// - `distance` - Maximum range (0 = no limit, light decays naturally)
/// - `cast_shadow` - Enable shadow casting (uses cube shadow map, expensive)
/// - `shadow_resolution` - Shadow map size
/// - `shadow_bias` - Bias to prevent shadow acne
@external(javascript, "./savoiardi.ffi.mjs", "createPointLight")
pub fn create_point_light(
  color: Int,
  intensity: Float,
  distance: Float,
  cast_shadow: Bool,
  shadow_resolution: Int,
  shadow_bias: Float,
) -> Light

/// Creates a [SpotLight](https://threejs.org/docs/#api/en/lights/SpotLight).
///
/// A light that emits in a cone from a single point (like a flashlight or stage light).
/// Can cast shadows with a single shadow map.
///
/// ## Parameters
///
/// - `color` - Light color as hex
/// - `intensity` - Light strength
/// - `distance` - Maximum range (0 = no limit)
/// - `angle` - Maximum cone angle in radians (max: π/2)
/// - `penumbra` - Soft edge percentage (0 = hard edge, 1 = fully soft)
/// - `cast_shadow` - Enable shadow casting
/// - `shadow_resolution` - Shadow map size
/// - `shadow_bias` - Bias to prevent shadow acne
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

/// Creates a [HemisphereLight](https://threejs.org/docs/#api/en/lights/HemisphereLight).
///
/// A light positioned above the scene that fades from sky color (above) to ground
/// color (below). Provides natural-looking ambient lighting for outdoor scenes.
/// Does not cast shadows.
///
/// ## Parameters
///
/// - `sky_color` - Color from above as hex
/// - `ground_color` - Color from below as hex
/// - `intensity` - Light strength
///
/// ## Example
///
/// ```gleam
/// // Blue sky, brown ground
/// let hemi = create_hemisphere_light(0x87ceeb, 0x8b4513, 0.6)
/// add_to_scene(scene: scene, object: hemi)
/// ```
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

// ============================================================================
// SCENE GRAPH MANIPULATION
// ============================================================================

/// Remove child from parent
@external(javascript, "./savoiardi.ffi.mjs", "removeChild")
pub fn remove_child(parent: Object3D, child: Object3D) -> Nil

/// Set object position
@external(javascript, "./savoiardi.ffi.mjs", "setPosition")
pub fn set_object_position(object: Object3D, position: Vec3(Float)) -> Nil

/// Set object rotation (Euler angles)
@external(javascript, "./savoiardi.ffi.mjs", "setRotation")
pub fn set_object_rotation(object: Object3D, rotation: Vec3(Float)) -> Nil

/// Set object scale
@external(javascript, "./savoiardi.ffi.mjs", "setScale")
pub fn set_object_scale(object: Object3D, scale: Vec3(Float)) -> Nil

/// Get world position from object
@external(javascript, "./savoiardi.ffi.mjs", "getWorldPosition")
pub fn get_world_position(object: Object3D) -> Vec3(Float)

/// Get world quaternion from object
@external(javascript, "./savoiardi.ffi.mjs", "getWorldQuaternion")
pub fn get_world_quaternion(object: Object3D) -> Quaternion

/// Copy position from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyPosition")
pub fn copy_position(object: Object3D, source: Object3D) -> Nil

/// Copy rotation from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyRotation")
pub fn copy_rotation(object: Object3D, source: Object3D) -> Nil

/// Copy scale from another object
@external(javascript, "./savoiardi.ffi.mjs", "copyScale")
pub fn copy_scale(object: Object3D, source: Object3D) -> Nil

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

/// Create buffer attribute from Float32Array
@external(javascript, "./savoiardi.ffi.mjs", "createBufferAttribute")
pub fn create_buffer_attribute(
  array: Float32Array,
  item_size: Int,
) -> BufferAttribute

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

/// Create Matrix4
@external(javascript, "./savoiardi.ffi.mjs", "createMatrix4")
pub fn create_matrix4() -> Matrix4

/// Compose matrix from position, quaternion, scale
@external(javascript, "./savoiardi.ffi.mjs", "composeMatrix")
pub fn compose_matrix(
  matrix: Matrix4,
  position: vec3.Vec3(Float),
  quaternion: Quaternion,
  scale: vec3.Vec3(Float),
) -> Nil

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
  value: Vec3(Float),
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
  object object: Object3D,
  position position: Vec3(Float),
  quaternion quaternion: Quaternion,
  scale scale: Vec3(Float),
) -> Nil

/// Set camera to look at a target position
@external(javascript, "./savoiardi.ffi.mjs", "applyCameraLookAt")
pub fn set_camera_look_at(
  camera camera: Camera,
  target target: Vec3(Float),
) -> Nil

/// Set shadow properties on an object
@external(javascript, "./savoiardi.ffi.mjs", "setShadowProperties")
pub fn set_shadow_properties(
  object object: Object3D,
  cast_shadow cast_shadow: Bool,
  receive_shadow receive_shadow: Bool,
) -> Nil

// ============================================================================
// OBJECT3D UTILITIES
// ============================================================================

/// Check if object is an OrthographicCamera
@external(javascript, "./savoiardi.ffi.mjs", "isOrthographicCamera")
pub fn is_orthographic_camera(object: Object3D) -> Bool

/// Check if object is an InstancedMesh
@external(javascript, "./savoiardi.ffi.mjs", "isInstancedMesh")
pub fn is_instanced_mesh(object: Object3D) -> Bool

/// Check if object is an LOD
@external(javascript, "./savoiardi.ffi.mjs", "isLOD")
pub fn is_lod(object: Object3D) -> Bool

/// Clear all LOD levels
@external(javascript, "./savoiardi.ffi.mjs", "clearLODLevels")
pub fn clear_lod_levels(lod: LOD) -> Nil

/// Update instanced mesh transforms
/// Each instance is a tuple of (position, rotation, scale) as Vec3s
@external(javascript, "./savoiardi.ffi.mjs", "updateInstancedMeshTransforms")
pub fn update_instanced_mesh_transforms(
  mesh: InstancedMesh,
  instances: List(#(Vec3(Float), Vec3(Float), Vec3(Float))),
) -> Nil

/// Update all instanced meshes in a group with transforms
/// Each instance is a tuple of (position, rotation, scale) as Vec3s
@external(javascript, "./savoiardi.ffi.mjs", "updateGroupInstancedMeshes")
pub fn update_group_instanced_meshes(
  group: Object3D,
  instances: List(#(Vec3(Float), Vec3(Float), Vec3(Float))),
) -> Nil

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
pub fn get_object_position(object: Object3D) -> Vec3(Float)

/// Get object rotation (Euler angles)
@external(javascript, "./savoiardi.ffi.mjs", "getObjectRotation")
pub fn get_object_rotation(object: Object3D) -> Vec3(Float)

/// Get object scale
@external(javascript, "./savoiardi.ffi.mjs", "getObjectScale")
pub fn get_object_scale(object: Object3D) -> Vec3(Float)

/// Get object quaternion
@external(javascript, "./savoiardi.ffi.mjs", "getObjectQuaternion")
pub fn get_object_quaternion(object: Object3D) -> Quaternion

/// Set object quaternion
@external(javascript, "./savoiardi.ffi.mjs", "setObjectQuaternion")
pub fn set_object_quaternion(object: Object3D, quaternion: Quaternion) -> Nil

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
pub fn create_debug_box(
  min: Vec3(Float),
  max: Vec3(Float),
  color: Int,
) -> Object3D

/// Create debug wireframe sphere
@external(javascript, "./savoiardi.ffi.mjs", "createDebugSphere")
pub fn create_debug_sphere(
  center: Vec3(Float),
  radius: Float,
  color: Int,
) -> Object3D

/// Create debug line
@external(javascript, "./savoiardi.ffi.mjs", "createDebugLine")
pub fn create_debug_line(
  from: Vec3(Float),
  to: Vec3(Float),
  color: Int,
) -> Object3D

/// Create debug axes
@external(javascript, "./savoiardi.ffi.mjs", "createDebugAxes")
pub fn create_debug_axes(origin: Vec3(Float), size: Float) -> Object3D

/// Create debug grid
@external(javascript, "./savoiardi.ffi.mjs", "createDebugGrid")
pub fn create_debug_grid(size: Float, divisions: Int, color: Int) -> Object3D

/// Create debug point marker
@external(javascript, "./savoiardi.ffi.mjs", "createDebugPoint")
pub fn create_debug_point(
  position: Vec3(Float),
  size: Float,
  color: Int,
) -> Object3D

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
