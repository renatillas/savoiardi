//// Audio buffers, listeners, and scene audio objects.
////
//// The audio API mirrors the Three.js audio model while keeping the public
//// surface typed in terms of listeners, global audio, and positional audio.

import gleam/javascript/promise.{type Promise}
import savoiardi
import savoiardi/camera.{type Camera}
import savoiardi/loader.{type AudioLoader}
import savoiardi/object.{type Object3D}
import savoiardi/scene.{type Scene}

/// A decoded audio buffer.
pub type AudioBuffer

/// A scene listener, typically attached to a camera.
pub type Listener

/// A non-positional audio source.
pub type Audio

/// An audio source with positional attenuation.
pub type PositionalAudio

/// Creates a new listener.
@external(javascript, "./audio.ffi.mjs", "createListener")
pub fn listener() -> Listener

/// Attaches a listener to a camera.
@external(javascript, "./audio.ffi.mjs", "attachListenerToCamera")
pub fn attach_listener(listener: Listener, camera: Camera) -> Listener

/// Finds the first listener attached somewhere in the scene.
@external(javascript, "./audio.ffi.mjs", "findSceneListener")
pub fn find_listener(scene: Scene) -> Result(Listener, Nil)

/// Creates a global audio source that plays through the listener.
@external(javascript, "./audio.ffi.mjs", "createAudio")
pub fn global(listener: Listener) -> Audio

/// Creates a positional audio source that plays through the listener.
@external(javascript, "./audio.ffi.mjs", "createPositionalAudio")
pub fn positional(listener: Listener) -> PositionalAudio

/// Widens a positional audio source into the shared audio type.
@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn from_positional(audio: PositionalAudio) -> Audio

/// Views an audio source as an object.
@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn to_object3d(audio: Audio) -> Object3D

/// Views a listener as an object.
@external(javascript, "../savoiardi.ffi.mjs", "identity")
pub fn listener_to_object3d(listener: Listener) -> Object3D

@external(javascript, "./audio.ffi.mjs", "identity")
fn coerce_to_audio(object: Object3D) -> Audio

@external(javascript, "./audio.ffi.mjs", "identity")
fn coerce_to_positional_audio(object: Object3D) -> PositionalAudio

@external(javascript, "./audio.ffi.mjs", "identity")
fn coerce_to_listener(object: Object3D) -> Listener

/// Returns whether an object is an audio source.
@external(javascript, "./audio.ffi.mjs", "isAudio")
pub fn is_audio(object: Object3D) -> Bool

/// Returns whether an object is a positional audio source.
@external(javascript, "./audio.ffi.mjs", "isPositionalAudio")
pub fn is_positional_audio(object: Object3D) -> Bool

/// Returns whether an object is an audio listener.
@external(javascript, "./audio.ffi.mjs", "isAudioListener")
pub fn is_listener(object: Object3D) -> Bool

/// Safely downcasts an object to an audio source.
pub fn audio_from_object3d(object: Object3D) -> Result(Audio, Nil) {
  case is_audio(object) {
    True -> Ok(coerce_to_audio(object))
    False -> Error(Nil)
  }
}

/// Safely downcasts an object to a positional audio source.
pub fn positional_from_object3d(
  object: Object3D,
) -> Result(PositionalAudio, Nil) {
  case is_positional_audio(object) {
    True -> Ok(coerce_to_positional_audio(object))
    False -> Error(Nil)
  }
}

/// Safely downcasts an object to a listener.
pub fn listener_from_object3d(object: Object3D) -> Result(Listener, Nil) {
  case is_listener(object) {
    True -> Ok(coerce_to_listener(object))
    False -> Error(Nil)
  }
}

/// Loads an audio buffer and reports the result through a callback.
@external(javascript, "../savoiardi.ffi.mjs", "load")
pub fn load(
  loader: AudioLoader,
  url: String,
  on_result: fn(Result(AudioBuffer, savoiardi.LoadError)) -> Nil,
) -> Nil

/// Loads an audio buffer asynchronously.
@external(javascript, "../savoiardi.ffi.mjs", "loadAsync")
pub fn load_async(
  loader: AudioLoader,
  url: String,
) -> Promise(Result(AudioBuffer, savoiardi.LoadError))

/// Assigns a buffer to an audio source.
@external(javascript, "./audio.ffi.mjs", "setBuffer")
pub fn set_buffer(audio: Audio, buffer: AudioBuffer) -> Audio

/// Removes the current buffer from an audio source.
@external(javascript, "./audio.ffi.mjs", "clearBuffer")
pub fn clear_buffer(audio: Audio) -> Audio

/// Returns whether an audio source has a buffer.
@external(javascript, "./audio.ffi.mjs", "hasBuffer")
pub fn has_buffer(audio: Audio) -> Bool

/// Sets the playback volume for an audio source.
@external(javascript, "./audio.ffi.mjs", "setVolume")
pub fn set_volume(audio: Audio, volume: Float) -> Audio

/// Enables or disables looping for an audio source.
@external(javascript, "./audio.ffi.mjs", "setLoop")
pub fn set_loop(audio: Audio, should_loop: Bool) -> Audio

/// Sets the playback rate for an audio source.
@external(javascript, "./audio.ffi.mjs", "setPlaybackRate")
pub fn set_playback_rate(audio: Audio, rate: Float) -> Audio

/// Starts playback for an audio source.
@external(javascript, "./audio.ffi.mjs", "play")
pub fn play(audio: Audio) -> Audio

/// Pauses an audio source.
@external(javascript, "./audio.ffi.mjs", "pause")
pub fn pause(audio: Audio) -> Audio

/// Stops an audio source.
@external(javascript, "./audio.ffi.mjs", "stop")
pub fn stop(audio: Audio) -> Audio

/// Sets the reference distance for positional attenuation.
@external(javascript, "./audio.ffi.mjs", "setRefDistance")
pub fn set_ref_distance(
  audio: PositionalAudio,
  distance: Float,
) -> PositionalAudio

/// Sets the rolloff factor for positional attenuation.
@external(javascript, "./audio.ffi.mjs", "setRolloffFactor")
pub fn set_rolloff_factor(
  audio: PositionalAudio,
  factor: Float,
) -> PositionalAudio

/// Sets the maximum effective distance for positional attenuation.
@external(javascript, "./audio.ffi.mjs", "setMaxDistance")
pub fn set_max_distance(
  audio: PositionalAudio,
  distance: Float,
) -> PositionalAudio

/// Disposes an audio source.
@external(javascript, "./audio.ffi.mjs", "disposeAudio")
pub fn dispose(audio: Audio) -> Nil

/// Disposes a listener.
@external(javascript, "./audio.ffi.mjs", "disposeAudio")
pub fn dispose_listener(listener: Listener) -> Nil
