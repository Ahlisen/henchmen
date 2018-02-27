///scr_player_prepjump();

image_speed = 0.2;

scr_xbox_controls();

if(key_groundpound_re) {
    image_index = 0;
    movement = movement.groundpound;
    //previous_state = state;
    state = scr_player_jump;
    exit;
}


if(round(image_index) == image_number){
    image_speed = 0;
} else {
    zspd += 0.3;
}

if (key_hor != 0 || key_vert != 0){
    //x += lengthdir_x(key_spd,key_dir);
    //y += lengthdir_y(key_spd*.9,key_dir);
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
} else {
    key_spd = 0;
}
