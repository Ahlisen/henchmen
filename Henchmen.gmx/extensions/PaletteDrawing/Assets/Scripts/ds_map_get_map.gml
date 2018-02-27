///ds_map_get_map( id, key )
//Returns value from ds_map. 
//If not exists - creates a ds_map, puts it at that position and returns it

var map = argument0[? argument1];
if is_undefined(map)
{
    map = ds_map_create();
    argument0[? argument1] = map;
}

return map;
