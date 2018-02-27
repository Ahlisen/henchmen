///pal_map_sprite( group, sprite_index[, sprite_index, ... ])
//Group must be a string

var group = argument[0];
var group2sprites = _pal_map_get( sPal_map_group2sprites );

var list = group2sprites[? group];
if list = undefined
{
    list = ds_list_create();
    group2sprites[? group] = list;
    _pal_map_set(sPal_map_group2backgrounds, group, ds_list_create())
}

var sprite2group = _pal_map_get( sPal_map_sprite2group );
for(var i = 1; i < argument_count; i++)
{
    var spr = argument[i];
    ds_list_add(list, spr);
    sprite2group[? spr] = group;
}

_pal_tags_apply( group );
_pal_task_create( sPal_taskType_map, group );
