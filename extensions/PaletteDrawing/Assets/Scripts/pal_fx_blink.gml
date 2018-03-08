#define pal_fx_blink
///pal_fx_blink( color, intensity, interval, destroy_time [, image_index] )
//Example animated palette effect. Makes palette blink over time
/*
    color - color that will be added to the palette
    intensity - intensity of the effect. Usually a number from 0 to 1, but can be over 1 at cost of some performance
    interval - time of one blink
    destroy_time - time after which effect will be automatically destroyed. If value is -1 - it won't be destroyed over time
    
    image_index - if provided, will use palette from specified image index instead of solid color for the effect
*/

if argument_count < 5
    return  pal_fx_animation(_pal_fx_blink, argument[0], argument[1], pi/argument[2], argument[3]);

return  pal_fx_animation( _pal_fx_blink_palette, argument[4], argument[0], argument[1], pi/argument[2], argument[3] );

#define _pal_fx_blink
///_pal_fx_blink( color, alpha, interval, destroy_time )

var time = pal_fx_anim_time();
pal_fx_blendmode(bm_dest_alpha, bm_one)
var intensity = abs(cos(time * argument2));
pal_fx_color( merge_colour(c_black, argument0, intensity * argument1), 1 );
pal_fx_blendmode(bm_normal);

return ifelse(argument3 > 0 && time > argument3, pal_anim_end, pal_anim_continue);

#define _pal_fx_blink_palette
///_pal_fx_blink_palette( image_index, color, alpha, interval, destroy_time )

var time = pal_fx_anim_time();
pal_fx_blendmode(bm_dest_alpha, bm_one)
var intensity = abs(cos(time * argument3));
pal_fx_palette(argument0, merge_colour(c_black, argument1, intensity * argument2), 1)
pal_fx_blendmode(bm_normal);

return ifelse(argument4 > 0 && time > argument4, pal_anim_end, pal_anim_continue);