///_pal_init_drawing()

globalvar sPal_drawing_texture;
//Current texture used for drawing. Used to switch indexed pages
sPal_drawing_texture = noone;

globalvar sPal_tile_pals;
sPal_tile_pals = ds_list_create();
