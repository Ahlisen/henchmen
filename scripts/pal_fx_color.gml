///pal_fx_color( color, alpha )
//Draws color over the whole palette

if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_color );
    _fx[| sPal_fx_alpha] = argument1;
    _fx[| sPal_fx_color] = argument0;
    
    return _fx;
}
else
    _pal_fx_doColor( sPal_palette_sel, argument0, argument1)
