///_pal_palette_update( palette_object )

var palette = argument0;

if palette[| sPal_palette_changed] || !surface_exists(palette[| sPal_palette_surface])
{
    if (surface_exists(palette[| sPal_palette_surface]))
        surface_free(palette[| sPal_palette_surface]);
    palette[| sPal_palette_surface] = _pal_group_make_surface_palette( palette, palette[| sPal_palette_changed] );
    palette[| sPal_palette_changed] = false;
}
