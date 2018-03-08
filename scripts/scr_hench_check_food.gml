movement = movement.idle;
image_speed = 0.05;
held = true;
job_index = 0;
phy_active = false;

if(distance_to_point(default_x,default_y) < 1){

    if(!checked_for_food) {
        checked_for_food = true;
        show_rage = true;
        z = 0;
        phy_position_x = default_x
        phy_position_y = default_y
        //phy_active = true;
        /*var pay = instance_create(myChestID.x,myChestID.y-8,homing_item);
            pay.target = id;
            pay.image_speed = 0;
            pay.image_index = 0;*/
        
        if (myChestID.resources[res.fish] > 0){
            myChestID.resources[res.fish]--;
            state = scr_hench_eat;
            image_index = 0;
            //pay.sprite_index = spr_Items;
        }
        else{
            scr_effect(spr_Nofish);
            if(scr_add_rage(3,id)){
                exit;
            } else {
                held = false;
                phy_active = false;
                state = scr_hench_sleep;
            }
        }
    } else {
        phy_active = true;
        held = false;
        movement = movement.idle;
        state = scr_hench_idle;
        exit;
    }
    
}

scr_face_and_move(x,y,default_x,default_y)
//movement = movement.fly;
//z = 0.5*(-(distance_to_point(start_x,start_y)-tot/2)+(tot/2)^2);
