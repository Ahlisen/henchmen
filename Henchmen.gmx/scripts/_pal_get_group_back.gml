///_pal_get_group_back(group/background_index)
//Returns argument if it is a string or group of sprite is it is a number

if is_string(argument0)
    return argument0;
else
    return  _pal_map_get(sPal_map_background2group, argument0);
