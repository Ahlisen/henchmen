///pal_layout_begin([name])
//Begins a new layout

//Layout itself
sPal_layout_creating = _pal_layout_create();

//Adding layouts to global lists
ds_list_add(sPal_layouts_list, sPal_layout_creating);
if argument_count >= 1
{
    ds_map_add(sPal_layouts_map, argument[0], sPal_layout_creating);
    sPal_layout_creating[| sPal_layout_name] = argument[0];
} 

//Applying task that will set proper sizes to layout
var task = _pal_task_create(sPal_taskType_layout, sPal_layout_creating);
task[| sPal_task_layout_id] = sPal_layout_creating;

return sPal_layout_creating;
