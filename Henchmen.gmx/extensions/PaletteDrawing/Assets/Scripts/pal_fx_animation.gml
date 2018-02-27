///pal_fx_animation( anim_script[, argument1, argument2, ...])

var _fx = _pal_fx_create( sPal_fx_type_script );
_fx[| sPal_fx_script] = argument[0];
_fx[| sPal_fx_script_time] = 0;

var list = ds_list_create();
for(var i = argument_count - 1; i >= 1; i--)
    list[| i - 1] = argument[i];
    
_fx[| sPal_fx_script_arguments] = list;

return _fx;
