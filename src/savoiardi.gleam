//// <script>
//// const docs = [
////   {
////     header: "Scene",
////     functions: [
////       "create_scene",
////       "set_scene_background_color",
////       "set_scene_background_texture",
////       "set_scene_background_cube_texture",
////       "clear_scene_background",
////       "set_scene_fog",
////       "set_scene_fog_exp2",
////       "clear_scene_fog"
////     ]
////   },
////   {
////     header: "Renderer",
////     functions: [
////       "create_renderer",
////       "enable_renderer_shadow_map",
////       "get_renderer_dom_element",
////       "set_renderer_size",
////       "render",
////       "get_canvas_dimensions",
////       "set_animation_loop"
////     ]
////   },
////   {
////     header: "Camera",
////     functions: [
////       "create_perspective_camera",
////       "create_orthographic_camera",
////       "update_camera_projection_matrix",
////       "update_perspective",
////       "update_orthograpic",
////     ]
////   },
////   {
////     header: "Object3D",
////     functions: [
////       "create_group",
////       "create_mesh",
////       "add_child",
////       "remove_child",
////       "dispose_object",
////       "set_object_position",
////       "set_object_scale",
////       "set_object_quaternion",
////       "get_object_material",
////       "set_object_geometry",
////       "set_object_material",
////       "enable_shadows",
////       "replace_object_model",
////       "set_object_visible",
////       "set_object_name",
////     ]
////   },
////   {
////     header: "Geometries",
////     functions: [
////       "create_box_geometry",
////       "create_sphere_geometry",
////       "create_cone_geometry",
////       "create_plane_geometry",
////       "create_cylinder_geometry",
////       "create_torus_geometry",
////       "center_geometry"
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
////       "update_material_wireframe",
////       "update_material_side",
////       "set_material_texture",
////       "dispose_material",
////     ]
////   },
////   {
////     header: "Lights",
////     functions: [
////       "create_ambient_light",
////       "create_directional_light",
////       "create_point_light",
////       "create_spot_light",
////       "create_hemisphere_light",
////       "set_light_cast_shadow",
////       "update_light_color",
////       "update_light_intensity",
////     ]
////   },
////   {
////     header: "Textures",
////     functions: [
////       "load_texture",
////       "load_equirectangular_texture",
////       "load_cube_texture",
////       "set_texture_color_space",
////     ]
////   },
////   {
////     header: "Asset Loading",
////     functions: [
////       "load_stl",
////       "load_gltf",
////       "load_obj",
////       "load_fbx",
////       "get_gltf_scene",
////       "get_fbx_scene",
////     ]
////   },
////   {
////     header: "Conversions",
////     functions: [
////       "scene_to_object3d",
////       "camera_to_object3d",
////       "light_to_object3d",
////       "object3d_to_camera",
////       "object3d_to_light"
////     ]
////   },
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

import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}
import quaternion.{type Quaternion}
import vec/vec2
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

// ============================================================================
// ENUM TYPES
// ============================================================================

/// Which sides of faces to render.
///
/// See: [Material Constants](https://threejs.org/docs/#api/en/constants/Materials)
pub type MaterialSide {
  /// Render front faces only (default).
  FrontSide
  /// Render back faces only.
  BackSide
  /// Render both front and back faces.
  DoubleSide
}

@external(javascript, "./savoiardi.ffi.mjs", "getFrontSide")
fn get_front_side_constant() -> Int

@external(javascript, "./savoiardi.ffi.mjs", "getBackSide")
fn get_back_side_constant() -> Int

@external(javascript, "./savoiardi.ffi.mjs", "getDoubleSide")
fn get_double_side_constant() -> Int

/// Convert a MaterialSide to its Three.js constant value (internal use only).
fn material_side_to_int(side: MaterialSide) -> Int {
  case side {
    FrontSide -> get_front_side_constant()
    BackSide -> get_back_side_constant()
    DoubleSide -> get_double_side_constant()
  }
}

