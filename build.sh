#!/bin/bash

cd ./NvCloth
./GenerateProjectsWASM.sh

cd ./compiler/emscripten64-release-cmake
emmake make -j4 #thread number

cd ../../../
mkdir wasm_build
cd wasm_build
ln -sf ../NvCloth/src/PxWebBindings.cpp .
cp ../NvCloth/bin/emscripten64-cmake/nvcloth.release.js . 
cp ../NvCloth/bin/emscripten64-cmake/nvcloth.release.wasm .
