state_text="Dropoff";

if (distance_to_point(myChestID.x,myChestID.y) < 24){
    if(ObjectID){
        scr_dropoff(myChestID);
    }
    movespd = norm_movespd;
    
    if(night_controller.night && !night_worker){
        SourceID.image_index = 0;
        SourceID.taken = 0;
        SourceID = 0;
        image_alpha = 1;
        current_job = noone;
        job_index = 0;
        held = true;
        state = scr_hench_return_home;
        exit;
    }
    else{
        state = current_job;
        exit;
    }
}

ObjectID.x = x;
ObjectID.y = y-24;

scr_face_and_move(x,y,myChestID.x,myChestID.y);

