///pal_palette_slot( line_index [, slot ])
//Changes line index of palette in specific slot. Line can be a float value
//If slot is not provided - it will change line of first image found (useful for 1-image palettes)
//Be careful with that. First image found is not necessary first palette you mapped

var pal = sPal_palette_sel;
var slot;
if argument_count >= 2
    slot = _pal_get_slot_palette(argument[1], pal);
else
{
    var group = pal[| sPal_palette_group_mapping];
    var slots = _pal_map_get(sPal_map_group2slots, group);
    var spr = slots[? ds_map_find_first(slots)];
    slot = _pal_get_slot_palette(spr, pal);
}
    

var palSlotInfo = ds_map_get_list(pal[| sPal_palette_slots], slot);   
var changed = palSlotInfo[| sPal_palette_slot_group] != pal[| sPal_palette_group_mapping];
palSlotInfo[| sPal_palette_slot_group] = pal[| sPal_palette_group_mapping];
palSlotInfo[| sPal_palette_slot_line] = argument[0];
palSlotInfo[| sPal_palette_slot_name] = slot;

if changed
    pal[| sPal_palette_changed] = true;
else
{
    var baked = ds_map_find_value(pal[| sPal_palette_baked_map], slot);
    if is_undefined(baked)
        pal[| sPal_palette_changed] = true;
    else
    {
        if surface_exists(pal[| sPal_palette_surface])
        {
            surface_free(pal[| sPal_palette_surface])
            pal[| sPal_palette_surface] = noone;
        }
        baked[| sPal_palBaked_line] = argument[0];
    }
}

_pal_tasks_changed( pal, false, 1 );
