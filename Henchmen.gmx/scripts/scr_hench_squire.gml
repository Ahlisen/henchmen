state_text = "Squire"

if(!near_target || distance_to_point(near_target.x,near_target.y) > 90) {
    if (distance_to_point(owner.x,owner.y) > 40){
        scr_face_and_move(x,y,owner.x,owner.y);
    } else {
        movement = movement.idle;
        image_speed = .05;
    }
} else {
    if(distance_to_point(near_target.x,near_target.y) < 16){
        image_index = 0;
        previous_state = state;
        movement = movement.punch;
        state = scr_life_punch_new;
        near_target = noone;
        exit;
    }
    scr_face_and_move(x,y,xx,yy);
}

if (alarm[2] == -1){
    var distance = room_width;
    near_target = noone;
    // Iterate through all enemies
    for (var i = 0; i < instance_number(player); i++) {
       var target = instance_find(player,i);
       var dist = distance_to_point(target.x,target.y);
       if (target.state != scr_life_stunned && target.team != team && dist < distance ) {
          // Sets the target id and distance
          near_target = target;
          distance = dist;
       }
    }
    if(near_target){
        xx = near_target.x
        yy = near_target.y
    }
    alarm[2] = room_speed*2;
}
