///scr_life_attacked();
state_text = "Attacked"

movement = movement.fall;

if(animation_hit_frame(image_number-1)){
    image_speed = 0;
    image_index = image_number-1;
    //var pal = pal_palette_default_get_back( tl_ground );
    //pal_palette_select(palette_index);
}
else{
    image_speed = .2;
}

if(phy_speed <= 0.1 && image_speed == 0){
    if(hp <= 0){
        hp = 0;
        if(current_job == scr_hench_theif && ObjectID) {
            if(object_get_name(last_punched_by.object_index) == "player"){
                scr_dropoff(last_punched_by.myDropoff);
                previous_state = current_job;
            }
        }
    
        phy_active = false;
        state = scr_life_stunned;
        exit;
    }
    if (previous_state == scr_hench_idle){
        held = false; //MÅSTE FIXAS; INCOHERENT
        movement = movement.idle;
    }
    state = previous_state;
    exit;
}

if (ObjectID){
    ObjectID.x = x;
    ObjectID.y = y-24;
}
