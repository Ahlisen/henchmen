///_pal_free_palettes()

pal_palette_default_clear();
ds_map_destroy(sPal_def_palettes);

for(var i = sPal_palette_number - 1; i >= 0; i--)
{
    var pal = sPal_palettes[| i];
    if pal != noone
        pal_palette_destroy( i )
}

ds_list_destroy(sPal_palettes);
ds_stack_destroy(sPal_index_stack);
