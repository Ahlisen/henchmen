///scr_player_movement()
image_speed = .03;
movement = movement.idle;

scr_xbox_controls();

//THROW IS ALSO USING AGILITY BECAUSE KEY_SPD

if (key_hor != 0 || key_vert != 0){
    
    movement = movement.run;
    
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
    image_speed = key_spd*0.1
    
    hspd = lengthdir_x(key_spd,key_dir);
    vspd = lengthdir_y(key_spd,key_dir);
    
    face = scr_get_face(0,0,key_hor,key_vert);
    
    phy_position_x += hspd;
    phy_position_y += vspd*perspective;
}/* else {
    if (ObjectID){
        ObjectID.image_index = image_index
    }
}*/

if (key_roll){
/*
    image_index = 0;
    movement = movement.run;
    previous_state = state;
    state = scr_player_dash;
*/
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

if (key_pickup) {
    image_index = 0;
    movement = movement.pickup;
    previous_state = state;
    state = scr_player_pickup;
    exit;
}

if (key_groundpound){
    //pal_fx_blink( c_white, 1, 40, 20);
    zspd = 1;
    image_index = 0;
    movement = movement.prepjump;
    previous_state = state;
    state = scr_player_prepjump;
    exit;
}

if (key_punch){ //Could make punch and throw be the same key
    if (!ObjectID){
        image_index = 0;
        dir = key_dir //temp solution
        movement = movement.punch2;
        previous_state = state;
        state = scr_player_punch_two;
        exit;
    }
    else{
        if(object_get_name(ObjectID.object_index) == "dropoff") {
            var nearests = instance_nth_nearest(x,y,dropoff,2);
            var dist_to_middle = distance_to_point(room_width/2,room_height/2)
            if (distance_to_point(nearests.x,nearests.y) < 64 && nearests.phy_active || dist_to_middle > 130){
                scr_effect(spr_Block);
                exit;
            }
        }
        zspd = 0;
        image_index = 0;
        movement = movement.throw;
        previous_state = state;
        state = scr_player_prepthrow;
        exit;
    }
}
/*
var x1 = 0
var y1 = 0
var x2 = sprite_get_width(spr_Oasis2)*.75;
var y2 = 0;
var x3 = 0;
var y3 = sprite_get_height(spr_Oasis2)*.5;
if point_in_triangle(x, y, x1, y1, x2, y2, x3, y3){
   state = scr_player_swim;
}


/*
if(place_meeting(x,y,obj_water)) {
    state = scr_player_swim;
}
