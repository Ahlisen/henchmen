///pal_palette_default_clear()
//Destroys all created default palettes

var palMap = sPal_def_palettes;

var group = ds_map_find_first(palMap);
while(!is_undefined(group))
{
    pal_palette_destroy(palMap[? group])
    group = ds_map_find_next(palMap, group);
}

ds_map_clear(sPal_def_palettes);
