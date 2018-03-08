///_pal_map_get( sPal_map_*[, key] )

var map = ds_list_find_value(sPal_maps, argument[0]);
if argument_count = 1
    return map;
    
return ds_map_find_value(map, argument[1]);
