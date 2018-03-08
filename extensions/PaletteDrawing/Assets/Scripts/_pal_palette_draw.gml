///_pal_palette_draw( palette_object, start_index, count )

var baked = argument0[| sPal_palette_baked];
for(var i = 0; i < ds_list_size(baked); i++)
{
    var item = baked[| i];
    var spr = item[| sPal_palBaked_sprite];
    for(var j = min(sprite_get_number(spr), argument1 + argument2) - 1; j >= argument1; j--)
    {
        var pos = item[| sPal_palBaked_line];
        switch(pos)
        {
            case -2:
                pos = random(sprite_get_width(spr)-1)
                item[| sPal_palBaked_line] = pos;
                break;
            case -1:
                pos = irandom(sprite_get_width(spr)-1)
                item[| sPal_palBaked_line] = pos;
                break;
        }
        draw_sprite_part(spr, j, pos, 0, 1, sprite_get_height(spr), j, item[| sPal_palBaked_offset]);
    }
}
