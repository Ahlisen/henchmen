///pal_map_palette( group, slot_name, palette_sprite_index )
//Puts palette to the provided group

var group2pal = _pal_map_get( sPal_map_group2palettes);
var group2slots = _pal_map_get( sPal_map_group2slots);

var list_pal = group2pal[? argument0];
var map_slot = group2slots[? argument0];
if list_pal = undefined
{
    list_pal = ds_list_create();
    map_slot = ds_map_create();
    group2pal[? argument0] = list_pal;
    group2slots[? argument0] = map_slot;
}

var slotname = _pal_get_slotname(argument1, sPal_tag)
ds_list_add(list_pal, argument2);
map_slot[? slotname] = argument2;

_pal_map_set(sPal_map_palette2slot, argument2, slotname);
_pal_map_set(sPal_map_palette2group, argument2, argument0);

_pal_tags_apply( argument0 );
_pal_task_create( sPal_taskType_map, argument0 );
_pal_layout_update(argument0, argument2 );
