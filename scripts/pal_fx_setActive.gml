///pal_fx_setActive( fx_handle, isActive )
//Enables/Disables effect without removing it

if (argument0[| sPal_fx_enabled] != argument1)
{
    argument0[| sPal_fx_enabled] = argument1;
        
    if argument0[| sPal_fx_type] = sPal_fx_type_script
        _pal_tasks_changed(argument0[| sPal_fx_owner], true, ifelse(argument1, 1, -1))
    else
    if argument0[| sPal_fx_type] = sPal_fx_type_group
    {
        var list = argument0[| sPal_fx_group_items];
        for(var i = ds_list_size(list) - 1; i>=0; i--)
            pal_fx_setActive( list[| i], argument1);
    }
    else
        _pal_tasks_changed(argument0[| sPal_fx_owner], true, 0)
        
    
}
