//
//  rgba2bgraKernel.metal
//  MetalCamera
//
//  Created by Greg on 01/09/2019.
//  Copyright © 2019 GS. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void rgba2bgraKernel(texture2d<float, access::read> inTexture [[ texture(0) ]],
                            texture2d<float, access::write> outTexture [[ texture(1) ]],
                            uint2 gid [[ thread_position_in_grid ]]) {
    float4 originalColor = inTexture.read(gid);
    float4 finalColor = originalColor.bgra;
    outTexture.write(finalColor, gid);
}
