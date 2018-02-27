///scr_add_rage(argument0)
var rage_add = argument0;
var henchid = argument1;

with(henchid) {
    rage_limit = 6;//max((3+myMasterID.pwr)-myMasterID.minions,0);
    rage += rage_add;
    scr_effect(spr_Broken);
    
    if(rage >= rage_limit){
        rage = rage_limit;
        movespd += 1;
        held = true;
        phy_active = true;
        night_worker = false;
        team = 4;
        pal_palette_slot( 4, spr_hench_pal )
        state = scr_hench_berserk;
        show_rage = true;
        alarm[10] = 5*room_speed;
        return true;
    } else {
        return false;
    }
    
}


