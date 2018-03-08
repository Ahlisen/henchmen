///scr_player_punch_one();
state_text = "Punch";
movement = movement.punch;

image_speed = 0.05*agility;

scr_xbox_controls();

//If the animation is over
if (animation_hit_frame(image_number-1)){
    near_target = 0;
    if (previous_state != scr_player_punch_one){
        state = previous_state;
    }
    else{
        state = scr_player_movement;
    }
}

//If the animation is at the punch
if (animation_hit_frame(4)){
    var damage = instance_create(x+lengthdir_x(8,dir),y+lengthdir_y(8,dir),parent_damage);
    damage.owner = id;
    damage.pwr = pwr;
    damage.image_xscale = image_xscale;
}

if (key_hor != 0 || key_vert != 0){
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
} else {
    key_spd = 0;
}

if (image_index > 4 && key_punch) {
    state = scr_player_flyingpunch;
    image_index = 0;
    zspd = 0;
    movement = movement.punch2;
}
