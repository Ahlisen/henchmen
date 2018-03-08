state_text = "Bartender";

if(!near_target || distance_to_point(near_target.x,near_target.y) > 120) {
    if (distance_to_point(owner.x,owner.y) > 32){
        scr_face_and_move(x,y,owner.x,owner.y);
    } else {
        movement = movement.idle;
        image_speed = .03;
    }
} else {
    if(distance_to_point(near_target.x,near_target.y) < 90){
        var throw = instance_create(x,y-sprite_yoffset,obj_potion);
        throw.target = near_target;
        var choice;
        if(near_target.state == scr_life_dead) {
            choice = 2; //revive
        } else {
            if(near_target.on_fire || near_target.ObjectID){
                choice = 0; //water
            } else {
                choice = choose(0,1);
            }
        }
        throw.image_index = choice;
        near_target = noone;
        alarm[2] = room_speed*3;
    } else {
        scr_face_and_move(x,y,xx,yy);
    }
}

if (alarm[2] == -1){
    var distance = room_width;
    near_target = noone;
    // Iterate through all friends
    for (var i = 0; i < instance_number(henchman); i++) {
       var target = instance_find(henchman,i);
       var dist = distance_to_point(target.x,target.y);
       
       if (target.team == team && dist < distance && target.id != id) {
          // Sets the target id and distance
          near_target = target;
          distance = dist;
       }
       
    }
    if(near_target){
        xx = near_target.x
        yy = near_target.y
    }
    if(on_fire) {
        near_target = id;
    }
    alarm[2] = room_speed*2;
}
