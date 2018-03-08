///_pal_map_action_getGroups( group/tag, isTag ): array[groups]

var groups = 0;
if argument1
{
    var group_list = _pal_map_get(sPal_map_tag2groups, argument0);
    for(var i = ds_list_size(group_list) - 1; i >=0; i--)
        groups[i] = group_list[| i];
        
    
}
else
{
    groups[0] = _pal_get_group(argument0);
}

return groups;
