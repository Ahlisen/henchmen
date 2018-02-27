///pal_fx_clear()
//Removes all applied effects

var list = sPal_palette_sel[| sPal_palette_fx];
for(var i = 0; i < ds_list_size(list); i++)
    _pal_fx_destroy(list[| i])
ds_list_clear(list)
