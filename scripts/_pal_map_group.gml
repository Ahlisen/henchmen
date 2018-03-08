///_pal_map_group( group )

var sprList = _pal_map_get(sPal_map_group2sprites, argument0);
var backList = _pal_map_get(sPal_map_group2backgrounds, argument0);
var sizeSpr = ds_list_size(sprList);
var sizeBack = ds_list_size(backList);
if sizeSpr = 0 && sizeBack = 0
    exit;

var srf = _pal_group_make_surface(argument0);
if srf = noone
    exit;
    
//Mapping time!
var tex = surface_get_texture(srf);
var UVs = sPal_surface_UVs;
UVs[1] = texture_get_texel_height(tex);
var offset = 1;
_pal_map_setShader(tex, UVs, offset);
for(var i = 0; i < sizeSpr; i++)
    _pal_page_draw_sprite(sprList[| i]);
for(var i = 0; i < sizeBack; i++)
    _pal_page_draw_background(backList[| i]);
shader_reset();

//We no longer need that surface
surface_free(srf)
