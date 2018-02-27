///scr_player_finish();

rx = room_width div 2;
ry = room_height*0.7;
phy_active = false;
z = 0;

var pos_x = rx/2 +(1+team)*(rx/(main_controller.players+1))
var x_target = pos_x;
var y_target = ry;

dir = point_direction(x,y,x_target,y_target);

if (distance_to_point(x_target,y_target)>1){
    movement = movement.run;
    image_speed = movespd*0.1
    phy_position_x += lengthdir_x(movespd,dir);
    phy_position_y += lengthdir_y(movespd,dir)*perspective;
    /*if (alarm[0] == -1){
        alarm[0] = room_speed*3+room_speed*team*2;
    }*/
}
else{
    image_speed = .03;
    phy_position_x = x_target;
    phy_position_y = y_target;
    movement = movement.idle;
    face = face.r_down;
    image_xscale = 1+sqrt(points*0.05);
    image_yscale = image_xscale;
    //myDropoff.open = true;
    if (alarm[0] == -1){
        if(end_counter < 5){   
            getcost[0] = 0;
            getcost[1] = 0;
            getcost[2] = 0;
            getcost[3] = 0;
            getcost[4] = 0;
            
            if(myDropoff.resources[end_counter] == 0){
                end_counter++;
            } else {
                getcost[end_counter] = 1 //myDropoff.resources[end_counter];
                myDropoff.resources[end_counter] -= 1 //getcost[end_counter];
                
                myDropoff.payed = true;
                myDropoff.newcost = getcost;
                myDropoff.homing_target = id;
            }
            
            alarm[0] = 2*room_speed/(myDropoff.resources[end_counter]+1) //instance_number(player)*room_speed*2;
        }
        else{
            alarm[0] = room_speed*300; //do nothing for 5 min
        }
    }
}
