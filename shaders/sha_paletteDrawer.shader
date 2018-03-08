attribute vec3  in_Position;                  // (x,y,z)
attribute vec4  in_Colour;                    // (r,g,b,a)
attribute vec2  in_TextureCoord;              // (u,v)

varying vec2    v_vTexcoord;
varying vec2    v_vPalCoords;
varying float   v_vAlpha;
varying float   v_vTexelSize;

uniform vec2    lineSize;
uniform vec2    texel;

void PreparePalette()
{
    //image_blend's red and green colors are usef to store index of palette
    //If you sure you won't use more, than 256 palette - you can free Green color for your custom shader needs
    float index = (in_Colour.r + in_Colour.g * 255.0);
    v_vPalCoords = vec2( mod(index, lineSize.x), lineSize.y * floor(index/lineSize.x)) * texel 
        + vec2(texel.y/511.0) + vec2(in_Colour.b * texel.y * 1.0/255.0, 0.0);
    v_vAlpha = in_Colour.a;
    v_vTexelSize = texel.y;
}

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);    
    v_vTexcoord = in_TextureCoord;
    
    //Fills all varying to send to fragment shader
    PreparePalette();
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2    v_vTexcoord;
varying vec2    v_vPalCoords;
varying float   v_vAlpha;
varying float   v_vTexelSize;

uniform sampler2D indexedTexture;
uniform sampler2D palette;

void main()
{
    vec4 index = texture2D( indexedTexture, v_vTexcoord ); 
    gl_FragColor = texture2D( palette, v_vPalCoords + vec2(0.0, index.r * v_vTexelSize) );;   
    gl_FragColor.a *= v_vAlpha;
}

