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

