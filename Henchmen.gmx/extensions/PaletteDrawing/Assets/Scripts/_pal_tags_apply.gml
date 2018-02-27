///_pal_tags_apply( group )

var map = _pal_map_get(sPal_map_group2tag);
if !ds_map_exists(map, argument0)
    _pal_map_set(sPal_map_group2tag, argument0, sPal_tag);
var tags = ds_map_get_list(_pal_map_get( sPal_map_tag2groups ), sPal_tag);

if ds_list_find_index(tags, argument0) < 0
    ds_list_add(tags, argument0)
