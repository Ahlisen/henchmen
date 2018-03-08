///pal_fx_shader_change( fx_handle[, shader] )

var sha;
if argument_count >= 2
    sha = argument[1];
else
    sha = noone;
    
var _fx = argument[0];  
_fx[| sPal_fx_shader] = sha;    
