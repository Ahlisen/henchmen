if (alarm[1] = -1){
    if (night_controller.night && !night_worker){
        image_alpha = 1;
        current_job = noone;
        progress = 0;
        held = true;
        state = scr_hench_return_home;
        exit;
    }
    else{
        alarm[1] = 60;
    }
