///_pal_fx_blink( color, alpha, interval, destroy_time )

var time = pal_fx_anim_time();
pal_fx_blendmode(bm_dest_alpha, bm_one)
var intensity = abs(cos(time * argument2));
pal_fx_color( merge_colour(c_black, argument0, intensity * argument1), 1 );
pal_fx_blendmode(bm_normal);

return ifelse(argument3 > 0 && time > argument3, pal_anim_end, pal_anim_continue);

