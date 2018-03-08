///_pal_get_slot_layout(slot/sprite_index, layout_id)
//Returns argument if it is a string or slot of palette is it is a number

if is_string(argument0)
    return _pal_get_slotname( argument0, argument1[| sPal_layout_currentTag]);
else
    return  _pal_map_get(sPal_map_palette2slot, argument0);
