import * as THREE from "three";

import { result_from_nullable } from "../savoiardi.ffi.mjs";

export function createListener() {
  return new THREE.AudioListener();
}

export function attachListenerToCamera(listener, camera) {
  if (!listener || !camera) return listener;
  if (listener.parent !== camera) {
    camera.add(listener);
  }
  return listener;
}

export function findSceneListener(scene) {
  let found = null;
  scene.traverse((object) => {
    if (found === null && object?.isAudioListener === true) {
      found = object;
    }
  });
  return result_from_nullable(found);
}

export function createAudio(listener) {
  return new THREE.Audio(listener);
}

export function createPositionalAudio(listener) {
  return new THREE.PositionalAudio(listener);
}

export function identity(value) {
  return value;
}

export function isAudio(object) {
  return object?.type === "Audio" || object?.type === "PositionalAudio";
}

export function isPositionalAudio(object) {
  return object?.type === "PositionalAudio";
}

export function isAudioListener(object) {
  return object?.isAudioListener === true;
}

export function setBuffer(audio, buffer) {
  if (audio.isPlaying) {
    audio.stop();
  }
  audio.setBuffer(buffer);
  return audio;
}

export function clearBuffer(audio) {
  if (audio.isPlaying) {
    audio.stop();
  }
  audio.buffer = null;
  return audio;
}

export function hasBuffer(audio) {
  return audio.buffer != null;
}

export function setVolume(audio, volume) {
  audio.setVolume(volume);
  return audio;
}

export function setLoop(audio, shouldLoop) {
  audio.setLoop(shouldLoop);
  return audio;
}

export function setPlaybackRate(audio, rate) {
  audio.setPlaybackRate(rate);
  return audio;
}

export function play(audio) {
  if (!audio.buffer) return audio;
  if (!audio.isPlaying) {
    audio.play();
  }
  return audio;
}

export function pause(audio) {
  if (audio.isPlaying) {
    audio.pause();
  }
  return audio;
}

export function stop(audio) {
  if (audio.isPlaying) {
    audio.stop();
  }
  return audio;
}

export function setRefDistance(audio, distance) {
  audio.setRefDistance(distance);
  return audio;
}

export function setRolloffFactor(audio, factor) {
  audio.setRolloffFactor(factor);
  return audio;
}

export function setMaxDistance(audio, distance) {
  audio.setMaxDistance(distance);
  return audio;
}

export function disposeAudio(audio) {
  if (!audio) return;
  if (audio.isPlaying) {
    audio.stop();
  }
  if (typeof audio.disconnect === "function") {
    audio.disconnect();
  }
}
