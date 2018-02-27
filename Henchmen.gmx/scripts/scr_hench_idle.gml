state_text = 'Idle';
//movement = movement.idle;
image_speed = 0.03;

if (alarm[0] == -1){
    
    if(distance_to_point(myChestID.x,myChestID.y) > 64 && !held){
        state = scr_hench_return_home;
    }

    alarm[0] = room_speed*2;
}

if (owner.ObjectID == id) {
    image_index = owner.image_index;
}
