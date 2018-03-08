state_text = "Berserk"

if (near_target){
    if (distance_to_point(near_target.x,near_target.y) < 16){
        image_index = 0;
        previous_state = state;
        movement = movement.punch;
        state = scr_life_punch_new;
        exit;
    }
}

//Move randomly
if (alarm[3] == -1 && !near_target){
    //near_target = 0;
    xx = irandom(room_width);
    yy = irandom(room_height);
    alarm[3] = room_speed*4;
}

//Find target
if (alarm[2] == -1){
    var odds = 3;
    if (irandom(odds) == odds){
        near_target = instance_nth_nearest(x,y,player,1);
        if(near_target && near_target.state != scr_life_stunned){
            xx = near_target.x
            yy = near_target.y
        } else {
            near_target = noone;
        }
        alarm[2] = room_speed*2;
    }
}

if (distance_to_point(xx,yy) > 3){
    scr_face_and_move(x,y,xx,yy);
}
else{
    movement = movement.idle;
    image_speed = 0.05;
}
