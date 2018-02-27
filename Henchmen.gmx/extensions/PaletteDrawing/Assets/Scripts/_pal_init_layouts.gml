///_pal_init_layouts()

globalvar sPal_layouts_map, sPal_layouts_list;
//map<layout_name, layout>
sPal_layouts_map = ds_map_create();
//List of all layouts created. Cause not all of them are in the map
sPal_layouts_list = ds_list_create();

globalvar sPal_layout_creating;
//Layout currently beeing created
sPal_layout_creating = noone;
