///scr_player_punch_two();
state_text = "Punch";
movement = movement.punch2;

image_speed = 0.05*agility;

scr_xbox_controls();

//If the animation is over
if (animation_hit_frame(image_number-1)){
    state = scr_player_movement;
    exit;
}

//If the animation is at the punch
if (animation_hit_frame(1)){
    var damage = instance_create(x+lengthdir_x(10,dir),y+lengthdir_y(10,dir),parent_damage);
    damage.owner = id;
    damage.pwr = pwr;
    damage.image_xscale = image_xscale;
}

if (animation_hit_frame(0)){
    
    hspd = lengthdir_x(key_spd,key_dir);
    vspd = lengthdir_y(key_spd,key_dir);
    
    physics_apply_impulse(x,y,10*hspd,10*vspd*perspective);
}

if (image_index > 2 && key_punch) {
    state = scr_player_flyingpunch;
    image_index = 0;
    zspd = 0;
    movement = movement.punch;
}
