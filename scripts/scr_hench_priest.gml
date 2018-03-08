state_text = "Priest" //Potionsmaster, throwing cocktails at deadmen and happiness. bartender
if(ammo > 0) {
    if (near_target){
        if instance_exists(near_target){
            if (distance_to_point(near_target.x,near_target.y) < 40){
                var ob = instance_create(near_target.x,near_target.y-near_target.sprite_yoffset,obj_obelisk);
                ob.owner = owner;
                with (near_target){
                    instance_destroy();
                }
                ammo--;
                near_target = noone;
                xx = owner.x;
                yy = owner.y;
                exit;
            }
        }
        else{
            near_target = noone;
        }
    }
    
}

if (alarm[2] == -1){
    var distance = 0;
    //near_target = noone;
    if (instance_exists(obj_crack)){
        near_target = instance_nearest(x,y,obj_crack);
        xx = near_target.x
        yy = near_target.y

    }
    else{
        near_target = noone;
        xx = owner.x;
        yy = owner.y;
    }
    alarm[2] = 60;
}

if (distance_to_point(xx,yy) > 32){
    scr_face_and_move(x,y,xx,yy);
}
else{
    movement = movement.idle;
    image_speed=.05;
}
