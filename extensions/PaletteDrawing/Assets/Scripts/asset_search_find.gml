///asset_search_find( name_beginning ): array[ ds_list<asset_type>, ds_list<asset_index> ]

var cnt = string_length(argument0);
var cnt_minus = cnt - 1;
var _grid = asset_map;
for(var i = 0; i < cnt; i++)
{
    var byte = string_byte_at(argument0, i) - asearch_char_first;
    if ( i < cnt_minus)
    {
        var _grid = _grid[# byte, asearch_node_subnodes];
        if (_grid = noone)
            return undefined;
    }
    else
    {
        var result;
        result[1] = _grid[# byte, asearch_node_assets_index];
        result[0] = _grid[# byte, asearch_node_assets_type];
        return result;
    }
}
