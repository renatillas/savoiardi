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
import savoiardi/cameras
import savoiardi/conversions
import savoiardi/geometries
import gleam/option
import savoiardi/materials
import savoiardi/objects
import savoiardi/renderers
import savoiardi/scenes

pub fn main() {
  let renderer = renderers.create_renderer(antialias: True, alpha: False)
  renderers.set_renderer_size(renderer, 1280, 720)

  let scene = scenes.create_scene()
    |> scenes.set_scene_background_color(0x1a1a2e)

  let camera = cameras.create_perspective_camera(
    fov: 75.0,
    aspect: 16.0 /. 9.0,
    near: 0.1,
    far: 1000.0,
  )

  let geometry = geometries.create_box_geometry(1.0, 1.0, 1.0)
  let material =
    materials.create_basic_material(
      color: 0xff0000,
      transparent: False,
      opacity: 1.0,
      color_map: option.None,
      side: materials.FrontSide,
      alpha_test: 0.0,
      depth_write: True,
    )
  let cube = objects.create_mesh(geometry)
  objects.set_object_material(cube, material)
  objects.set_object_position(cube, #(0.0, 0.0, -5.0))

  objects.add_child(
    parent: conversions.scene_to_object3d(scene),
    child: cube,
  )
  renderers.render(renderer, scene, camera)
}
```

## Features

- **Semantic Modules** - Import by Three.js domain: scenes, renderers, cameras, objects, geometries, materials, lights, textures, and conversions
- **Scene & Renderer** - Scene creation, background control, fog, and WebGL rendering
- **Cameras** - Perspective and orthographic cameras with projection updates
- **Objects** - Groups, meshes, transforms, naming, visibility, and scene graph composition
- **Geometries** - Box, sphere, cone, plane, cylinder, torus, and STL geometry support
- **3D Text** - `FontLoader` and `TextGeometry` bindings for mesh-based text
- **Materials** - Basic, standard, phong, lambert, and toon materials
- **Lights** - Ambient, directional, point, spot, and hemisphere lights
- **Textures** - Texture loading plus color-space assignment for rendered assets
- **Model Loading** - GLTF, FBX, OBJ, and STL loading helpers
- **Material/Object Updates** - Swap geometry/materials and update material side or wireframe state

## Migration Notes

- The misspelled camera function `update_orthograpic` has been renamed to `update_orthographic`.
- Shared types now live with the modules that own them, and the standalone `loaders` module has been removed.

## Related Packages

- [vec](https://hexdocs.pm/vec) - Vector mathematics
- [quaterni](https://hexdocs.pm/quaterni) - Quaternion rotations
- [tiramisu](https://github.com/renatillas/tiramisu) - Full game engine

## Documentation

Full API documentation available at [HexDocs](https://hexdocs.pm/savoiardi).
