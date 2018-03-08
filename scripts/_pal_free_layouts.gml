///_pal_free_layouts()

ds_foreach(sPal_layouts_list, ds_type_list, false, pal_layout_destroy );
ds_list_destroy(sPal_layouts_list)
ds_map_destroy(sPal_layouts_map)
