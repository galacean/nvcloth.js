#!/usr/bin/env bash

export GW_DEPS_ROOT="$PWD""/../"

[ -z "$GW_DEPS_ROOT" ] && echo "GW_DEPS_ROOT not defined." && exit 1;

export PX_OUTPUT_ROOT="$PWD"
# You can enable/disable cuda support here
export USE_CUDA=0


# Generate projects here

rm -r -f compiler/emscripten64-debug-cmake/
mkdir compiler/emscripten64-debug-cmake/
cd compiler/emscripten64-debug-cmake/
emcmake cmake ../cmake/emscripten -G "Unix Makefiles" -DTARGET_BUILD_PLATFORM=emscripten -DCMAKE_BUILD_TYPE=debug -DNV_CLOTH_ENABLE_CUDA=$USE_CUDA -DPX_GENERATE_GPU_PROJECTS=0 -DPX_OUTPUT_DLL_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake -DPX_OUTPUT_LIB_DIR=$PX_OUTPUT_ROOT/lib/emscripten64-cmake -DPX_OUTPUT_EXE_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake || exit 1
cd ../../

rm -r -f compiler/emscripten64-checked-cmake/
mkdir compiler/emscripten64-checked-cmake/
cd compiler/emscripten64-checked-cmake/
emcmake cmake ../cmake/emscripten -G "Unix Makefiles" -DTARGET_BUILD_PLATFORM=emscripten -DCMAKE_BUILD_TYPE=checked -DNV_CLOTH_ENABLE_CUDA=$USE_CUDA -DPX_GENERATE_GPU_PROJECTS=0 -DPX_OUTPUT_DLL_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake -DPX_OUTPUT_LIB_DIR=$PX_OUTPUT_ROOT/lib/emscripten64-cmake -DPX_OUTPUT_EXE_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake || exit 1
cd ../../

rm -r -f compiler/emscripten64-profile-cmake/
mkdir compiler/emscripten64-profile-cmake/
cd compiler/emscripten64-profile-cmake/
emcmake cmake ../cmake/emscripten -G "Unix Makefiles" -DTARGET_BUILD_PLATFORM=emscripten -DCMAKE_BUILD_TYPE=profile -DNV_CLOTH_ENABLE_CUDA=$USE_CUDA -DPX_GENERATE_GPU_PROJECTS=0 -DPX_OUTPUT_DLL_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake -DPX_OUTPUT_LIB_DIR=$PX_OUTPUT_ROOT/lib/emscripten64-cmake -DPX_OUTPUT_EXE_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake || exit 1
cd ../../

rm -r -f compiler/emscripten64-release-cmake/
mkdir compiler/emscripten64-release-cmake/
cd compiler/emscripten64-release-cmake/
emcmake cmake ../cmake/emscripten -G "Unix Makefiles" -DTARGET_BUILD_PLATFORM=emscripten -DCMAKE_BUILD_TYPE=release -DNV_CLOTH_ENABLE_CUDA=$USE_CUDA -DPX_GENERATE_GPU_PROJECTS=0 -DPX_OUTPUT_DLL_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake -DPX_OUTPUT_LIB_DIR=$PX_OUTPUT_ROOT/lib/emscripten64-cmake -DPX_OUTPUT_EXE_DIR=$PX_OUTPUT_ROOT/bin/emscripten64-cmake || exit 1
cd ../../
