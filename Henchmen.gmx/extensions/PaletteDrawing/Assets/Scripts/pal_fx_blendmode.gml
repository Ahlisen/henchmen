///pal_fx_blendmode( blend_mode/bm_source[, bm_dest] )
//Changes blend mode when applying effects to the palette
//You can provide one value for draw_set_blend_mode or 2 for draw_set_blend_mode_ext

var bm2 = noone;
if argument_count >= 2
    bm2 = argument[1];
    
if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_blendmode );
    
    _fx[| sPal_fx_bm2] = bm2;    
    _fx[| sPal_fx_bm1] = argument[0];
    
    return _fx;
}
else 
    _pal_fx_doBlendmode(argument[0], bm2)
