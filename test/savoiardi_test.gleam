import gleam/list
import gleam/option
import gleam/result
import gleeunit
import savoiardi/camera
import savoiardi/geometry
import savoiardi/light
import savoiardi/material
import savoiardi/object
import savoiardi/renderer
import savoiardi/scene
import vec/vec2
import vec/vec3

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn perspective_camera_surface_test() {
  let perspective =
    camera.perspective(fov: 60.0, aspect: 1.0, near: 0.1, far: 100.0)
    |> camera.set_perspective_fov(75.0)
    |> camera.set_perspective_aspect(1.5)
    |> camera.set_perspective_focal_length(35.0)
    |> camera.set_perspective_film_gauge(32.0)
    |> camera.set_perspective_film_offset(1.0)

  let generic =
    perspective
    |> camera.from_perspective
    |> camera.set_near(0.5)
    |> camera.set_far(250.0)
    |> camera.set_zoom(1.25)
    |> camera.set_view_offset(
      full_width: 1920,
      full_height: 1080,
      x: 0,
      y: 0,
      width: 960,
      height: 540,
    )
    |> camera.clear_view_offset
    |> camera.update_projection_matrix

  assert camera.perspective_aspect(perspective) == 1920.0 /. 1080.0
  assert camera.perspective_focal_length(perspective) >. 0.0
  assert camera.perspective_effective_fov(perspective) >. 0.0
  assert camera.perspective_film_width(perspective) >. 0.0
  assert camera.perspective_film_height(perspective) >. 0.0
  assert camera.near(generic) == 0.5
  assert camera.far(generic) == 250.0
  assert camera.zoom(generic) == 1.25
  assert camera.perspective_from_object3d(camera.to_object3d(generic))
    |> result.is_ok
}

pub fn orthographic_camera_surface_test() {
  let orthographic =
    camera.orthographic(
      left: -10.0,
      right: 10.0,
      top: 10.0,
      bottom: -10.0,
      near: 0.1,
      far: 50.0,
    )
    |> camera.set_orthographic_left(-5.0)
    |> camera.set_orthographic_right(5.0)
    |> camera.set_orthographic_top(6.0)
    |> camera.set_orthographic_bottom(-6.0)

  let generic =
    orthographic
    |> camera.from_orthographic
    |> camera.set_near(0.25)
    |> camera.set_far(75.0)
    |> camera.set_zoom(2.0)
    |> camera.update_projection_matrix

  assert camera.orthographic_left(orthographic) == -5.0
  assert camera.orthographic_right(orthographic) == 5.0
  assert camera.orthographic_top(orthographic) == 6.0
  assert camera.orthographic_bottom(orthographic) == -6.0
  assert camera.near(generic) == 0.25
  assert camera.far(generic) == 75.0
  assert camera.zoom(generic) == 2.0
  assert camera.orthographic_from_object3d(camera.to_object3d(generic))
    |> result.is_ok
}

pub fn object_surface_test() {
  let material =
    material.basic(
      material.BasicOptions(
        ..material.basic_options(),
        color: 0xabcdef,
      ),
    )

  let geometry = geometry.box(width: 1.0, height: 1.0, depth: 1.0)
  let parent = object.group()
  let child = object.mesh(geometry, material)

  child
  |> object.set_position(vec3.Vec3(1.0, 2.0, 3.0))
  |> object.set_rotation(vec3.Vec3(0.0, 0.0, 0.0))
  |> object.rotate_x(0.5)
  |> object.rotate_y(0.25)
  |> object.rotate_z(0.125)
  |> object.set_scale(vec3.Vec3(2.0, 3.0, 4.0))
  |> object.set_render_order(10)
  |> object.set_cast_shadow(True)
  |> object.set_receive_shadow(True)
  |> object.set_name("cube")
  |> object.set_matrix_auto_update(False)
  |> object.set_matrix_world_auto_update(False)
  |> object.update_matrix

  object.add_child(parent: parent, child: child)
  object.attach_child(parent: parent, child: child)

  let clone = object.clone(parent, True)

  assert object.get_position(child) == vec3.Vec3(1.0, 2.0, 3.0)
  assert object.get_scale(child).x == 2.0
  assert object.get_scale(child).y == 3.0
  assert object.get_scale(child).z >. 3.99
  assert object.get_rotation(child).x >. 0.49
  assert object.get_rotation(child).y >. 0.24
  assert object.get_rotation(child).z >. 0.12
  assert object.get_parent(child) |> result.is_ok
  assert object.get_by_name(parent, "cube") |> result.is_ok
  assert object.get_by_property(parent, "name", "cube") |> result.is_ok
  assert object.get_all_by_property(parent, "name", "cube") |> list.length == 1
  assert object.children(parent) |> list.length == 1
  assert object.id(parent) > 0
  assert object.uuid(parent) != ""
  assert object.children(clone) |> list.length == 1
}

