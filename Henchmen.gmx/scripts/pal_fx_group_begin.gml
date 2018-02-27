///pal_fx_group_begin(): group_handle
//Creates a group of effects
//Using groups, you can enable, disable and destroy effects by groups

if !sPal_fx_animmode
{
    var _fx = _pal_fx_create( sPal_fx_type_group );     
    sPal_fx_group_level++;
    sPal_fx_groups[sPal_fx_group_level, 0] = _fx[| sPal_fx_group_items];   
    sPal_fx_groups[sPal_fx_group_level, 1] = noone;  
    return _fx;
}
