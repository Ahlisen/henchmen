///_pal_fx_blink_palette( image_index, color, alpha, interval, destroy_time )

var time = pal_fx_anim_time();
pal_fx_blendmode(bm_dest_alpha, bm_one)
var intensity = abs(cos(time * argument3));
pal_fx_palette(argument0, merge_colour(c_black, argument1, intensity * argument2), 1)
pal_fx_blendmode(bm_normal);

return ifelse(argument4 > 0 && time > argument4, pal_anim_end, pal_anim_continue);
