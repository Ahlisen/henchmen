///_pal_free_mapping()

ds_nested_destroy(_pal_map_get(sPal_map_group2backgrounds), ds_type_map, ds_type_list );
ds_nested_destroy(_pal_map_get(sPal_map_group2sprites), ds_type_map, ds_type_list );
ds_nested_destroy(_pal_map_get(sPal_map_group2palettes), ds_type_map, ds_type_list );
ds_nested_destroy(_pal_map_get(sPal_map_group2slots), ds_type_map, ds_type_map );
ds_nested_destroy(_pal_map_get(sPal_map_tag2groups), ds_type_map, ds_type_list );

for(var i = ds_list_size(sPal_maps)-1; i>=0; i--)
{
    var map = sPal_maps[| i];
    if ds_exists(map, ds_type_map)
        ds_map_destroy(map);
}
ds_list_destroy(sPal_maps);
 
