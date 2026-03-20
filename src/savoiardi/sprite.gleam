//// Sprite creation and sprite-specific transforms.
////
//// Three.js sprites are `Object3D` billboards with a `center` anchor and a
//// sprite-specific material contract, so this module mirrors that split with a
//// dedicated `Sprite` type plus safe conversions back to `Object3D`.

import gleam/bool
import savoiardi/material.{type Material}
import savoiardi/object.{type Object3D}
import vec/vec2.{type Vec2}

/// A Three.js sprite.
pub type Sprite

/// Creates a sprite from a sprite material.
@external(javascript, "./sprite.ffi.mjs", "createSprite")
pub fn create(material: Material) -> Sprite

/// Creates a sprite with Three.js's default sprite material.
@external(javascript, "./sprite.ffi.mjs", "createDefaultSprite")
pub fn create_default() -> Sprite

/// Views a sprite as an object.
@external(javascript, "./sprite.ffi.mjs", "identity")
pub fn to_object3d(sprite: Sprite) -> Object3D

@external(javascript, "./sprite.ffi.mjs", "identity")
fn coerce_to_sprite(object: Object3D) -> Sprite

/// Returns whether an object is a sprite.
@external(javascript, "./sprite.ffi.mjs", "isSprite")
pub fn is_sprite(object: Object3D) -> Bool

/// Safely downcasts an object to a sprite.
pub fn from_object3d(object: Object3D) -> Result(Sprite, Nil) {
  use <- bool.guard(when: !is_sprite(object), return: Error(Nil))
  Ok(coerce_to_sprite(object))
}

/// Reads the sprite anchor in UV space.
@external(javascript, "./sprite.ffi.mjs", "getSpriteCenter")
pub fn get_center(sprite: Sprite) -> Vec2(Float)

/// Sets the sprite anchor in UV space.
@external(javascript, "./sprite.ffi.mjs", "setSpriteCenter")
pub fn set_center(sprite: Sprite, center: Vec2(Float)) -> Sprite
