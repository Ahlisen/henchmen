///pal_palette_create( group/sprite_index ): palette_index
//Creates a new empty palette and returns its index
//As argument you can provide either group name or sprite_index of mapped sprite

//You need to use palette_index as image_blend value when drawing

var group = _pal_get_group(argument0);
if is_undefined(group)
    return noone;

//If you're out of indexes - reconfigurate the system to increase palette capacity
if ds_stack_empty(sPal_index_stack)
{
    show_debug_message("WARNING! Palette limit reached! Increasing maximum palette count...")
    show_debug_message("Consider changing INIT settings of the system.")
    _pal_palettes_resize();
}
    
//Getting a free index for a palette
var index = ds_stack_pop(sPal_index_stack);

//Creating a palette and adding it to the list
var palette = ds_list_create();
sPal_palettes[| index] = palette;

palette[| sPal_palette_index] = index;
palette[| sPal_palette_group] = group;
palette[| sPal_palette_group_mapping] = group;
palette[| sPal_palette_surface] = noone;
palette[| sPal_palette_slots] = ds_map_create();
palette[| sPal_palette_fx] = ds_list_create();
palette[| sPal_palette_changed] = true;
palette[| sPal_palette_baked] = ds_list_create();
palette[| sPal_palette_baked_map] = ds_map_create();

_pal_tasks_changed( palette, false, 1 );
pal_palette_select( index );

return index;
