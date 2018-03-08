///pal_palette_group( group )
//By default, when filling layouts with palettes system fills only slots defined in group, mapped to it
//But using this function you can force some other tag to layout, which allows you to map slots with palettes from different group

//This is useful when you have common layouts for multiple different sprites and want to fill slots for different groups as well.
//For example, it's used when you have shared layout for characters and weapons.

sPal_palette_sel[| sPal_palette_group_mapping] = _pal_get_group( argument0 );
