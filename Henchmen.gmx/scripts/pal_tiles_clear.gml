///pal_tiles_clear()
//Deletes all palettes you created using pal_tiles_parse_custom
//IT WILL NOT CLEAR DEFAULT PALETTES
//If you want to clear them as well - use pal_palette_default_clear
//It does not clear them cause there may be still references to them in the room since they are global

var list = sPal_tile_pals
for(var i = ds_list_size(list)-1; i>=0; i--)
    pal_palette_destroy( list[| i]);
