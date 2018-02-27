///scr_hench_jump();

z += zspd;
image_speed = 0.3;

if (z > 0) {
    zspd -= .3;
} else {
    zspd = 0;
    z = 0;
    phy_active = true;
    image_speed = 0.3;
    state = previous_state;
    alarm[3] = room_speed*2;
    exit;
}

var hspd = lengthdir_x(0.5+movespd*1.3,dir);
var vspd = lengthdir_y(0.5+movespd*1.3,dir)*perspective;

if(!place_meeting(x+hspd,y+vspd,perimeter)){
    phy_position_x += hspd;
    phy_position_y += vspd;
}

if(ObjectID) {
    ObjectID.x = x;
    ObjectID.y = y-24-z;
}