pub fn light_surface_test() {
  let directional = case
    light.directional(color: 0xffffff, intensity: 1.0)
    |> light.directional_from_light
  {
    Ok(light) ->
      light
      |> light.directional_set_target(object.group())
      |> light.directional_set_shadow_camera_bounds(-10.0, 10.0, 10.0, -10.0)
      |> light.directional_set_shadow_camera_near_far(0.5, 50.0)
    Error(_) -> panic as "Expected directional light"
  }

  let point = case
    light.point(
      color: 0xffffff,
      intensity: 1.0,
      distance: 10.0,
    )
    |> light.point_from_light
  {
    Ok(light) ->
      light
      |> light.point_set_distance(20.0)
      |> light.point_set_decay(2.0)
      |> light.point_set_power(4.0)
      |> light.point_set_shadow_camera_near_far(0.25, 40.0)
    Error(_) -> panic as "Expected point light"
  }

  let spot = case
    light.spot(
      color: 0xffffff,
      intensity: 1.0,
      distance: 10.0,
      angle: 0.5,
      penumbra: 0.1,
    )
    |> light.spot_from_light
  {
    Ok(light) ->
      light
      |> light.spot_set_target(object.group())
      |> light.spot_set_distance(12.0)
      |> light.spot_set_angle(0.75)
      |> light.spot_set_penumbra(0.2)
      |> light.spot_set_decay(1.5)
      |> light.spot_set_power(8.0)
      |> light.spot_set_shadow_camera_near_far(0.5, 60.0)
    Error(_) -> panic as "Expected spot light"
  }

  let hemisphere = case
    light.hemisphere(
      sky_color: 0xffffff,
      ground_color: 0x111111,
      intensity: 0.75,
    )
    |> light.hemisphere_from_light
  {
    Ok(light) -> light |> light.hemisphere_set_ground_color(0x333333)
    Error(_) -> panic as "Expected hemisphere light"
  }

  assert light.from_object3d(light.directional_to_object3d(directional))
    |> result.is_ok
  assert light.from_object3d(light.point_to_object3d(point)) |> result.is_ok
  assert light.from_object3d(light.spot_to_object3d(spot)) |> result.is_ok
  assert light.from_object3d(light.hemisphere_to_object3d(hemisphere))
    |> result.is_ok
}

pub fn material_scene_surface_test() {
  let basic =
    material.basic(
      material.BasicOptions(
        ..material.basic_options(),
        color: 0xffffff,
      ),
    )
    |> material.set_side(material.DoubleSide)
    |> material.set_wireframe(True)
    |> material.set_depth_write(False)
    |> material.set_fog(False)

  let physical =
    material.physical(
      material.PhysicalOptions(
        ..material.physical_options(),
        color: 0xffffff,
        metalness: 0.5,
        roughness: 0.25,
        transparent: True,
        opacity: 0.75,
        emissive: 0x111111,
        clearcoat: 0.1,
        clearcoat_roughness: 0.2,
        transmission: 0.3,
        thickness: 0.4,
        ior: 1.5,
      ),
    )
    |> material.set_roughness(0.6)
    |> material.set_metalness(0.2)
    |> material.set_emissive(0x222222)

  let normal =
    material.normal(
      material.NormalOptions(
        ..material.normal_options(),
        wireframe: False,
        flat_shading: False,
        side: material.FrontSide,
      ),
    )
    |> material.set_normal_scale(vec2.Vec2(1.0, 1.0))

  let matcap =
    material.matcap(
      material.MatcapOptions(
        ..material.matcap_options(),
        color: 0xffffff,
        matcap: option.None,
      ),
    )
    |> material.set_matcap(option.None)

  let _ =
    material.shadow(material.ShadowOptions(
      color: 0x000000,
      transparent: True,
      opacity: 0.5,
    ))

  let render_options =
    renderer.options()
    |> renderer.with_antialias(True)
    |> renderer.with_alpha(True)
    |> renderer.with_power_preference(renderer.HighPerformancePreference)

  let scene =
    scene.new()
    |> scene.set_background(scene.background_color(0x1A1A2E))
    |> scene.set_fog(scene.fog(color: 0x101820, near: 1.0, far: 10.0))
    |> scene.set_background_blurriness(0.1)
    |> scene.set_environment_intensity(1.25)

  assert render_options.antialias
  assert render_options.alpha
  assert render_options.power_preference == renderer.HighPerformancePreference
  let _ = basic
  let _ = physical
  let _ = normal
  let _ = matcap
  let _ = scene
}
