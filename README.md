# nvcloth.js

NvCloth 1.1.6 (d243404d4ba88bcf53f7310cc8980b4efe38c19f) compiled by Emscripten SDK.

NvCloth is a library that provides low level access to a cloth solver designed for realtime interactive applications.

Features:

* Fast and robust cloth simulation suitable for games
* Collision detection and response suitable for animated characters
* Low level interface with little overhead and easy integration

## Requirement

1. *nix System
2. Cmake
3. [emsdk](https://emscripten.org)

## Usage

Following the instruction to [install emsk](https://emscripten.org/docs/getting_started/downloads.html) (the default
location is in $HOME)

The repo provides simple shell script to compile the wasm and glue Javascript files:

```shell
./build.sh
```

You can modify build.sh to set the number of CPU cores used when compiling and different compile target, including:

1. Release(default, the smallest size)
2. Profile
3. Checked
4. Debug

After finish running build.sh, there will be a folder call wasm_build which including wasm binary files and JavaScript
code used to import the wasm files into the browsers. For convenience, there will also be a link to the binding code in
the folder, you can modify the code as you wish and re-run build.sh to generate the new wasm related files.

## Documentation

See ./NvCloth/ReleaseNotes.txt for changes and platform support. See ./NvCloth/docs/documentation/index.html for the
release notes, API users guide and compiling instructions. See ./NvCloth/docs/doxy/index.html for the api documentation.

## PhysX / PxShared compatibility

Note that 1.1.6 is compatible with the same version of PxShared shipped with PhysX 4.0. You can
use [physX.js](https://github.com/oasis-engine/physX.js) with it. **But it needs to be emphasized that the methods used by
PhysX and NvCloth are completely different. PhysX is based on the impulse-based method, but NvCloth is based on the
Position-based method (PBD).**

## Detailed explanation

You can ignore this part when you first use this repo and look at it when you need to modify the building system for
your own needs. And you can also use this information to build other C++ projects like bullet and box2d.

Emscripten SDK provide a lot of tools to compile C++ code into wasm. In this repo, we will mainly use Embind, emcmake
and emmake. The compiling process is separated into several steps:

1. Based on the Linux cmake, use  'emcmake cmake' to replace 'cmake' and generated Makefile, which you can find in
   NvCloth/GenerateProjectsWASM.sh. If the location of emsdk is not in $HOME, you have to modify '
   -DCMAKE_TOOLCHAIN_FILE' to the Emscripten.cmake in you computer.
2. After generated the Makefile by using cmake, you can call 'emmake make' to compile the NvCloth source code into
   static libraries.
3. The most important steps is to write PxWebBindings.cpp, which will be compiled by using em++ and linked the static
   libraries. After that the wasm and JavaScript glue code will be generated according to the compile flag.(-O3 will
   compress the wasm binary and delete the blank in the glue files.)