/// Texture color space.
///
/// Controls how texture colors are interpreted.
///
/// See: [Texture Constants](https://threejs.org/docs/#api/en/constants/Textures)
pub type ColorSpace {
  /// Standard sRGB color space. Use for color/albedo textures.
  SRGBColorSpace
  /// Linear sRGB color space. Use for data textures (normal maps, etc).
  LinearSRGBColorSpace
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

/// Clears the scene background.
///
/// Wraps [Scene.background](https://threejs.org/docs/#api/en/scenes/Scene.background)
/// by setting it back to `null`.
@external(javascript, "./savoiardi.ffi.mjs", "clearSceneBackground")
pub fn clear_scene_background(scene: Scene) -> Scene

/// Sets linear fog on the scene.
///
/// Wraps [Scene.fog](https://threejs.org/docs/#api/en/scenes/Scene.fog)
/// with a Three.js `Fog`.
@external(javascript, "./savoiardi.ffi.mjs", "setSceneFog")
pub fn set_scene_fog(scene: Scene, color: Int, near: Float, far: Float) -> Scene

/// Sets exponential fog on the scene.
///
/// Wraps [Scene.fog](https://threejs.org/docs/#api/en/scenes/Scene.fog)
/// with a Three.js `FogExp2`.
@external(javascript, "./savoiardi.ffi.mjs", "setSceneFogExp2")
pub fn set_scene_fog_exp2(scene: Scene, color: Int, density: Float) -> Scene

/// Clears fog from the scene.
///
/// Wraps [Scene.fog](https://threejs.org/docs/#api/en/scenes/Scene.fog)
/// by setting it back to `null`.
@external(javascript, "./savoiardi.ffi.mjs", "clearSceneFog")
pub fn clear_scene_fog(scene: Scene) -> Scene

/// Gets the current canvas dimensions from the renderer.
///
/// Returns a tuple of `#(width, height)` in pixels.
///
/// See [WebGLRenderer](https://threejs.org/docs/#api/en/renderers/WebGLRenderer).
@external(javascript, "./savoiardi.ffi.mjs", "getCanvasDimensions")
pub fn get_canvas_dimensions(renderer: Renderer) -> vec2.Vec2(Float)

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
/// let renderer = create_renderer()
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createRenderer")
pub fn create_renderer(antialias antialias: Bool, alpha alpha: Bool) -> Renderer

/// Enables or disables the shadow map on a renderer.
///
/// When enabled, uses PCFSoftShadowMap for smooth shadow edges.
///
/// ## Parameters
///
/// - `renderer` - The renderer to configure
/// - `enabled` - Whether shadow mapping is enabled
@external(javascript, "./savoiardi.ffi.mjs", "enableRendererShadowMap")
pub fn enable_renderer_shadow_map(renderer: Renderer, enabled: Bool) -> Nil

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
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "setRendererSize")
pub fn set_renderer_size(renderer: Renderer, width: Int, height: Int) -> Nil

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

/// Sets the renderer animation loop callback.
///
/// Wraps [WebGLRenderer.setAnimationLoop](https://threejs.org/docs/#api/en/renderers/WebGLRenderer.setAnimationLoop).
/// The callback receives the raw timestamp from Three.js.
@external(javascript, "./savoiardi.ffi.mjs", "setAnimationLoop")
pub fn set_animation_loop(renderer: Renderer, on_frame: fn(Float) -> Nil) -> Nil

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
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
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
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Camera

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
/// ## Example
///
/// ```gleam
/// let geometry = create_box_geometry(1.0, 1.0, 1.0)
/// let material = create_standard_material(0xff0000, 0.5, 0.5, ...)
/// let cube = create_mesh(geometry)
/// set_object_material(cube, material)
/// add_child(scene_to_object3d(scene), cube)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createMesh")
pub fn create_mesh(geometry: Geometry) -> Object3D

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

