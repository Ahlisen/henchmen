///_pal_update_palettes()

var modList = sPal_modifiedPalList;
var modList_size = ds_list_size(modList);
if modList_size = 0 
{
    sPal_modified = false;
    exit;
}

texture_set_interpolation(1)
//Updating palette's surfaces
for(var i = 0; i < modList_size; i++)
    _pal_palette_update( modList[| i] );

//Updating shared palette's surface
var refList = sPal_modifiedPalRef;
surface_set_target(sPal_surface)
d3d_set_projection_ortho(0, 0, surface_get_width(sPal_surface), surface_get_height(sPal_surface), 0);
shader_reset();
for(var i = 0; i < modList_size; i++)
{
    var palette = modList[| i];
    var palIndex = palette[| sPal_palette_index];
    var xx = (palIndex % sPal_line) * sPal_palette_width;
    var yy = (palIndex div sPal_line) * sPal_palette_height;
    d3d_transform_set_translation(xx, yy, 0);
    draw_set_blend_mode_ext(bm_one, bm_zero)
    draw_surface(palette[| sPal_palette_surface], 0, 0);
    draw_set_blend_mode(bm_normal)
    
    sPal_modifiedPalRef[# palIndex, 0] = 0;
    if sPal_modifiedPalRef[# palIndex, 1] <= 0
    {
        ds_list_delete(modList, i);
        i--;
        modList_size--;
    }    
    _pal_fx_apply(palette, palette[| sPal_palette_fx], noone);
    shader_reset();
}

for(var i = 0; i < ds_list_size(sPal_fx_tempTargets); i++)
    ds_list_destroy(sPal_fx_tempTargets[| i])
ds_list_clear(sPal_fx_tempTargets);

d3d_transform_set_identity();
draw_set_blend_mode(bm_normal)
surface_reset_target();


if modList_size <= 0
    sPal_modified = false;

texture_set_interpolation(0)
