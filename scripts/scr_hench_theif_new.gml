///scr_hench_finish();

rx = room_width div 2;
ry = room_height div 2;
phy_active = false;

var pos_x = rx/2 +(1+team)*(rx/(main_controller.players+1))

var x_target = pos_x+32*;
var y_target = ry+96;

dir = point_direction(x,y,x_target,y_target);

if (distance_to_point(x_target,y_target)>1){
    movement = movement.run;
    image_speed = movespd*0.1
    phy_position_x += lengthdir_x(movespd,dir);
    phy_position_y += lengthdir_y(movespd,dir)*perspective;
}
else{
    image_speed = .03;
    phy_position_x = x_target;
    phy_position_y = y_target;
    movement = movement.idle;
    face = face.r_down;
}
