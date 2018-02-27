///_pal_layout_update( group, palette_sprite_index )
//Creates a new layout for group or update existing one

var la = _pal_map_get(sPal_map_group2layout, argument0);
if is_undefined(la)
{
    la = pal_layout_begin(argument0);
    _pal_map_set(sPal_map_group2layout, argument0, la);
}
else
    _pal_layout_continue(la);
    
la[| sPal_layout_currentTag] = sPal_tag;

pal_layout_slot_auto(argument1);
