state_text="Return";

if (distance_to_point(myChestID.x,myChestID.y)<28){
    movespd = norm_movespd;
    held = false;
    
    if(night_controller.night){
        //if(!night_worker){
            SourceID.image_index = 0;
            SourceID.taken = 0;
            SourceID = 0;
            state=scr_hench_check_food;
        /*}
        else{
            state = scr_hench_idle;
            movement = movement.idle;
        }*/
    }
    else{
        SourceID.image_index = 0;
        SourceID.taken = 0;
        SourceID = 0;
        state=scr_hench_idle;
        movement = movement.idle;
        }
        exit;
}

scr_face_and_move(x,y,myChestID.x,myChestID.y);
