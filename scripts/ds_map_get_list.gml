///ds_map_get_list( id, key )
//Returns value from ds_map. 
//If not exists - creates a ds_list, puts it at that position and returns it

var list = argument0[? argument1];
if is_undefined(list)
{
    list = ds_list_create();
    argument0[? argument1] = list;
}

return list;
