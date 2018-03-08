///_pal_init_surface( desired_palette_number, palette_width, palette_height, isUpdate )
//Inits shared surface that will store all used palettes
//This one is also used when reconfigurating surface to allows more palettes in runtime

//Getting size of texture you need to store all this stuff
//Argument is total number of pixels desired
var size = 1 << math_texture_power(argument0 * argument1 * argument2);
globalvar sPal_surface, sPal_line, sPal_surface_size, sPal_palette_number;

//Number of palettes in the line. It's not always equal to the surface size since both palette lines must be on the same horizontal line
sPal_line = (size div argument1);
sPal_surface_size = size;

globalvar sPal_palette_width, sPal_palette_height, sPal_palette_number;
sPal_palette_width = argument1;
sPal_palette_height = argument2;
//Number of palettes you can actually fit on that surface
sPal_palette_number = sPal_line * (size div argument2);

globalvar sPal_shader_width, sPal_shader_height, sPal_shader_texel;
//Normalized with on texture to be used in the shader
sPal_shader_texel[1] = 255/ size;
sPal_shader_texel[0] = sPal_shader_texel[1] * argument1;
sPal_shader_width = (sPal_line/255);
sPal_shader_height = (sPal_palette_height/255);

if argument3
{
    if size = sPal_surface_size
        _pal_surface_recreate(false)
}
else
{
    sPal_surface = noone;
    _pal_surface_recreate(false)
}
