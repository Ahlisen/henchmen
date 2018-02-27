///scr_get_face(xx,yy,x_axis,y_axis)
var xx = argument[0];
var yy = argument[1];
var x_axis = argument[2];
var y_axis = argument[3];

movement = movement.run;
image_speed = movespd*.2;

dir = point_direction(xx,yy,x_axis,y_axis);
face = floor(dir/90);

if (face = 4) face = 3;
if (face == 1 || face == 2) image_xscale = -1; else image_xscale = 1;

var hspd = lengthdir_x(movespd,dir);
var vspd = lengthdir_y(movespd,dir)*perspective;

phy_position_x += hspd;
phy_position_y += vspd;

if(alarm[3] == -1){
    var nearest_s = instance_nth_nearest(x,y,parent_lifeform,2)
    if(distance_to_point(nearest_s.x,nearest_s.y) < 12) {
        if(state != scr_life_punch_new){
            previous_state = state;
        }
        state = scr_hench_jump;
        phy_active = false;
        zspd = 3;
        exit;
    }
    alarm[3] = room_speed;
}
