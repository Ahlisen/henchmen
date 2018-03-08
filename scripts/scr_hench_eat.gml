movement = movement.eat;
image_speed = 0.05;
held = true;
show_rage = 1;

if (animation_hit_frame(image_number-5)){
    scr_effect(spr_Fishbones);
}

if (animation_hit_frame(image_number-1)){
    
    if(!night_worker){
        held = false;
        state = scr_hench_sleep;
    } else {
        held = false;
        phy_active = true;
        movement = movement.idle;
        state = scr_hench_idle;
    }
}
