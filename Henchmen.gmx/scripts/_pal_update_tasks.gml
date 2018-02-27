///_pal_update_tasks()

var tasks = sPal_tasks;
var tasksSize = ds_list_size(tasks);
if tasksSize = 0
    exit;
    
//First - sort tasks
var task_array = 0;
for(var i = 0; i < tasksSize; i++)
{
    var task = tasks[| i];
    var task_type = task[| sPal_task_type];
    var pos = array_length_2d(task_array, task_type);
    task_array[task_type, pos] = task;
}

//Execute tasks
for(var i = 0; i < array_height_2d(task_array); i++)
for(var j = 0; j < array_length_2d(task_array, i); j++)
{
    var task = task_array[i, j];
    switch( task[| sPal_task_type])
    {
        case sPal_taskType_generate:
            _pal_palette_generate( task[| sPal_task_group], task[| sPal_task_palette_sprite], task[| sPal_task_offset] )
        break;
        
        case sPal_taskType_layout:
            _pal_layout_complete( task[| sPal_task_layout_id]);
        break;    
        
        case sPal_taskType_map:
            _pal_map_group( task[| sPal_task_group]);
        break;
    }
    _pal_task_destroy( task );
}
ds_list_clear(tasks);
ds_map_clear(sPal_taskMap);

//Update pages if changed
var key = ds_map_find_first(sPal_indexedPages);
while(!is_undefined(key))
{
    var page = sPal_indexedPages[? key];
    var srf = page[| sPal_page_surface];
    
    if srf != noone
    {
        var back_existing = page[| sPal_page_background];
        var back_new = background_create_from_surface(srf,0,0,surface_get_width(srf), surface_get_height(srf), 0, 0);
        background_assign(back_existing, back_new);
        background_delete(back_new);
        surface_free(srf);
        page[| sPal_page_surface] = noone;
    }
    key = ds_map_find_next(sPal_indexedPages, page);
}


