///_pal_free_tasks()

ds_foreach(sPal_tasks, ds_type_list, false, _pal_task_destroy );
ds_list_destroy( sPal_tasks );
ds_map_destroy( sPal_taskMap );

ds_list_destroy(sPal_modifiedPalList);
ds_grid_destroy(sPal_modifiedPalRef);
