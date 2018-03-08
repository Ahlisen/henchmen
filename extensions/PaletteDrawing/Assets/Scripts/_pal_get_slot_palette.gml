///_pal_get_slot_palette(slot/sprite_index, palette_object)
//Returns argument if it is a string or slot of palette is it is a number

if is_string(argument0)
    return _pal_get_slotname( argument0, _pal_map_get(sPal_map_group2tag, argument1[| sPal_palette_group_mapping]));
else
    return  _pal_map_get(sPal_map_palette2slot, argument0);
