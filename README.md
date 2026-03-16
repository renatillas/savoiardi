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
import savoiardi
import gleam/option

pub fn main() {
  let renderer = savoiardi.create_renderer(antialias: True, alpha: False)
  savoiardi.set_renderer_size(renderer, 1280, 720)

  let scene = savoiardi.create_scene()
    |> savoiardi.set_scene_background_color(0x1a1a2e)

  let camera = savoiardi.create_perspective_camera(
    fov: 75.0,
    aspect: 16.0 /. 9.0,
    near: 0.1,
    far: 1000.0,
  )

  let geometry = savoiardi.create_box_geometry(1.0, 1.0, 1.0)
  let material =
    savoiardi.create_basic_material(
      color: 0xff0000,
      transparent: False,
      opacity: 1.0,
      map: option.None,
      side: savoiardi.FrontSide,
      alpha_test: 0.0,
      depth_write: True,
    )
  let cube = savoiardi.create_mesh(geometry)
  savoiardi.set_object_material(cube, material)
  savoiardi.set_object_position(cube, #(0.0, 0.0, -5.0))

  savoiardi.add_child(
    parent: savoiardi.scene_to_object3d(scene),
    child: cube,
  )
  savoiardi.render(renderer, scene, camera)
}
```

## Features

- **Scene & Renderer** - Scene creation, background control, fog, and WebGL rendering
- **Cameras** - Perspective and orthographic cameras with projection updates
- **Objects** - Groups, meshes, transforms, naming, visibility, and scene graph composition
- **Geometries** - Box, sphere, cone, plane, cylinder, torus, and STL geometry support
- **Materials** - Basic, standard, phong, lambert, and toon materials
- **Lights** - Ambient, directional, point, spot, and hemisphere lights
- **Textures** - Texture loading plus color-space assignment for rendered assets
- **Model Loading** - GLTF, FBX, OBJ, and STL loading helpers
- **Material/Object Updates** - Swap geometry/materials and update material side or wireframe state

## Related Packages

- [vec](https://hexdocs.pm/vec) - Vector mathematics
- [quaterni](https://hexdocs.pm/quaterni) - Quaternion rotations
- [tiramisu](https://github.com/renatillas/tiramisu) - Full game engine

## Documentation

Full API documentation available at [HexDocs](https://hexdocs.pm/savoiardi).
