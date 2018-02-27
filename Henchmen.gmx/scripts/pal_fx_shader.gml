///pal_fx_shader( [shader] )
//Sets the shader for next effect drawing
//If nothing provided - resets the shader

var sha;
if argument_count >= 1
    sha = argument[0];
else
    sha = noone;
    
if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_shader );  
    _fx[| sPal_fx_shader] = sha;    
    
    return _fx;
}
else 
    _pal_fx_doShader( sha )
