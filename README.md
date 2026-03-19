# Savoiardi

[![Package Version](https://img.shields.io/hexpm/v/savoiardi)](https://hex.pm/packages/savoiardi)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/savoiardi/)

Type-safe [Three.js](https://threejs.org/) bindings for Gleam, part of the [tiramisu](https://github.com/renatillas/tiramisu) game engine ecosystem.

## Installation

```sh
gleam add savoiardi
```

## Quick Start

```gleam
import savoiardi/camera
import savoiardi/geometry
import gleam/option
import savoiardi/material
import savoiardi/object
import savoiardi/renderer
import savoiardi/scene
import vec/vec3

pub fn main() {
  let renderer_options =
    renderer.options()
    |> renderer.with_antialias(True)
    |> renderer.with_alpha(False)

  let webgl_renderer = renderer.new(renderer_options)
  renderer.set_size(webgl_renderer, 1280, 720)

  let main_scene =
    scene.new()
    |> scene.set_background(scene.background_color(0x1a1a2e))

  let camera = camera.perspective(
    fov: 75.0,
    aspect: 16.0 /. 9.0,
    near: 0.1,
    far: 1000.0,
  )

  let geometry = geometry.box(1.0, 1.0, 1.0)
  let material =
    material.basic(
      material.BasicOptions(
        ..material.basic_options(),
        color: 0xff0000,
        color_map: option.None,
      ),
    )

  let cube =
    object.mesh(geometry, material)
    |> object.set_position(vec3.Vec3(0.0, 0.0, -5.0))

  object.add_child(
    parent: scene.to_object3d(main_scene),
    child: cube,
  )

  renderer.render(
    webgl_renderer,
    main_scene,
    camera.from_perspective(camera),
  )
}
```

## Features

- **Typed Core Modules** - Singular domain modules for scene, renderer, camera, object, geometry, material, light, texture, loader, and error handling
- **Scene & Renderer** - Typed renderer options, scene backgrounds, fog, and WebGL rendering
- **Cameras** - Perspective and orthographic cameras with typed downcasts and projection updates
- **Objects** - Groups, meshes, transforms, naming, cloning, property lookup, and scene graph composition
- **Geometries** - Box, sphere, cone, plane, cylinder, torus, capsule, text, and STL geometry support
- **3D Text** - `FontLoader` and `TextGeometry` bindings for mesh-based text
- **Materials** - Option-based constructors for basic, standard, physical, phong, lambert, toon, normal, matcap, and shadow materials
- **Lights** - Ambient, directional, point, spot, and hemisphere lights
- **Textures** - Texture loading plus color-space assignment for rendered assets
- **Model Loading** - GLTF, FBX, OBJ, and STL loading helpers that return `Result(_, LoadError)` with typed variants for empty URLs, invalid URLs, HTTP failures, parse failures, and generic load failures
- **Color Values** - Hex color ints across the public API, with room to pair them with external colour packages when needed


## Related Packages

- [vec](https://hexdocs.pm/vec) - Vector mathematics
- [quaterni](https://hexdocs.pm/quaterni) - Quaternion rotations
- [tiramisu](https://github.com/renatillas/tiramisu) - Full game engine

## Documentation

Full API documentation available at [HexDocs](https://hexdocs.pm/savoiardi).
