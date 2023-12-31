//
//  RosyEffect.swift
//  MetalCamera
//
//  Created by Erick Ribeiro on 16/11/23.
//  Copyright © 2023 GS. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

// Compute kernel
kernel void rosyEffect(texture2d<half, access::read>  inputTexture  [[ texture(0) ]],
                       texture2d<half, access::write> outputTexture [[ texture(1) ]],
                       uint2 gid [[thread_position_in_grid]])
{
    // Don't read or write outside of the texture.
    if ((gid.x >= inputTexture.get_width()) || (gid.y >= inputTexture.get_height())) {
        return;
    }
    
    half4 inputColor = inputTexture.read(gid);
    
    // Set the output color to the input color, excluding the green component.
    half4 outputColor = half4(inputColor.r, 0.0, inputColor.b, 1.0);
    
    outputTexture.write(outputColor, gid);
}
