///pal_fx_palette( image_index, color, alpha )
//Draws subimage of own palettes.
//Applying speed will be different depening on your palette width:
//When you have palette width over - palette from subimages will be included in it automatically
//So, if you have 2px width palette and you try to draw palette with image_index = 1 - 
//it will be fast since it will draw part of existing palette
//If image_index is not on the surface - it will be slower.

//Funny fact: Setting alpha to value over 1.0 won't clamp it, but make image drawn multiple times
//Until sum of all alphas drawn won't become alpha value  you provided

if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_palette );
    _fx[| sPal_fx_image_index] = argument0;
    _fx[| sPal_fx_color] = argument1;
    _fx[| sPal_fx_alpha] = argument2;
    
    return _fx;
}
else
    _pal_fx_doPalette(sPal_palette_sel, argument0, argument1, argument2)
