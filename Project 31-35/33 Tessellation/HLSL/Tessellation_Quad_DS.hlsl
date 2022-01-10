#include "Tessellation.hlsli"

[domain("quad")]
float4 DS(QuadPatchTess patchTess,
    float2 uv : SV_DomainLocation,
    const OutputPatch<HullOut, 4> quad) : SV_POSITION
{
    // 双线性插值
    float3 v1 = lerp(quad[0].PosL, quad[1].PosL, uv.x);
    float3 v2 = lerp(quad[2].PosL, quad[3].PosL, uv.x);
    float3 p = lerp(v1, v2, uv.y);
    
    return float4(p, 1.0f);
}
