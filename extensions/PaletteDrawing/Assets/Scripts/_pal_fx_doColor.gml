///_pal_fx_doColor( palette_object, color, alpha )

if sPal_fx_currentTargets = noone
    draw_sprite_ext(spr_pixel, 0, 0, 0, 1, sPal_palette_height, 0, argument1, argument2)
else
{
    var targets = sPal_fx_currentTargets;   
    var baked = argument0[| sPal_palette_baked_map];
    for(var i = ds_list_size(targets) - 1; i >= 0; i--)
    {
        var slottag = targets[| i];
        var info = baked[? slottag];
        if !is_undefined(info)            
            draw_sprite_ext(spr_pixel, 0, 0, info[| sPal_palBaked_offset], 1, sprite_get_height(info[| sPal_palBaked_sprite]), 0, argument1, argument2)
    }
}
