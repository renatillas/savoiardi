pub type TextureLoader

pub type CubeTextureLoader

pub type STLLoader

pub type FontLoader

pub type GLTFLoader

pub type OBJLoader

pub type FBXLoader

@external(javascript, "./loader.ffi.mjs", "createTextureLoader")
pub fn texture() -> TextureLoader

@external(javascript, "./loader.ffi.mjs", "createCubeTextureLoader")
pub fn cube_texture() -> CubeTextureLoader

@external(javascript, "./loader.ffi.mjs", "createSTLLoader")
pub fn stl() -> STLLoader

@external(javascript, "./loader.ffi.mjs", "createFontLoader")
pub fn font() -> FontLoader

@external(javascript, "./loader.ffi.mjs", "createGLTFLoader")
pub fn gltf() -> GLTFLoader

@external(javascript, "./loader.ffi.mjs", "createOBJLoader")
pub fn obj() -> OBJLoader

@external(javascript, "./loader.ffi.mjs", "createFBXLoader")
pub fn fbx() -> FBXLoader
