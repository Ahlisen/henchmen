///scr_player_pickup();

image_speed = 0.2;

scr_xbox_controls();

if(animation_hit_frame(image_number-1)){

    if (!ObjectID) {
        if(instance_exists(henchman)) {
            var nearest = instance_nearest(x,y,henchman);
            if (distance_to_point(nearest.x,nearest.y) < 16) {
                if (!nearest.held && nearest.team == team && nearest.state != scr_life_stunned) {
                    ObjectID = nearest.id;
                    ObjectID.SourceID.image_index = 0;
                    ObjectID.SourceID.taken = 0;
                    ObjectID.SourceID = 0;
                    ObjectID.image_alpha = 1;
                    ObjectID.phy_active = false;
                    
                    if(ObjectID.state == scr_hench_sleep){
                        ObjectID.night_worker = true;
                        if(scr_add_rage(1,ObjectID)){
                            ObjectID = noone;
                            exit;
                        } else {
                            ObjectID.alarm[10] = 2*room_speed;
                        }
                    }
                    ObjectID.state = scr_hench_idle;
                    ObjectID.movement = movement.carried;
                    ObjectID.job_index = 0;
                    ObjectID.held = true;
                }
            }
        }
        if(instance_exists(parent_hittable)) {
            var nearest = instance_nearest(x,y,parent_hittable);
            if (distance_to_point(nearest.x,nearest.y) < 16) {
                if (!ObjectID && !nearest.held) {
                    ObjectID = nearest.id;
                    ObjectID.owner = id;
                    ObjectID.phy_active = false;
                    ObjectID.held = true;
                }
            }
        }
    }
    
    if (previous_state != scr_player_pickup){
        state = previous_state;
    } else {
        state = scr_player_movement;
    }
    exit;
}
