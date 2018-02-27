///scr_lifeform_punch();
state_text = "Punch";
movement = movement.punch;

image_speed = 0.05*agility;

if (animation_hit_frame(0)){ 
    var hspd = lengthdir_x(pwr,dir);
    var vspd = lengthdir_y(pwr,dir);
    physics_apply_impulse(x,y,5*hspd,5*vspd*perspective);
}

//If the animation is over
if (animation_hit_frame(image_number-1)){
    near_target = 0;
    if (previous_state != scr_life_punch_new){
        state = previous_state;
    }
}

//If the animation is at the punch
if (animation_hit_frame(image_number-3)){
    var damage = instance_create(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),parent_damage);
    damage.owner = id;
    damage.pwr = pwr;
    //damage.image_xscale = image_xscale;
}
