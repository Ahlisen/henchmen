///pal_fx_destroy( fx_handle )
//Removes effect with provided handle. If you want to remove all effects - use pal_fx_clear instead
//One more thing - it won't work from withing animations - use pal_anim_end instead

if sPal_fx_animmode
    exit;
    
var owner = argument0[| sPal_fx_owner];
var list = argument0[| sPal_fx_owner_list];
ds_list_remove(list, argument0)
_pal_fx_destroy( argument0 )
