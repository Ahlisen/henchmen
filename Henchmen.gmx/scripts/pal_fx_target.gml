///pal_fx_target( [slot, slot, ...] )
//Sets target for all next effects. If no arguments provided - it will target whole palette
//Just so you know - using it will make effects slower
//PS. Just like in most other functions with slot arguemnts,  you can provided palette instead of slot name

//Funny fact: This is affected by pal_palette_group. 
//So it may be a good idea to provide palettes instead of slot names

var targets;
if argument_count = 0
    targets = noone;
else
{
    targets = ds_list_create();
    for(var i = argument_count - 1; i >=0; i--)
        targets[| i] = _pal_get_slot_palette( argument[i], sPal_palette_sel);
}
    
if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_targets );
    _fx[| sPal_fx_targets] = targets;   
    return _fx;
}
else
{
    ds_list_add(sPal_fx_tempTargets, targets);
    _pal_fx_doTargets(targets)
}
