///scr_lifeform_punch();
state_text = "Punch";
movement = movement.punch;

image_speed = 0.05*agility;

//If the animation is over
if (animation_hit_frame(image_number-1)){
    near_target = 0;
    if (previous_state != scr_life_punch_new){
        state = previous_state;
    }
    else{
        state = scr_player_movement;
    }
}

//If the animation is at the punch
if (animation_hit_frame(image_number-3)){
    var damage = instance_create(x+lengthdir_x(8,dir),y+lengthdir_y(8,dir),parent_damage);
    damage.owner = id;
    damage.pwr = pwr;
    damage.image_xscale = image_xscale;
    
    if(object_get_name(object_index) == "player" && awake) {
        var spd = 5+random_range(-1,1);
        //var dir = point_direction(0,0,key_hor,key_vert)+random_range(-10,10);
        var xdir = lengthdir_x(spd,dir);
        var ydir = lengthdir_y(spd,dir);
        
        fire = instance_create(x+xdir,y+ydir,fireball);
        fire.pwr = pwr;
        fire.alarm[0] = 600;
        fire.owner = id;
        with(fire){
            physics_apply_impulse(x,y,xdir,ydir*perspective);
        }
    }
}
