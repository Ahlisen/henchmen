///_pal_fx_apply( palette_object, fxList, targets )

var inc = delta_time * 60 / 1000000;
sPal_fx_currentTargets = argument2;

var size = ds_list_size(argument1);
for(var i = 0; i < size; i++)
{
    var _fx = argument1[| i];
    if !_fx[| sPal_fx_enabled]
        continue;
        
    switch(_fx[| sPal_fx_type])
    {
        case sPal_fx_type_blendmode:
            _pal_fx_doBlendmode( _fx[| sPal_fx_bm1], _fx[| sPal_fx_bm2])
            break;
        case sPal_fx_type_color:
            _pal_fx_doColor( argument0, _fx[| sPal_fx_color], _fx[| sPal_fx_alpha])
            break;
        case sPal_fx_type_palette:
            _pal_fx_doPalette( argument0, _fx[| sPal_fx_image_index], _fx[| sPal_fx_color], _fx[| sPal_fx_alpha])
            break;
        case sPal_fx_type_script:
            sPal_fx_animmode = true;
            sPal_palette_sel = argument0;
            sPal_fx_anim_current = _fx;
            var result = script_execute_list( _fx[| sPal_fx_script], _fx[| sPal_fx_script_arguments]);
            sPal_fx_animmode = false;
            switch(result)
            {
                case pal_anim_continue:
                    _fx[| sPal_fx_script_time] += inc;
                    break;
                case pal_anim_end:
                    _pal_fx_destroy( _fx );
                    ds_list_delete(argument1, i--);
                    size--;
                    break;
            }
            break;
        case sPal_fx_type_group:
            _pal_fx_apply( argument0, _fx[| sPal_fx_group_items], sPal_fx_currentTargets )
            break;
        case sPal_fx_type_targets:
            _pal_fx_doTargets( _fx[| sPal_fx_targets] );
            break;
        case sPal_fx_type_shader:
            _pal_fx_doShader( _fx[| sPal_fx_shader] );
            break;
    }
}
