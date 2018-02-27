attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

uniform sampler2D palette_texture;
uniform float texel_height;
uniform float palette_height;
uniform vec4 palette_UVs;
uniform float start_index;

void main()
{
    vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    if (source.a == 0.0)
        discard;
    
    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    for(float i = palette_UVs.y; i < palette_UVs.w; i+=texel_height )
    {
        if (distance(source, texture2D(palette_texture, vec2(palette_UVs.x, i))) <= 0.004)
        {
            float index = (i - palette_UVs.y+start_index)/palette_height;
            gl_FragColor = vec4(index, index, index, 1.0);
            break;
        }
    }
}
