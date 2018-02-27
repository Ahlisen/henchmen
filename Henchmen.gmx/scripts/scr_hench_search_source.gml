///Search for the closest source of income
state_text = "Search";
movement = movement.fly;
image_speed = 0.05*phy_speed;

if(z > 0){
    z -= 1/(phy_speed+1);
}
else{
    z = 0;
}

if (alarm[2] == -1){
    distance = 0;
    nearest = 0;
    // Iterate through all sources
    for (var i = 0; i < instance_number(parent_circle); i++) {
       var target = instance_find(parent_circle,i); // p defines the id of current enemy
       if (!target.taken && (distance_to_point(target.x,target.y) < distance || nearest == 0) ) {
          // Sets the target id and distance
          nearest = target;
          distance = distance_to_point(target.x,target.y);
       }
    }
    alarm[2] = 15;
}


//nearest = instance_nearest(x,y,circle_parent);
if (nearest){
    if (distance_to_point(nearest.x,nearest.y-norm_sprite_yoffset) < 1){
        if(nearest.taken){
            exit;
        }
        var obj_name = object_get_name(nearest.object_index);
        SourceID = nearest.id;
        SourceID.image_index = 1;
        SourceID.taken = 1;
        progress = 0;
        z = 0;
        
        if(obj_name == 'source'){
            held = false;
            job_index = 1;
            phy_speed_x = 0;
            phy_speed_y = 0;
            phy_position_x = nearest.x
            phy_position_y = nearest.y-norm_sprite_yoffset+2;
            image_index = 0;
            state = scr_hench_progress;
            exit;
        }
        else{
            held = true;
            switch(nearest.type)
            {
                case 0:
                    job_index = 2;
                    //myMasterID.pwr += 1;
                    //myMasterID.agility += 1;
                    pwr += 1;
                    armor += 1;
                    movespd += 0.5;
                    scr_effect(spr_Shield);
                    state = scr_hench_squire;
                    break;
                case 1:
                    state = scr_hench_theif;
                    image_alpha = 0.5;
                    break;
                case 2:
                    phy_speed_x = 0;
                    phy_speed_y = 0;
                    phy_position_x = nearest.x
                    phy_position_y = nearest.y-norm_sprite_yoffset;
                    state = scr_hench_demon;
                    break;
                case 3:
                    state = scr_hench_bartender;
                    ammo = 2;
                    job_index = 3;
                    break;
            }
            exit;
        }
    }
    
    if(distance < 32){
        face = scr_get_face(x,y,nearest.x,nearest.y-norm_sprite_yoffset);
        dir = point_direction(x,y,nearest.x,nearest.y-norm_sprite_yoffset);
        physics_apply_impulse(x,y,lengthdir_x(movespd,dir),lengthdir_y(movespd,dir)*perspective);
    }
    else{
        if(phy_speed <= 1 && z == 0){
            held = false;
            image_index = 0;
            alarm[0] = room_speed*2;
            state = scr_hench_idle;
            movement = movement.idle;
            z = 0;
        }
    }
    
}
