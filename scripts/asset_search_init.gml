///asset_search_init()

globalvar asset_map;
asset_map = _asset_search_new_grid();
ds_grid_clear(asset_map, noone);

var srf = surface_create(1,1);
var spr_count = sprite_create_from_surface(srf, 0, 0, 1, 1, 0, 0, 0, 0)
var back_count = background_create_colour(1,1,c_black);
surface_free(srf);
sprite_delete(spr_count);
background_delete(back_count);

for(var i = 0; i < spr_count; i++)
{
    if sprite_exists(i)
        _asset_search_add( sprite_get_name(i), asset_sprite, i)
}

for(var i = 0; i < back_count; i++)
{
    if background_exists(i)
        _asset_search_add( background_get_name(i), asset_background, i)
}

