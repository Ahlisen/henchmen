///scr_player_prepthrow();
image_speed = 0.2;
scr_xbox_controls();

if(key_punch_re) {
    //Throw your henchman
    image_index = 0;
    
    with(ObjectID){
        image_alpha = 1;
        phy_active = true;
        phy_speed_x = 0;
        phy_speed_y = 0;
        phy_position_x = owner.x+owner.hspd*10;
        phy_position_y = owner.y+owner.vspd*10*perspective;
        
        if(object_get_name(object_index) == "dropoff") {
            main_controller.players_ready++;
            if(main_controller.players_ready == main_controller.players) {
                with(dropoff) {
                      script_execute(scr_dropoff_init);
                }
                with(night_controller) {
                    show_rounds = true;
                    alarm[2] = room_speed*4;
                    alarm[0] = room_speed*dayLength;
                    //instance_deactivate_all(night_controller);
                }
            }
            z = 0;
        } else  {
            //Henchman throw
            var mp = owner.pwr;
            var mh = owner.hspd;
            var mv = owner.vspd;
            var zs = owner.zspd;
            physics_apply_impulse(x, y, zs*(1*mh+mh*mp*3), zs*(1*mv+mv*mp*3)*perspective);
            if(object_get_name(object_index) == "henchman") {
                face = scr_get_face(0,0,phy_speed_x,phy_speed_y);
                state = scr_hench_search_source;
                held = true; //cant pick up while flying
                roll = 1;
            } else {
                held = false;
                zspd = owner.zspd*0.5;
                owner = noone;
            }
        }
    }
    physics_apply_impulse(x,y,-hspd*10,-vspd*10);
    ObjectID = noone;
    zspd = 0;
    image_index = 0;
    state = scr_player_movement;
    exit;
}


if(round(image_index) == image_number){
    image_speed = 0;
} else {
    zspd += 0.2;
}

if (key_hor != 0 || key_vert != 0){

    if (object_get_name(ObjectID.object_index) == "henchman") {
        ObjectID.movement = movement.fly;
        ObjectID.face = face;
    }

    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
    
    hspd = lengthdir_x(key_spd,key_dir);
    vspd = lengthdir_y(key_spd,key_dir);
    
    face = scr_get_face(0,0,key_hor,key_vert);
    var offset = 0; 
    
    ObjectID.phy_position_x = phy_position_x-hspd*zspd;
    ObjectID.phy_position_y = offset+phy_position_y-vspd*zspd;
    ObjectID.z = offset+norm_sprite_yoffset+z;
    ObjectID.image_xscale = image_xscale;
    ObjectID.depth = depth-12;
    
} else {
    key_spd = 0;
}
