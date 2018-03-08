state_text = 'Stunned';

movement = movement.fall;

image_speed = 0;
image_index = image_number-1;

if (hp >= maxhp){
    //on_fire = false;
    hp = maxhp;
    phy_active = true;
    
    if(previous_state != scr_hench_theif){
        image_alpha = 1;
    } else {
        movespd = norm_movespd;
        image_alpha = 0.5;
    }
    nearest = noone;
    near_target = noone;
    
    if(previous_state == scr_hench_berserk){
        rage = 3;
        if(instance_exists(last_punched_by)){
            if(object_get_name(last_punched_by.object_index) == "player") {
                team = last_punched_by.team;
                myMasterID = last_punched_by.id;
                ds_list_remove(myChestID.henchList, id);
                with(myChestID) { alarm[11] = 1; }
                
                myChestID = last_punched_by.myDropoff;
                ds_list_add(myChestID.henchList, id)
                with(myChestID) { alarm[11] = 1; }
                alarm[11] = 1;
                movespd = norm_movespd;
                previous_state = scr_hench_idle;
            }
        }
    }
    
    if(previous_state == scr_hench_idle) {
        held = false;
        movement = movement.idle;
    }
    
    if(object_get_name(object_index) == "player"){ //if in demonform
        previous_state = scr_player_movement;
        if(awake) {
            awake = false;
            pal_palette_slot( team, spr_player_pal )
            movespd = norm_movespd;
            pwr = norm_pwr;
            on_fire = false;
            fire_counter = 0;
        }
    }
    
    state = previous_state;
    exit;
}

if (alarm[0] = -1){
    hp++;
    scr_effect(spr_Curl);
    alarm[0] = room_speed;
}

//Creates a flashing effect on the sprite
if (image_alpha >= 1) {
    image_alpha = 1;
    fadeStep = -0.1;
}
else if (image_alpha <= 0){
    image_alpha = 0;
    fadeStep = 0.1;
}
image_alpha = image_alpha + fadeStep;
