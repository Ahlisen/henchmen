///pal_fx_target_change( fx_handle[, slot, slot, ...] )

var targets;
if argument_count = 0
    targets = noone;
else
{
    targets = ds_list_create();
    for(var i = argument_count - 1; i >= 1; i--)
        targets[| i] = _pal_get_slot_palette( argument[i], sPal_palette_sel);
}
    
var _fx = argument[0];
if _fx[| sPal_fx_targets] != noone
    ds_list_destroy(_fx[| sPal_fx_targets]);
    
_fx[| sPal_fx_targets] = targets;   
