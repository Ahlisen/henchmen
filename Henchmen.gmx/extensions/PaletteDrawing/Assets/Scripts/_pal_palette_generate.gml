#define _pal_palette_generate
///_pal_palette_generate( group, placeholder_sprite, starting_index )

var group_sprites = _pal_map_get(sPal_map_group2sprites, argument0);
var group_backs = _pal_map_get(sPal_map_group2backgrounds, argument0);
if (is_undefined(group_sprites) || ds_list_empty(group_sprites)) && (is_undefined(group_backs) || ds_list_empty(group_backs))
{
    show_debug_message('No images found for group '+argument0)
    exit;
}

var colorIndex = 0;
var colorMap = ds_map_create();
var colorIndexes = ds_list_create();

var isSprite = true;
repeat(2)
{
    var list = ifelse(isSprite, group_sprites, group_backs);
    var buffers;
    if (!is_undefined(list))
    for(var i = 0; i < ds_list_size(list); i++)
    {
        if isSprite
            buffers = _pal_sprite_getColorArray(list[| i]);
        else
            buffers = _pal_background_getColorArray(list[| i]);
        for(var j = 0; j < array_length_1d(buffers); j++)
        {
            var r,g,b,a;
            var buf = buffers[j];
            buffer_seek(buf, buffer_seek_start, 0);
            repeat(buffer_get_size(buf)/4)
            {
                var b = buffer_read(buf, buffer_u8);
                var g = buffer_read(buf, buffer_u8);
                var r = buffer_read(buf, buffer_u8);
                var a = buffer_read(buf, buffer_u8);
                if a > 32
                {
                    var clr = make_color_rgba(r,g,b,a);               
                    if !ds_map_exists(colorMap, clr)
                    {
                        var ind = colorIndex++;
                        colorMap[? clr] = ind;
                        colorIndexes[| ind] = clr;
                    }
                }
            }
            buffer_delete(buffers[j]);
        }
    }
    isSprite = !isSprite;
}

var size = ds_list_size(colorIndexes);
var srf = surface_create(1, size);
surface_set_target(srf);
d3d_set_projection_ortho(0, 0, 1, size, 0);
    draw_clear_alpha(c_black, 0);
    for(var i = 0; i < size; i++)
    {
        var rgba = colorIndexes[| i];
        draw_sprite_ext(spr_pixel, 0, 0, i, 1, 1, 0, colour_rgba_to_rgb(rgba), colour_get_alpha(rgba));
    }
surface_reset_target();

var spr = sprite_create_from_surface(srf, 0, 0, 1, size, 0, 0, 0, argument2);
surface_free(srf);
sprite_assign(argument1, spr);
sprite_delete(spr);

ds_map_destroy(colorMap);
ds_list_destroy(colorIndexes);

#define _pal_sprite_getColorArray
///_pal_sprite_getColorArray( sprite_index ): array[buffer]

var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);
var srf = surface_create(width, height);
var xoff = sprite_get_xoffset(argument0);
var yoff = sprite_get_yoffset(argument0);
var count = sprite_get_number(argument0);

var result;
result[count - 1] = 0;

for(var i = 0; i < count; i++)
{
    surface_set_target(srf);
        draw_clear_alpha(c_black, 0);
        d3d_set_projection_ortho(0, 0, width, height, 0);
        draw_sprite(argument0, i, xoff, yoff);   
    surface_reset_target();
    
    var buf = buffer_create(4*width*height, buffer_fast, 1);
    buffer_get_surface(buf, srf, 0, 0, 0);
    result[i] = buf;
}
surface_free(srf);

return result;

#define _pal_background_getColorArray
///_pal_background_getColorArray( background_index ): array[buffer]

var width = background_get_width(argument0);
var height = background_get_height(argument0);
var srf = surface_create(width, height);

var result;

surface_set_target(srf);
    draw_clear_alpha(c_black, 0);
    d3d_set_projection_ortho(0, 0, width, height, 0);
    draw_background(argument0, 0, 0);   
surface_reset_target();

var buf = buffer_create(4*width*height, buffer_fast, 1);
buffer_get_surface(buf, srf, 0, 0, 0);
result[0] = buf;
surface_free(srf);

return result;