#define pal_fx_blend
///pal_fx_blend( color, alpha )
//Blends all palette colors with provided ones.
//Results will look same as when using image_blend when drawing

var group = pal_fx_group_begin()
pal_fx_blendmode( bm_dest_colour, bm_zero )
pal_fx_color( argument0, argument1 )
pal_fx_blendmode( bm_normal )
pal_fx_group_end();

return group
#define pal_fx_blend_change
///pal_fx_blend_change( fx_handle, color, alpha )

var clr = pal_fx_group_find( argument0, sPal_fx_type_color );
pal_fx_color_change(clr[0], argument1, argument2)