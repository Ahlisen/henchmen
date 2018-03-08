///_pal_init_fx()

globalvar sPal_fx_animmode, sPal_fx_anim_current;
sPal_fx_animmode = false;
sPal_fx_anim_current = noone;

globalvar sPal_fx_groups, sPal_fx_group_level;
sPal_fx_groups = 0;
sPal_fx_group_level = -1;

globalvar sPal_fx_currentTargets, sPal_fx_tempTargets;
sPal_fx_currentTargets = noone;
sPal_fx_tempTargets = ds_list_create();
