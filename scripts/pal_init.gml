///pal_init( [palette_width = 1, palette_height = 128, start_capacity = 128] )
/*
Inits system. Call this on game start

palette_width
    How many lines there are in one palette. Allows you to store additional information in shared palette.
    For example, you can use it to store specular map as second line. Or other info for your custom shaders.
    
palette_height
    Maximum number of colors you can store in one palette. By default it's 128, and maximum is 256.
    Though, it's a bit overkill. You may want to go lower to decrease VRAM usage if you're using multi-line palettes.
    I think 64 is a good number
    
start_capacity
    A total number of palettes you can have active at the same time. By default it's 128
    If you use more palattes than this number - it will get increased automatically.
    Though, this is slow, so you better set this up so it won't get changed later.
    
With all default settings, shared palette will be 128x128 surface.
*/

//You can't use texture interpolation with this system, so I force it
texture_set_interpolation( false )

//For compatibility with older GM version. 
//When using this system on those versions, you MUST have texture page's crooping option set to Off. Or else everyhing will look wrong
globalvar sPal_compatibilityMode;
var UVs = sprite_get_uvs(0, 0);
sPal_compatibilityMode = array_length_1d(UVs) <= 4;

//All right. It's time to init everything
var palette_width = 1;
var palette_height = 128;
var capacity = 128;
if argument_count >= 1
{
    palette_width = argument[0];
    if argument_count >= 2
    {
        palette_height = argument[1];
        if argument_count >= 3
            capacity = argument[2];
    }
}

_pal_init_shaders();
_pal_init_surface(capacity, palette_width, palette_height, false);
_pal_init_palettes( false );
_pal_init_mapping();
_pal_init_pages();
_pal_init_drawing();
_pal_init_layouts();
_pal_init_generation();
_pal_init_tasks();
_pal_init_fx();
