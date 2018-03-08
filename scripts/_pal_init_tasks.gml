///_pal_init_tasks()

globalvar sPal_tasks, sPal_taskMap;
///List of all tasks existing
sPal_tasks = ds_list_create();
//Map<task_name, task> to update existing tasks
sPal_taskMap = ds_map_create();

//Data to track and apply modifications
globalvar sPal_modified, sPal_modifiedPalList, sPal_modifiedPalRef;
sPal_modified = false;
///List of palettes to create/update
sPal_modifiedPalList = ds_list_create();
sPal_modifiedPalRef = ds_grid_create(sPal_palette_number, 2);
