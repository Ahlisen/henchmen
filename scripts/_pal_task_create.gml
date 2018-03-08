///_pal_task_create( task_type, group ): task_index

var task_name = string(argument0)+"_"+string(argument1);
var task = sPal_taskMap[? task_name];
//If similiar task does not exists - make a new one
if task = undefined
{
    var task = ds_list_create();
    task[| sPal_task_type] = argument0;
    task[| sPal_task_group] = argument1;
    
    ds_list_add(sPal_tasks, task);
    ds_map_add(sPal_taskMap, task_name, task)
    sPal_modified = true;
}

return task;
