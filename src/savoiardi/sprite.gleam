//// Sprite creation and sprite-specific transforms.
////
//// This module exposes a small typed wrapper over Three.js sprites so higher
//// level packages can stay almost entirely in Gleam.

import savoiardi/material.{type Material}
import savoiardi/object.{type Object3D}
import vec/vec2.{type Vec2}

/// Creates a sprite from a sprite material.
@external(javascript, "./sprite.ffi.mjs", "createSprite")
pub fn create(material: Material) -> Object3D

/// Sets the sprite anchor in UV space.
@external(javascript, "./sprite.ffi.mjs", "setSpriteCenter")
pub fn set_center(sprite: Object3D, center: Vec2(Float)) -> Object3D