/// Replace an existing object's 3D model with a newly loaded one.
///
/// Preserves position, rotation, scale, and visibility from the old object.
/// Reparents the new object under the old object's parent. Disposes old
/// geometry and materials.
@external(javascript, "./savoiardi.ffi.mjs", "replaceObjectModel")
pub fn replace_object_model(
  old_object: Object3D,
  new_object: Object3D,
  name: String,
) -> Object3D

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
/// let mesh = create_mesh(cube)
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
/// - `side` - Which sides of faces to render (FrontSide, BackSide, or DoubleSide)
/// - `alpha_test` - Pixels with alpha below this value won't be rendered (0.0-1.0)
/// - `depth_write` - Whether to write to depth buffer (set False for transparent objects)
///
/// ## Example
///
/// ```gleam
/// // Solid red material
/// let red = create_basic_material(
///   0xff0000, False, 1.0, option.None,
///   FrontSide, 0.0, True,
/// )
///
/// // Transparent sprite with alpha cutoff
/// let sprite = create_basic_material(
///   0xffffff, True, 1.0, option.Some(texture),
///   DoubleSide, 0.1, False,
/// )
/// ```
pub fn create_basic_material(
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

@external(javascript, "./savoiardi.ffi.mjs", "createBasicMaterial")
fn create_basic_material_ffi(
  color: Int,
  transparent: Bool,
  opacity: Float,
  map: Option(Texture),
  side: Int,
  alpha_test: Float,
  depth_write: Bool,
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
/// - `alpha_test` - Alpha cutoff threshold (pixels below this are discarded)
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
///   0x000000, 0.0,        // No emission
///   0.0,                  // No alpha test
/// )
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createStandardMaterial")
pub fn create_standard_material(
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

/// Creates a [MeshPhongMaterial](https://threejs.org/docs/#api/en/materials/MeshPhongMaterial).
///
/// A material for shiny surfaces with specular highlights. Less realistic than
/// StandardMaterial but faster to render. Good for stylized graphics.
///
@external(javascript, "./savoiardi.ffi.mjs", "createPhongMaterial")
pub fn create_phong_material(
  color color: Int,
  shininess shininess: Float,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
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
pub fn create_lambert_material(
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material {
  create_lambert_material_ffi(
    color,
    map,
    normal_map,
    ao_map,
    transparent,
    opacity,
    alpha_test,
  )
}

@external(javascript, "./savoiardi.ffi.mjs", "createLambertMaterial")
fn create_lambert_material_ffi(
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
  color color: Int,
  color_map map: Option(Texture),
  normal_map normal_map: Option(Texture),
  ambient_occlusion_map ao_map: Option(Texture),
  transparent transparent: Bool,
  opacity opacity: Float,
  alpha_test alpha_test: Float,
) -> Material

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
/// add_child(scene_to_object3d(scene), light_to_object3d(ambient))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createAmbientLight")
pub fn create_ambient_light(
  color color: Int,
  intensity intensity: Float,
) -> Light

/// Creates a [DirectionalLight](https://threejs.org/docs/#api/en/lights/DirectionalLight).
///
/// A light that shines in a specific direction, as if from infinitely far away
/// (like the sun). All rays are parallel. Can cast shadows.
///
/// ## Parameters
///
/// - `color` - Light color as hex
/// - `intensity` - Light strength
///
/// ## Example
///
/// ```gleam
/// let sun = create_directional_light(0xffffff, 1.0)
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createDirectionalLight")
pub fn create_directional_light(
  color color: Int,
  intensity intensity: Float,
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
@external(javascript, "./savoiardi.ffi.mjs", "createPointLight")
pub fn create_point_light(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
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
@external(javascript, "./savoiardi.ffi.mjs", "createSpotLight")
pub fn create_spot_light(
  color color: Int,
  intensity intensity: Float,
  distance distance: Float,
  angle angle: Float,
  penumbra penumbra: Float,
) -> Light

/// Sets whether a light casts shadows.
///
/// ## Parameters
///
/// - `light` - The light to configure
/// - `cast_shadow` - Whether the light should cast shadows
@external(javascript, "./savoiardi.ffi.mjs", "setLightCastShadow")
pub fn set_light_cast_shadow(light: Light, cast_shadow: Bool) -> Nil

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
/// add_child(scene_to_object3d(scene), light_to_object3d(hemi))
/// ```
@external(javascript, "./savoiardi.ffi.mjs", "createHemisphereLight")
pub fn create_hemisphere_light(
  sky_color sky_color: Int,
  ground_color ground_color: Int,
  intensity intensity: Float,
) -> Light

/// Updates a light's color.
///
/// Works with all light types (Ambient, Directional, Point, Spot, Hemisphere).
///
/// ## Parameters
///
/// - `light` - The light to update
/// - `color` - Hex color value (e.g., `0xffffff` for white)
@external(javascript, "./savoiardi.ffi.mjs", "updateLightColor")
pub fn update_light_color(light: Light, color: Int) -> Nil

/// Updates a light's intensity.
///
/// Works with all light types.
///
/// ## Parameters
///
/// - `light` - The light to update
/// - `intensity` - Light intensity (typically 0.0 to 2.0+)
@external(javascript, "./savoiardi.ffi.mjs", "updateLightIntensity")
pub fn update_light_intensity(light: Light, intensity: Float) -> Nil

// ============================================================================
// OBJECTS
// ============================================================================

/// Removes a child from its parent.
///
/// Wraps [Object3D.remove](https://threejs.org/docs/#api/en/core/Object3D.remove).
@external(javascript, "./savoiardi.ffi.mjs", "removeChild")
pub fn remove_child(parent: Object3D, child: Object3D) -> Nil

/// Sets the object's local position.
///
/// Wraps [Object3D.position](https://threejs.org/docs/#api/en/core/Object3D.position).
///
/// ## Parameters
///
/// - `object` - The object to position
/// - `position` - Position as Vec3 (x, y, z)
@external(javascript, "./savoiardi.ffi.mjs", "setPosition")
pub fn set_object_position(object: Object3D, position: Vec3(Float)) -> Object3D

/// Sets the object's local scale.
///
/// Wraps [Object3D.scale](https://threejs.org/docs/#api/en/core/Object3D.scale).
///
/// ## Parameters
///
/// - `object` - The object to scale
/// - `scale` - Scale factors as Vec3 (1.0 = original size)
@external(javascript, "./savoiardi.ffi.mjs", "setScale")
pub fn set_object_scale(object: Object3D, scale: Vec3(Float)) -> Object3D

/// Sets a texture's color space.
///
/// ## Parameters
///
/// - `texture` - The texture to configure
/// - `color_space` - The color space (SRGBColorSpace for color textures, LinearSRGBColorSpace for data)
@external(javascript, "./savoiardi.ffi.mjs", "getSRGBColorSpace")
fn get_srgb_color_space_constant() -> String

@external(javascript, "./savoiardi.ffi.mjs", "getLinearSRGBColorSpace")
fn get_linear_srgb_color_space_constant() -> String

fn color_space_to_string(space: ColorSpace) -> String {
  case space {
    SRGBColorSpace -> get_srgb_color_space_constant()
    LinearSRGBColorSpace -> get_linear_srgb_color_space_constant()
  }
}

pub fn set_texture_color_space(texture: Texture, color_space: ColorSpace) -> Nil {
  set_texture_color_space_ffi(texture, color_space_to_string(color_space))
}

@external(javascript, "./savoiardi.ffi.mjs", "setTextureColorSpace")
fn set_texture_color_space_ffi(texture: Texture, color_space: String) -> Nil

// ============================================================================
// CAMERA AND MATERIAL/OBJECT UPDATES
// ============================================================================

/// Updates the camera's projection matrix.
///
/// See [PerspectiveCamera](https://threejs.org/docs/#api/en/cameras/PerspectiveCamera) or
/// [OrthographicCamera](https://threejs.org/docs/#api/en/cameras/OrthographicCamera).
/// Call this after changing camera parameters (fov, aspect, near, far, etc.).
@external(javascript, "./savoiardi.ffi.mjs", "updateCameraProjectionMatrix")
pub fn update_camera_projection_matrix(camera: Camera) -> Nil

/// Sets all parameters of a perspective camera.
///
/// Updates fov, aspect, near, and far planes. Call `update_camera_projection_matrix`
/// afterward to apply the changes.
@external(javascript, "./savoiardi.ffi.mjs", "setPerspectiveCameraParams")
pub fn update_perspective(
  camera: Camera,
  fov fov: Float,
  aspect aspect: Float,
  near near: Float,
  far far: Float,
) -> Nil

/// Sets all parameters of an orthographic camera.
///
/// Updates left, right, top, bottom, near, and far planes. Call
/// `update_camera_projection_matrix` afterward to apply the changes.
@external(javascript, "./savoiardi.ffi.mjs", "updateOrthographicCamera")
pub fn update_orthograpic(
  camera: Camera,
  left left: Float,
  right right: Float,
  top top: Float,
  bottom bottom: Float,
  near near: Float,
  far far: Float,
) -> Nil

/// Gets the material from a mesh.
///
/// Accesses [Mesh.material](https://threejs.org/docs/#api/en/objects/Mesh.material).
@external(javascript, "./savoiardi.ffi.mjs", "getObjectMaterial")
pub fn get_object_material(object: Object3D) -> Material

/// Sets the geometry of a mesh.
///
/// Replaces the mesh's geometry. The old geometry is not automatically disposed.
@external(javascript, "./savoiardi.ffi.mjs", "setObjectGeometry")
pub fn set_object_geometry(object: Object3D, geometry: Geometry) -> Nil

/// Sets the material of a mesh.
///
/// Replaces the mesh's material. The old material is not automatically disposed.
@external(javascript, "./savoiardi.ffi.mjs", "setObjectMaterial")
pub fn set_object_material(object: Object3D, material: Material) -> Nil

/// Updates a material's wireframe mode.
///
/// ## Parameters
///
/// - `material` - The material to update
/// - `wireframe` - Whether to render as wireframe
@external(javascript, "./savoiardi.ffi.mjs", "updateMaterialWireframe")
pub fn update_material_wireframe(material: Material, wireframe: Bool) -> Nil

/// Sets a texture on a named material property.
///
/// Property names use Three.js convention:
/// - `"map"` — color/albedo texture
/// - `"normalMap"` — normal map
/// - `"aoMap"` — ambient occlusion map
/// - `"roughnessMap"` — roughness map
/// - `"metalnessMap"` — metalness map
/// - `"displacementMap"` — displacement map
///
/// ## Parameters
///
/// - `material` - The material to update
/// - `property_name` - Three.js texture property name
/// - `texture` - The texture to set
@external(javascript, "./savoiardi.ffi.mjs", "setMaterialTexture")
pub fn set_material_texture(
  material: Material,
  property_name: String,
  texture: Texture,
) -> Nil

/// Updates a material's rendering side after creation.
///
/// Controls which sides of geometry faces are rendered.
///
/// ## Parameters
///
/// - `material` - The material to update
/// - `side` - Which sides to render (FrontSide, BackSide, or DoubleSide)
pub fn update_material_side(material: Material, side: MaterialSide) -> Nil {
  update_material_side_ffi(material, material_side_to_int(side))
}

@external(javascript, "./savoiardi.ffi.mjs", "updateMaterialSide")
fn update_material_side_ffi(material: Material, side: Int) -> Nil

/// Sets the object's rotation using a quaternion.
///
/// Sets [Object3D.quaternion](https://threejs.org/docs/#api/en/core/Object3D.quaternion).
/// Quaternions avoid gimbal lock and interpolate smoothly.
@external(javascript, "./savoiardi.ffi.mjs", "setObjectQuaternion")
pub fn set_object_quaternion(object: Object3D, quaternion: Quaternion) -> Nil

/// Enables shadow casting and receiving on all meshes in an object hierarchy.
///
/// Traverses the object and all children, setting `castShadow` and `receiveShadow`.
@external(javascript, "./savoiardi.ffi.mjs", "enableShadows")
pub fn enable_shadows(
  object: Object3D,
  cast_shadow cast_shadow: Bool,
  receive_shadow receive_shadow: Bool,
) -> Nil

/// Disposes of a material and frees GPU memory.
///
/// Wraps [Material.dispose](https://threejs.org/docs/#api/en/materials/Material.dispose).
/// Note: This does not dispose textures used by the material.
@external(javascript, "./savoiardi.ffi.mjs", "disposeMaterial")
pub fn dispose_material(material: Material) -> Nil

// ============================================================================
// ASSET LOADING
// ============================================================================

/// Loads a texture image from a URL asynchronously.
///
/// Supports common image formats: PNG, JPG, GIF, BMP, WebP.
/// The texture is automatically uploaded to GPU memory when used.
///
/// See: [TextureLoader](https://threejs.org/docs/#api/en/loaders/TextureLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the image file
///
/// ## Example
///
/// ```gleam
/// use texture <- promise.await(load_texture("/textures/brick.jpg"))
/// case texture {
///   Ok(tex) -> {
///     let material = create_basic_material(0xffffff, False, 1.0, option.Some(tex))
///     // Use material...
///   }
///   Error(Nil) -> io.println("Failed to load texture")
/// }
/// ```
///
/// ## Notes
///
/// - Loading is asynchronous - texture may not be immediately available
/// - Large textures impact memory; consider power-of-two dimensions
/// - Set texture filtering and wrapping after loading if needed
/// - CORS restrictions apply for cross-origin URLs
/// - Consider using compressed textures (KTX2) for better performance
///
@external(javascript, "./savoiardi.ffi.mjs", "loadTexture")
pub fn load_texture(url: String) -> Promise(Result(Texture, Nil))

/// Loads an STL (stereolithography) model from a URL.
///
/// STL is common for 3D printing and CAD applications. Returns only
/// geometry data - you'll need to create a material and mesh.
///
/// See: [STLLoader](https://threejs.org/docs/#examples/en/loaders/STLLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the .stl file
///
/// ## Example
///
/// ```gleam
/// use geometry <- promise.await(load_stl("/models/part.stl"))
/// case geometry {
///   Ok(geo) -> {
///     let material = create_standard_material(0x888888, 0.5, 0.5, option.None)
///     let mesh = create_mesh(geo)
///     set_object_material(mesh, material)
///     add_child(scene_to_object3d(scene), mesh)
///   }
///   Error(Nil) -> io.println("Failed to load STL")
/// }
/// ```
///
/// ## Notes
///
/// - STL contains only geometry, no materials or colors
/// - Both ASCII and binary STL formats are supported
/// - Binary STL is more compact and loads faster
/// - STL has no hierarchy - always returns a single geometry
/// - Consider computing vertex normals after loading for smooth shading
///
@external(javascript, "./savoiardi.ffi.mjs", "loadSTL")
pub fn load_stl(url: String) -> Promise(Result(Geometry, Nil))

/// Centers a geometry around its bounding box center.
///
/// This is useful for STL or OBJ models that need to rotate around their
/// geometric center rather than their original origin point.
///
/// Many CAD-exported models have their origin at an arbitrary location.
/// Call this function after loading to ensure the model rotates around
/// its visual center.
///
/// ## Example
///
/// ```gleam
/// use result <- promise.await(load_stl("/models/part.stl"))
/// case result {
///   Ok(geometry) -> {
///     // Center the geometry so it rotates around its middle
///     let centered = center_geometry(geometry)
///     let material = create_standard_material(0x888888, 0.5, 0.5, option.None)
///     let mesh = create_mesh(centered)
///     set_object_material(mesh, material)
///   }
///   Error(Nil) -> io.println("Failed to load")
/// }
/// ```
///
/// ## Notes
///
/// - This mutates the geometry in place and returns it for convenience
/// - The geometry's vertices are translated so the bounding box center is at origin
/// - Useful for any geometry, not just STL files
///
@external(javascript, "./savoiardi.ffi.mjs", "centerGeometry")
pub fn center_geometry(geometry: Geometry) -> Geometry

/// Loads a GLTF or GLB model from a URL.
///
/// GLTF is the recommended format for web 3D - it's efficient, well-supported,
/// and includes materials, animations, and scene hierarchy.
///
/// See: [GLTFLoader](https://threejs.org/docs/#examples/en/loaders/GLTFLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the .gltf or .glb file
///
/// ## Example
///
/// ```gleam
/// use gltf <- promise.await(load_gltf("/models/character.glb"))
/// case gltf {
///   Ok(data) -> {
///     let model = get_gltf_scene(data)
///     add_child(scene_to_object3d(scene), model)
///   }
///   Error(Nil) -> io.println("Failed to load GLTF")
/// }
/// ```
///
/// ## Notes
///
/// - GLB is binary GLTF - single file, faster to load
/// - GLTF may reference external textures and .bin files
/// - Materials are automatically converted to Three.js materials
/// - Animations are stored in `animations` array of GLTFData
/// - Use Draco compression for smaller file sizes (requires DRACOLoader)
/// - Consider KTX2 textures for GPU-compressed textures
///
@external(javascript, "./savoiardi.ffi.mjs", "loadGLTF")
pub fn load_gltf(url: String) -> Promise(Result(GLTFData, Nil))

/// Loads an OBJ model from a URL.
///
/// OBJ is a simple, widely-supported 3D format. It contains only
/// geometry and basic material references (via .mtl files).
///
/// See: [OBJLoader](https://threejs.org/docs/#examples/en/loaders/OBJLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the .obj file
///
/// ## Example
///
/// ```gleam
/// use model <- promise.await(load_obj("/models/furniture.obj"))
/// case model {
///   Ok(obj) -> {
///     add_child(scene_to_object3d(scene), obj)
///   }
///   Error(Nil) -> io.println("Failed to load OBJ")
/// }
/// ```
///
/// ## Notes
///
/// - OBJ files are text-based and can be large
/// - Materials require separate MTLLoader (not included here)
/// - No animation support in OBJ format
/// - Returns an Object3D that may contain multiple meshes
/// - Consider GLTF for better features and smaller files
///
@external(javascript, "./savoiardi.ffi.mjs", "loadOBJ")
pub fn load_obj(url: String) -> Promise(Result(Object3D, Nil))

/// Loads an FBX model from a URL.
///
/// FBX is common in game development and supports complex animations,
/// blend shapes, and skeletal rigs from tools like Maya and Blender.
///
/// See: [FBXLoader](https://threejs.org/docs/#examples/en/loaders/FBXLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the .fbx file
///
/// ## Example
///
/// ```gleam
/// use fbx <- promise.await(load_fbx("/models/animated_character.fbx"))
/// case fbx {
///   Ok(data) -> {
///     let model = get_fbx_scene(data)
///     add_child(scene_to_object3d(scene), model)
///   }
///   Error(Nil) -> io.println("Failed to load FBX")
/// }
/// ```
///
/// ## Notes
///
/// - FBX files can be very large (binary format recommended)
/// - Supports skeletal animation, blend shapes, and morph targets
/// - Materials may need adjustment for web rendering
/// - Embedded textures are automatically extracted
/// - Consider converting to GLTF for better web performance
///
@external(javascript, "./savoiardi.ffi.mjs", "loadFBX")
pub fn load_fbx(url: String) -> Promise(Result(FBXData, Nil))

// ============================================================================
// GLTF/FBX DATA ACCESSORS
// ============================================================================

/// Get the root scene/group from loaded GLTF data.
///
/// GLTF files contain a scene hierarchy. This function extracts the root
/// Object3D that contains all meshes, lights, cameras, and other objects.
///
/// ## Parameters
///
/// - `data`: The GLTFData returned from `load_gltf`
///
/// ## Example
///
/// ```gleam
/// use gltf <- promise.await(load_gltf("/models/character.glb"))
/// case gltf {
///   Ok(data) -> {
///     let scene = get_gltf_scene(data)
///     add_child(scene_to_object3d(main_scene), scene)
///   }
///   Error(Nil) -> io.println("Failed to load GLTF")
/// }
/// ```
///
@external(javascript, "./savoiardi.ffi.mjs", "getGltfScene")
pub fn get_gltf_scene(data: GLTFData) -> Object3D

/// Get the root scene/group from loaded FBX data.
///
/// Unlike GLTF where data is wrapped, FBX loader returns the scene directly.
/// This function provides a consistent API for accessing the scene.
///
/// ## Parameters
///
/// - `data`: The FBXData returned from `load_fbx`
///
/// ## Example
///
/// ```gleam
/// use fbx <- promise.await(load_fbx("/models/character.fbx"))
/// case fbx {
///   Ok(data) -> {
///     let scene = get_fbx_scene(data)
///     add_child(scene_to_object3d(main_scene), scene)
///   }
///   Error(Nil) -> io.println("Failed to load FBX")
/// }
/// ```
///
@external(javascript, "./savoiardi.ffi.mjs", "getFbxScene")
pub fn get_fbx_scene(data: FBXData) -> Object3D

/// Loads an equirectangular (360°) texture for environment maps or skyboxes.
///
/// Equirectangular images are panoramic photos mapped to a sphere.
/// Commonly used for environment backgrounds and reflections.
///
/// See: [TextureLoader](https://threejs.org/docs/#api/en/loaders/TextureLoader)
///
/// ## Parameters
///
/// - `url`: Path or URL to the equirectangular image (PNG, JPG, WebP)
///
/// ## Example
///
/// ```gleam
/// use env_texture <- promise.await(load_equirectangular_texture("/env/studio.jpg"))
/// case env_texture {
///   Ok(tex) -> {
///     // Use as scene background
///     set_scene_background_texture(scene, tex)
///   }
///   Error(Nil) -> io.println("Failed to load environment")
/// }
/// ```
///
/// ## Notes
///
/// - Supports standard image formats (PNG, JPG, WebP)
/// - Large panoramas impact memory and load time
/// - Consider pre-processed cubemaps for better performance
///
@external(javascript, "./savoiardi.ffi.mjs", "loadEquirectangularTexture")
pub fn load_equirectangular_texture(
  url: String,
) -> Promise(Result(Texture, Nil))

/// Loads a cube texture (skybox) from 6 image URLs.
///
/// Cube textures use 6 images representing the faces of a cube:
/// positive X, negative X, positive Y, negative Y, positive Z, negative Z.
///
/// See: [CubeTextureLoader](https://threejs.org/docs/#api/en/loaders/CubeTextureLoader)
///
/// ## Parameters
///
/// - `urls`: List of 6 URLs in order: [+X, -X, +Y, -Y, +Z, -Z]
///
/// ## Example
///
/// ```gleam
/// let skybox_urls = [
///   "/skybox/px.jpg",  // positive X (right)
///   "/skybox/nx.jpg",  // negative X (left)
///   "/skybox/py.jpg",  // positive Y (top)
///   "/skybox/ny.jpg",  // negative Y (bottom)
///   "/skybox/pz.jpg",  // positive Z (front)
///   "/skybox/nz.jpg",  // negative Z (back)
/// ]
///
/// use cube_tex <- promise.await(load_cube_texture(skybox_urls))
/// case cube_tex {
///   Ok(tex) -> set_scene_background_cube_texture(scene, tex)
///   Error(Nil) -> io.println("Failed to load skybox")
/// }
/// ```
///
/// ## Notes
///
/// - All 6 images must be the same size and square
/// - Power-of-two dimensions recommended (512, 1024, 2048)
/// - More efficient than equirectangular for real-time skyboxes
/// - Can also be used for reflection/environment mapping
/// - Consider compressed textures for large skyboxes
///
@external(javascript, "./savoiardi.ffi.mjs", "loadCubeTexture")
pub fn load_cube_texture(
  urls: List(String),
) -> Promise(Result(CubeTexture, Nil))

// ============================================================================
// POSITIONAL AUDIO OPERATIONS
// ============================================================================

/// Set an object's visibility.
///
/// Sets [Object3D.visible](https://threejs.org/docs/#api/en/core/Object3D.visible).
@external(javascript, "./savoiardi.ffi.mjs", "setObjectVisible")
pub fn set_object_visible(object: Object3D, visible: Bool) -> Nil

/// Set an object's name.
///
/// Sets [Object3D.name](https://threejs.org/docs/#api/en/core/Object3D.name).
@external(javascript, "./savoiardi.ffi.mjs", "setObjectName")
pub fn set_object_name(object: Object3D, name: String) -> Nil

/// Cast a Scene to Object3D.
///
/// Scene extends Object3D in Three.js, so this is a safe identity cast.
/// Useful when you need to use a Scene where an Object3D is expected
/// (e.g., as a parent for add_child).
@external(javascript, "./savoiardi.ffi.mjs", "identity")
pub fn scene_to_object3d(scene: Scene) -> Object3D

/// Cast a Camera to Object3D.
///
/// Camera extends Object3D in Three.js, so this is a safe identity cast.
@external(javascript, "./savoiardi.ffi.mjs", "identity")
pub fn camera_to_object3d(camera: Camera) -> Object3D

/// Cast a Light to Object3D.
///
/// Light extends Object3D in Three.js, so this is a safe identity cast.
@external(javascript, "./savoiardi.ffi.mjs", "identity")
pub fn light_to_object3d(light: Light) -> Object3D

/// Cast an Object3D to Camera (unsafe — caller must ensure it's actually a Camera).
/// TODO: This should return a Result
@external(javascript, "./savoiardi.ffi.mjs", "identity")
pub fn object3d_to_camera(object: Object3D) -> Camera

/// Cast an Object3D to Light (unsafe — caller must ensure it's actually a Light).
/// TODO: This should return a Result
@external(javascript, "./savoiardi.ffi.mjs", "identity")
pub fn object3d_to_light(object: Object3D) -> Light
