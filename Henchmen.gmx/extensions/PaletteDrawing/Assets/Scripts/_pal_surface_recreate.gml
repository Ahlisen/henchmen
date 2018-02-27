///_pal_surface_recreate( update_palettes )

if surface_exists(sPal_surface)
    surface_free(sPal_surface)
sPal_surface = surface_create(sPal_surface_size, sPal_surface_size);

surface_set_target(sPal_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();

sPal_drawing_texture = noone;

if argument0
    _pal_palettes_recreate();

sPal_modified = true;
