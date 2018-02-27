///_pal_palette_draw_subimage( palette_object, image_index, image_blend, image_alpha )
//Draws image index of the palette

var count = ceil(argument3);
if (argument1 < sPal_palette_width)
{
    //Drawing from surface if possible
    var srf = argument0[| sPal_palette_surface];
    for(var k = 0; k < count; k += 1)
        draw_surface_part_ext(srf, argument1, 0, 1, surface_get_height(srf), 0, 0, 1, 1, argument2, argument3-- );
}
else
{
    //If not - use baked list for drawing
    var baked = argument0[| sPal_palette_baked];
    for(var i = 0; i < ds_list_size(baked); i++)
    {
        var item = baked[| i];
        var spr = item[| sPal_palBaked_sprite];
        for(var k = 0; k < count; k += 1)
        draw_sprite_part_ext(
            spr, 
            argument1, 
            item[| sPal_palBaked_line], 
            0, 
            1, 
            sprite_get_height(spr), 
            0, 
            item[| sPal_palBaked_offset],
            1,
            1,
            argument2,
            argument3--
            );
    }
}
