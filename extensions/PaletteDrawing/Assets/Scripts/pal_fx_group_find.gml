///pal_fx_group_find( group_handle, sPal_fx_type_* ): array<fx_handle>
//Return all effects of provided type in the group, or noone if nothing found
//It's not recursive, so it won't find effects from nested groups

var items = argument0[| sPal_fx_group_items];

var result = noone;
var cnt = 0;
for(var i = 0; i < ds_list_size(items); i++)
{
    var item = items[| i];
    if item[| sPal_fx_type] = argument1
        result[ cnt ++] = item;
}

return result;
