state_text = 'Demon';

iangle += progress;
movement = movement.fall;

if (progress >= 50){
    
    pay = instance_create(x,y,homing_item);
    pay.target = owner;
    pay.sprite_index = spr_Spirit;
    pay.image_speed = 0;
    pay.image_index = 0;
    
    repeat(8) {
        ef = instance_create(x+random_range(-5,5),y+random_range(-5,5),homing_item);
        ef.target = owner;
        ef.sprite_index = spr_Spirit;
        ef.image_speed = 0;
        ef.image_index = irandom(2)+1;
    }
    
    repeat(25){
        var gibs = instance_create(x,y+norm_sprite_yoffset,obj_gibs);
        //gibs.sprite_index = spr_gibs_blood;
    }

    SourceID.image_index = 0;
    SourceID.taken = 0;
    SourceID = 0;
    
    obj_view.shake = 2;
    obj_view.alarm[0] = room_speed;
    
    scr_remove_from_henchList(id,myChestID);
    instance_destroy();
    exit;
}


if(alarm[2] = -1){
    progress += 5;
    //scr_effect(spr_Curl);
    //scr_effect(spr_Glimmer);
    alarm[2] = room_speed*0.25;
}
