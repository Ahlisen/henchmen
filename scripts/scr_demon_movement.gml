///scr_player_movement()
image_speed = .03;
movement = movement.idle;
face = face.r_down;

scr_xbox_controls();

if (key_hor != 0 || key_vert != 0){
    
    movement = movement.run;
    
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd*0.5;
    image_speed = key_spd*0.1
    
    face = scr_get_face(0,0,key_hor,key_vert);
    
    phy_position_x += key_hor*key_spd;
    phy_position_y += key_vert*key_spd*perspective;
}

if (key_roll){
    image_index = 0;
    previous_state = state;
    state = scr_demon_fireball;
}

if (key_punch){
    image_index = 0;
    previous_state = state;
    state = scr_demon_fireball;
    exit;
}

if (key_groundpound){
    image_index = 0;
    movement = movement.prepjump;
    previous_state = state;
    state = scr_player_prepjump;
    exit;
}
