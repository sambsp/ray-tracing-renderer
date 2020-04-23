export default `

  uniform sampler2D gPosition;
  uniform sampler2D gNormal;
  uniform sampler2D gFaceNormal;
  // uniform sampler2D gAlbedo;
  uniform sampler2D gMatProps;

  void surfaceInteractionDirect(vec2 coord, inout SurfaceInteraction si) {
    vec4 positionAndMeshIndex = texture(gPosition, coord);

    si.position = positionAndMeshIndex.xyz;

    float meshIndex = positionAndMeshIndex.w;

    vec4 normalMaterialType = texture(gNormal, coord);

    si.normal = normalize(normalMaterialType.xyz);
    si.materialType = int(normalMaterialType.w);

    vec4 faceNormalAndMaterialType = texture(gFaceNormal, coord);

    si.faceNormal = normalize(texture(gFaceNormal, coord).xyz);

    si.albedo = vec3(1.0);

    vec4 matProps = texture(gMatProps, coord);
    si.roughness = matProps.x;
    si.metalness = matProps.y;

    si.hit = meshIndex > 0.0 ? true : false;
  }
`;
