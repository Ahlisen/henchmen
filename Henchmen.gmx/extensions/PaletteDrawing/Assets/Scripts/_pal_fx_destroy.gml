///_pal_fx_destroy( fx )

switch(argument0[| sPal_fx_type])
{
    case sPal_fx_type_script:
        ds_list_destroy(argument0[| sPal_fx_script_arguments]);
        if argument0[| sPal_fx_enabled]
            _pal_tasks_changed( argument0[| sPal_fx_owner], true, -1 );
        break;
    case sPal_fx_type_group:
        var list = argument0[| sPal_fx_group_items];
        for(var i = ds_list_size(list) - 1; i >=0; i--)
            _pal_fx_destroy(list[| i]);
        ds_list_destroy(list);
        break;
    case sPal_fx_type_targets:
    if (argument0[| sPal_fx_targets] != noone)
        ds_list_destroy(argument0[| sPal_fx_targets]);
        break;
}
_pal_tasks_changed( argument0[| sPal_fx_owner], true, 0 );
ds_list_destroy(argument0);
