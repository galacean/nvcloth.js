//
// Created by 杨丰 on 2022/3/11.
//

#include <emscripten.h>
#include <emscripten/bind.h>
#include <NvCloth/Cloth.h>

using namespace physx;
using namespace emscripten;

//----------------------------------------------------------------------------------------------------------------------
EMSCRIPTEN_BINDINGS(physx) {
// Define PxsetCMassLocalPoseec3, PxQuat and PxTransform as value objects to allow sumerian Vector3
// and Quaternion to be used directly without the need to free the memory
    value_object<PxVec3>("PxVec3")
            .field("x", &PxVec3::x)
            .field("y", &PxVec3::y)
            .field("z", &PxVec3::z);
}