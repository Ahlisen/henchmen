///_pal_palettes_recreate()

var list = sPal_palettes;
var modList = sPal_modifiedPalList;
for(var i = 0; i < ds_list_size(list); i++)
{
    if list[| i] != noone
        ds_list_add(modList, sPal_palettes[| i]);
}
