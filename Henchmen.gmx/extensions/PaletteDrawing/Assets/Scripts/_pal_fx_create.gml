///_pal_fx_create( type )

var list = ds_list_create();
list[| sPal_fx_owner] = sPal_palette_sel;
list[| sPal_fx_enabled] = true;
list[| sPal_fx_type] = argument0;

switch(argument0)
{
    case sPal_fx_type_group:
        list[| sPal_fx_group_items] = ds_list_create();
        break;
}

if sPal_fx_group_level = -1
{
    ds_list_add(sPal_palette_sel[| sPal_palette_fx], list);
    list[| sPal_fx_owner_list] = sPal_palette_sel[| sPal_palette_fx];
}
else
{
    ds_list_add(sPal_fx_groups[ sPal_fx_group_level, 0], list);
    list[| sPal_fx_owner_list] = sPal_fx_groups[ sPal_fx_group_level, 0];
}

_pal_tasks_changed( sPal_palette_sel, argument0 = sPal_fx_type_script, 1 );
return list;
