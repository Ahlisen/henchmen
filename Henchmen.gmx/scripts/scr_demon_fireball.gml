///scr_player_groundpound();

image_speed = 0.05*agility;
movement = movement.punch;

if (round(image_index) == image_number){
    near_target = 0;
    if(previous_state != scr_demon_fireball){
        state = previous_state;
    }
    else{
        state = scr_demon_movement;
    }
    used_punch = false;
    exit;
}

if(round(image_index) == image_number-2  && !used_punch){

    
    used_punch = true;
}
