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
