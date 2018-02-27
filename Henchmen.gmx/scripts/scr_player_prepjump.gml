///scr_player_prepjump();

image_speed = 0.2;

scr_xbox_controls();
/*
image_xscale = 1+sqrt(zspd)*0.2;
image_yscale = 1-min(0.3,sqrt(zspd)*0.5);
*/
if(key_groundpound_re) {
    image_index = 0;
    movement = movement.groundpound;
    image_speed = 0.3;
    used_punch = false;
    if(zspd > 4){
        phy_active = false;
        if(zspd > 6) {
            repeat(zspd){
                var gibs = instance_create(x,y,obj_gibs);
                gibs.sprite_index = spr_gibs_sand;
                gibs.spd += zspd*0.1;
            }
            vib = zspd*0.1;
            
            obj_view.shake = 1;
            obj_view.alarm [0] = 6;
        }
    }
    z = 1;
    state = scr_player_jump;
    alarm[4] = 1;
    
    
    
    exit;
}


if(animation_hit_frame(image_number-1) /*&& image_speed != 0*/){
    image_speed = 0;
} else {
    zspd += 0.075*pwr;
}

if (key_hor != 0 || key_vert != 0){
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
} else {
    key_spd = 0;
}
