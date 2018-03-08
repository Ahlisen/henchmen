attribute vec3  in_Position;                  // (x,y,z)
attribute vec4  in_Colour;                    // (r,g,b,a)
attribute vec2  in_TextureCoord;              // (u,v)

varying vec2    v_vTexcoord;
varying vec2    v_vPalCoords;
varying float   v_vAlpha;
varying vec2    v_vTexelSize;
varying float   v_vSubpalette;

uniform vec2    lineSize;
uniform vec2    texel;

void PreparePalette()
{
    float index = (in_Colour.r + in_Colour.g * 255.0);
    v_vPalCoords = vec2( mod(index, lineSize.x), lineSize.y * floor(index/lineSize.x)) * texel + vec2(texel.y/511.0);
    v_vAlpha = in_Colour.a;
    v_vTexelSize = vec2(texel.y / 256.0, texel.y);
    v_vSubpalette = in_Colour.b;
}

//<custom>
uniform vec4    viewSize;
varying vec2    v_vPosition;
//</custom>

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);    
    v_vTexcoord = in_TextureCoord;
        
    PreparePalette();
    
    //<custom>
    v_vPosition = (in_Position.xy - viewSize.xy) * viewSize.zw;
    //</custom>
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2    v_vTexcoord;
varying vec2    v_vPalCoords;
varying float   v_vAlpha;
varying vec2    v_vTexelSize;
varying float   v_vSubpalette;

uniform sampler2D indexedTexture;
uniform sampler2D palette;

//<custom>
uniform sampler2D   pattern;
varying vec2        v_vPosition;
//</custom>

vec4 GetPaletteColor( float subIndex )
{
    vec4 index = texture2D( indexedTexture, v_vTexcoord );  
    return texture2D( palette, v_vPalCoords + vec2(subIndex, index.r) * v_vTexelSize );
}

void main()
{    
    //Reading main color as usual
    gl_FragColor = GetPaletteColor(v_vSubpalette);
    
    //Actually, it will be better not to use it this way, since it reads indexedTexture every time, and you don't need it
    //But I'll make it like this so it will look easier
    //Reading image_index = 1 of palettes. You need at least 2-width palettes for this though.
    vec4 info = GetPaletteColor( 1.0 );
    //If there was a color defined, then...

    //Take pattern texture and blend it with original color
    vec4 pat = texture2D( pattern, v_vPosition );
    gl_FragColor.rgb = mix(gl_FragColor.rgb, info.rgb, pat.a * info.a);
    
    gl_FragColor.a *= v_vAlpha;
}

