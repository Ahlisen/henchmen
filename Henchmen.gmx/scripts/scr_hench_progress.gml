state_text = "Progress"

movement = movement.idle;
image_speed = 0.05;
held = false;

/*
    Idea: Have the progress reach 100 at a specific time of each day, 
    making everyone get 1 or 2 harvests per henchman on that day
*/

if (progress >= 100){

    newItem = instance_create(x,y,obj_item);
    newItem.sprite_index = spr_Items;
    newItem.image_speed = 0;
    newItem.worth = 2;
    newItem.image_index = SourceID.type;
    newItem.type = SourceID.type;
       
    if (irandom(luck) == luck){
        if (irandom(luck) == luck){
            newItem.worth = 4;
            newItem.sprite_index = spr_large_items;
            movespd = movespd*0.5;
        }
        else{
            newItem.worth = 3;
            newItem.sprite_index = spr_medium_items;
            movespd = movespd*0.6;
        }
    } else {
        movespd = movespd*0.7;
    }
       
    ObjectID = newItem.id;
    held = true;
    progress = 0;
    current_job = scr_hench_return_to_source;
    state = scr_hench_dropoff;
    exit;
}

if (alarm[1] = -1){
    progress += 20;
    scr_effect(spr_Cog);
    alarm[1] = room_speed*3;
}
