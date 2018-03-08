///pal_fx_blendmode_change( fx_handle, blend_mode/bm_source[, bm_dest] )

var bm2 = noone;
if argument_count >= 3
    bm2 = argument[2];
    
var _fx = argument[0];
_fx[| sPal_fx_bm2] = bm2;    
_fx[| sPal_fx_bm1] = argument[1];
