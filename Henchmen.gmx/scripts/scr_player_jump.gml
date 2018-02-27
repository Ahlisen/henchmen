///scr_player_groundpound();

//image_speed = 0.3;
//angle += 10;
//image_yscale = 1+sqrt(abs(zspd))*0.1;

if(animation_hit_frame(1) && zspd > 2) {
    image_index = 1;
}

if(animation_hit_frame(image_number-5) && z != 0) {
    image_speed = 0;
    image_index = image_number-5;
}

scr_xbox_controls();

if (z > 0) {
    z += zspd;
    zspd -= .3;
} else {
    var force = -zspd;
    z = 0;
    if(!used_punch) {
        if(force > 3){
            if(force > 6) {
                obj_view.shake = force/3;
                obj_view.alarm [0] = 6;
                
                repeat(force*2){
                    var gibs = instance_create(x,y,obj_gibs);
                    gibs.sprite_index = spr_gibs_sand;
                    gibs.zspd += force*0.2;
                }
                
                var crack = instance_create(x,y+sprite_yoffset,obj_crack);
                crack.team = team;
                crack.image_alpha = force*0.1;
                
                
            }
            
            vib = min(force*0.1,1);
            alarm[4] = 1;
        
            var shock = instance_create(x,y+sprite_yoffset,shockwave);
            shock.myDropoff = myDropoff;
            shock.team = team;
            shock.image_xscale = force*.3;
            shock.image_yscale = shock.image_xscale;
            shock.pwr = floor(force);
            shock.owner = id;
            shock.hit = 0;
            
            var amount = floor(force*2);
            for(var i = 0; i<amount; i++){
                var rand = (random(0.25)+0.75);
                var length = force*6*rand;
                var x_ = x+lengthdir_x(length,i*(360/amount));
                var y_ = y+sprite_yoffset+lengthdir_y(length*perspective*0.8,i*(360/amount));
                var sand = instance_create(x_,y_,anim_end);
                sand.image_speed = 0.25;
            }
            
            image_index = image_number-4;
            image_speed = 2 / power(force,1.5);
            used_punch = true;
            phy_active = true;
        } else {
            phy_active = true;
            state = scr_player_movement;
            exit;
        }
    }
    
    if(animation_hit_frame(image_number-1)) {
        phy_active = true;
        state = scr_player_movement;
        exit;
    }
}

if (key_hor != 0 || key_vert != 0){
    
    hspd = lengthdir_x(key_spd,key_dir);
    vspd = lengthdir_y(key_spd,key_dir);
    
    if(!place_meeting(x+hspd,y+vspd,perimeter) && z != 0){
        phy_position_x += hspd*1.3;
        phy_position_y += vspd*1.3*perspective;
    }
} else {
    key_spd = 0;
}
