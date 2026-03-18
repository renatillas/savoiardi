import gleam/list
import gleam/option
import gleam/result
import gleeunit
import savoiardi/camera
import savoiardi/geometry
import savoiardi/light
import savoiardi/material
import savoiardi/object
import savoiardi/scene
import savoiardi/texture
import vec/vec3

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn camera_from_object3d_accepts_cameras_test() {
  let object3d =
    camera.perspective(fov: 60.0, aspect: 1.0, near: 0.1, far: 100.0)
    |> camera.to_object3d

  assert camera.from_object3d(object3d) |> result.is_ok
}

pub fn camera_from_object3d_rejects_non_cameras_test() {
  let group = object.group()
  assert camera.from_object3d(group) == Error(Nil)
}

pub fn light_from_object3d_accepts_lights_test() {
  let object3d =
    light.ambient(color: 0xffffff, intensity: 1.0)
    |> light.to_object3d

  assert light.from_object3d(object3d) |> result.is_ok
}

pub fn light_from_object3d_rejects_non_lights_test() {
  let group = object.group()
  assert light.from_object3d(group) == Error(Nil)
}

pub fn camera_from_object3d_rejects_lights_test() {
  let light_object =
    light.ambient(color: 0xffffff, intensity: 1.0)
    |> light.to_object3d

  assert camera.from_object3d(light_object) == Error(Nil)
}

pub fn light_from_object3d_rejects_cameras_test() {
  let camera_object =
    camera.perspective(fov: 60.0, aspect: 1.0, near: 0.1, far: 100.0)
    |> camera.to_object3d

  assert light.from_object3d(camera_object) == Error(Nil)
}

pub fn object_helpers_update_local_state_test() {
  let child = object.group()
  let parent = object.group()

  object.add_child(parent: parent, child: child)
  child
  |> object.set_name("child")
  |> object.set_visible(False)
  |> object.set_scale(vec3.Vec3(2.0, 3.0, 4.0))
  |> object.set_rotation(vec3.Vec3(x: 0.1, y: 0.2, z: 0.3))
  |> object.translate_x(1.0)
  |> object.translate_y(2.0)
  |> object.translate_z(3.0)
  |> object.update_matrix

  assert object.get_name(child) == "child"
  assert object.is_visible(child) == False
  assert object.get_scale(child) == vec3.Vec3(2.0, 3.0, 4.0)
  assert object.get_parent(child) |> result.is_ok

  object.clear(parent)
  assert object.get_parent(child) == Error(Nil)
}

pub fn geometry_builders_create_meshable_shapes_test() {
  let shapes = [
    geometry.circle(radius: 1.0, segments: 16)
    |> geometry.compute_vertex_normals
    |> geometry.normalize_normals
    |> geometry.compute_bounding_box
    |> geometry.compute_bounding_sphere,
    geometry.ring(inner_radius: 0.5, outer_radius: 1.0, segments: 16)
    |> geometry.compute_vertex_normals
    |> geometry.normalize_normals
    |> geometry.compute_bounding_box
    |> geometry.compute_bounding_sphere,
    geometry.torus_knot(
      radius: 1.0,
      tube: 0.3,
      tubular_segments: 64,
      radial_segments: 8,
    )
    |> geometry.compute_vertex_normals
    |> geometry.normalize_normals
    |> geometry.compute_bounding_box
    |> geometry.compute_bounding_sphere,
    geometry.capsule(
      radius: 0.5,
      length: 1.0,
      cap_segments: 4,
      radial_segments: 8,
    )
    |> geometry.compute_vertex_normals
    |> geometry.normalize_normals
    |> geometry.compute_bounding_box
    |> geometry.compute_bounding_sphere,
  ]

  list.each(shapes, fn(shape) {
    let _ = object.mesh(shape)
    Nil
  })
}

pub fn material_and_scene_helpers_apply_updates_test() {
  let scene = scene.new()
  let mat =
    material.physical(
      color: 0xffffff,
      metalness: 0.5,
      roughness: 0.3,
      transparent: False,
      opacity: 1.0,
      color_map: option.None,
      normal_map: option.None,
      ambient_occlusion_map: option.None,
      displacement_map: option.None,
      displacement_scale: 0.0,
      displacement_bias: 0.0,
      roughness_map: option.None,
      metalness_map: option.None,
      emissive: 0x000000,
      emissive_intensity: 1.0,
      alpha_test: 0.0,
      clearcoat: 0.1,
      clearcoat_roughness: 0.2,
      transmission: 0.0,
      thickness: 0.0,
      ior: 1.5,
    )

  mat
  |> material.set_color(0xff0000)
  |> material.set_transparent(True)
  |> material.set_opacity(0.5)
  |> material.set_emissive(0x111111)
  |> material.set_emissive_intensity(2.0)
  |> material.set_needs_update(True)

  scene
  |> scene.set_background_intensity(0.8)
  |> scene.set_background_blurriness(0.2)
  |> scene.set_environment_intensity(1.2)
  |> scene.clear_environment
  |> scene.clear_background
  |> scene.clear_fog

  Nil
}

pub fn camera_and_light_mutators_are_chainable_test() {
  let _ =
    camera.perspective(fov: 60.0, aspect: 1.0, near: 0.1, far: 100.0)
    |> camera.update_perspective(fov: 75.0, aspect: 1.5, near: 0.2, far: 200.0)
    |> camera.update_projection_matrix

  let _ =
    light.directional(color: 0xffffff, intensity: 1.0)
    |> light.set_color(0xff0000)
    |> light.set_intensity(2.0)
    |> light.set_cast_shadow(True)

  Nil
}

pub fn texture_mapping_enum_is_convertible_test() {
  let _ = texture.color_space_to_string(texture.SRGB)
  let _ = texture.color_space_to_string(texture.LinearSRGB)

  Nil
}
