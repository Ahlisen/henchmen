///pal_map_background( group, background_index[, background_index, ... ])
//Group must be a string

var group = argument[0];
var group2backs = _pal_map_get( sPal_map_group2backgrounds );

var list = ds_map_get_list(group2backs, group);

var back2group = _pal_map_get( sPal_map_background2group );
for(var i = 1; i < argument_count; i++)
{
    var back = argument[i];
    ds_list_add(list, back);
    back2group[? back] = group;
    _pal_map_set(sPal_map_group2sprites, group, ds_list_create())
}

_pal_tags_apply( group );
_pal_task_create( sPal_taskType_map, group );
