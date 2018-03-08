///pal_map_get_palettes( group/sprite_index[, index] ): ds_list<palette_sprite_index>
//Returns all palettes used for mapping provided tag/sprite
//If 2nd argument is provided - it will return palette with specified index, starting from 0

var group = _pal_get_group(argument[0]);
if group = undefined
    exit;
    

var list = _pal_map_get(sPal_map_group2palettes, group);
    
if argument_count >= 2
{
    var item = ds_list_find_value(list, argument[1]);
    if !is_undefined(item)
        return item;
    return noone;
}

return list;
