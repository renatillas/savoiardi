//// Typed constructors for the Three.js loader objects used by Savoiardi.
////
//// Loaders are kept in their own module so the higher-level geometry, texture,
//// audio, and object APIs can share them without exposing raw JavaScript values.

/// Loads 2D textures.
pub type TextureLoader

/// Loads cube textures from six image URLs.
pub type CubeTextureLoader

/// Loads audio buffers.
pub type AudioLoader

/// Loads STL geometry assets.
pub type STLLoader

/// Loads fonts used by text geometry.
pub type FontLoader

/// Loads GLTF models.
pub type GLTFLoader

/// Loads OBJ models.
pub type OBJLoader

/// Loads FBX models.
pub type FBXLoader

/// Creates a texture loader.
@external(javascript, "./loader.ffi.mjs", "createTextureLoader")
pub fn texture() -> TextureLoader

/// Creates a cube texture loader.
@external(javascript, "./loader.ffi.mjs", "createCubeTextureLoader")
pub fn cube_texture() -> CubeTextureLoader

/// Creates an audio loader.
@external(javascript, "./loader.ffi.mjs", "createAudioLoader")
pub fn audio() -> AudioLoader

/// Creates an STL loader.
@external(javascript, "./loader.ffi.mjs", "createSTLLoader")
pub fn stl() -> STLLoader

/// Creates a font loader.
@external(javascript, "./loader.ffi.mjs", "createFontLoader")
pub fn font() -> FontLoader

/// Creates a GLTF loader.
@external(javascript, "./loader.ffi.mjs", "createGLTFLoader")
pub fn gltf() -> GLTFLoader

/// Creates an OBJ loader.
@external(javascript, "./loader.ffi.mjs", "createOBJLoader")
pub fn obj() -> OBJLoader

/// Creates an FBX loader.
@external(javascript, "./loader.ffi.mjs", "createFBXLoader")
pub fn fbx() -> FBXLoader
