#define asset_search_init
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

#define _asset_search_add
///_asset_search_add( asset_name, asset_type, asset_index )

var _grid = asset_map;
var cnt = string_length(argument0);
for(var i = 0; i < cnt; i++)
{
    var byte = string_byte_at(argument0, i) - asearch_char_first;
    if (_grid[# byte, asearch_node_subnodes] = noone)
    {
        _grid[# byte, asearch_node_subnodes] = _asset_search_new_grid();
        _grid[# byte, asearch_node_assets_type] = ds_list_create();
        _grid[# byte, asearch_node_assets_index] = ds_list_create();
    }
        
    ds_list_add(_grid[# byte, asearch_node_assets_type], argument1);
    ds_list_add(_grid[# byte, asearch_node_assets_index], argument2);
    
    _grid = _grid[# byte, asearch_node_subnodes];
}

#define _asset_search_new_grid
///_asset_search_new_grid()

var _grid = ds_grid_create(asearch_char_count, 3);
ds_grid_clear(_grid, noone);

return _grid;