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

