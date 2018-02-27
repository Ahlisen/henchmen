state_text = "Theif"

if (n_tar){
    if(n_tar != owner){
        if (distance_to_point(n_tar.x,n_tar.y) < 12){
            if(n_tar.ObjectID){
                ObjectID = n_tar.ObjectID;
                n_tar.ObjectID = 0;
                movespd = n_tar.movespd;
                n_tar.movespd = n_tar.norm_movespd;
                n_tar.state = scr_hench_return_to_source;
                current_job = scr_hench_theif;
                state = scr_hench_dropoff;
                exit;
            }
            else{
                n_tar = noone;
            }
        } else {
            scr_face_and_move(x,y,n_tar.x,n_tar.y);
        }
    } else {
        if (distance_to_point(n_tar.x+32,n_tar.y) > 5){
            scr_face_and_move(x,y,n_tar.x+32,n_tar.y);
        } else {
            movement = movement.idle;
            image_speed = 0.05;
        }
    }
} 
/*
//Move randomly
if (alarm[1] == -1){
    //n_tar = 0;
    xx = owner.x+irandom(room_width/4)-room_width/8;
    yy = owner.y+irandom(room_height/4)-room_width/8;
    alarm[1] = 180;
}*/

//Find target
if (alarm[2] == -1){
    var distance = room_width;
    n_tar = owner;
    // Iterate through all enemies
    for (var i = 0; i < instance_number(henchman); i++) {
       var target = instance_find(henchman,i); // p defines the id of current enemy
       if (target.team != team && target.ObjectID && distance_to_point(target.x,target.y) < distance ) {
          n_tar = target;
          distance = distance_to_point(target.x,target.y);
       }
    }
    alarm[2] = room_speed*2;
}


