///_pal_fx_doPalette( palette_object, image_index, color, alpha )

var targets = sPal_fx_currentTargets;
var count = ceil(argument3);
if (argument1 < sPal_palette_width && targets = noone)
{
    //Drawing from surface if possible
    var srf = argument0[| sPal_palette_surface];
    for(var k = 0; k < count; k += 1)
        draw_surface_part_ext(srf, argument1, 0, 1, surface_get_height(srf), 0, 0, 1, 1, argument2, argument3-- );
}
else
{
    //If not - use baked list for drawing
    if targets = noone
    {
        var baked = argument0[| sPal_palette_baked];
        for(var i = 0; i < ds_list_size(baked); i++)
        {
            var item = baked[| i];
            var spr = item[| sPal_palBaked_sprite];
            if argument1 >= sprite_get_number(spr)
                continue;
                
            var alpha = argument3;
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
                alpha--
                );
        }
    }
    else
    {
        var baked = argument0[| sPal_palette_baked_map];
        for(var i = ds_list_size(targets) - 1; i >= 0; i--)
        {
            var slottag = targets[| i];
            var item = baked[? slottag];
            if !is_undefined(item)   
            {         
                var spr = item[| sPal_palBaked_sprite];
                if argument1 >= sprite_get_number(spr)
                    continue;
                
                var alpha = argument3;
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
                    alpha--
                    );
            }
        }
    }
}
