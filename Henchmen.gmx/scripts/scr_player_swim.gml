///scr_player_swim()
image_speed = .03;

scr_xbox_controls();

if (key_hor != 0 || key_vert != 0){
    
    movement = movement.swim;
    
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
    image_speed = key_spd*0.05;
    
    hspd = lengthdir_x(key_spd,key_dir);
    vspd = lengthdir_y(key_spd,key_dir);
    
    face = scr_get_face(0,0,key_hor,key_vert);
    
    phy_position_x += 0.8*hspd;
    phy_position_y += 0.8*vspd*perspective;
}

if (key_roll){
    for (var i = 0; i < instance_number(henchman); i++){
        var hench = instance_find(henchman,i); //defines the id of current henchman
        if (hench.team == team) {
           with(hench){
           hench.show_rage = true;
           alarm[10] = room_speed*4;
           }
        }    
    }

    with(myDropoff){
        open = true;
        image_index = 1;
        alarm[0] = room_speed*4;
    }
    exit;
}
/*
//Riktigt mysko sätt att fixa vatten collision, samma i movement
var x1 = 0
var y1 = 0
var x2 = sprite_get_width(spr_Oasis2)*.75;
var y2 = 0;
var x3 = 0;
var y3 = sprite_get_height(spr_Oasis2)*.5;
if !point_in_triangle(x, y, x1, y1, x2, y2, x3, y3){
   state = scr_player_movement;
}
