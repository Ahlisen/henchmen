///scr_player_flyingpunch();
state_text = "flyingPunch";
movement = movement.punch;

scr_xbox_controls();

image_speed = 0.05*agility;

if(key_punch_re && image_index < 4) {
    image_index = 3;
    if(zspd < 1) {
        hspd = lengthdir_x(key_spd,key_dir);
        vspd = lengthdir_y(key_spd,key_dir);
        physics_apply_impulse(x,y,15*hspd,15*vspd*perspective);
    }
}

//If the animation is over
if (animation_hit_frame(image_number-1)){
    state = scr_player_movement;
    exit;
}

if(animation_hit_frame(2)){
    image_speed = 0;
    if(zspd < pwr){
        zspd += 0.05*pwr;
    } else {
        image_index = 3;
    }
}

//If the animation is at the punch
if (animation_hit_frame(4)){
    var damage = instance_create(x+lengthdir_x(10,key_dir),y+lengthdir_y(10,key_dir),parent_damage);
    damage.owner = id;
    damage.pwr = pwr+1;
    damage.image_xscale = image_xscale;

    if(zspd > 1){
        var xdir = lengthdir_x(5,key_dir);
        var ydir = lengthdir_y(5,key_dir);
        
        var fist = instance_create(x+xdir,y+ydir,obj_fist);
            fist.pwr = 1+zspd*1.5;
            fist.z = sprite_yoffset;
            fist.angle = key_dir;
            fist.owner = id;
        
        if(awake) {
            if(fire_counter >= 100){
                fist.flaming = true;
                fire_counter = 0;
            }
            fist.col = c_gray;
        } else {
            fist.flaming = false;
        }
        hspd = lengthdir_x(zspd,key_dir);
        vspd = lengthdir_y(zspd,key_dir);
        physics_apply_impulse(x,y,-8*hspd,-8*vspd*perspective);
    }
    
}

if (animation_hit_frame(5)){
    if (zspd > 1) {
        var xdir = lengthdir_x(5,key_dir);
        var ydir = lengthdir_y(5,key_dir);
        
        var fist = instance_create(x+xdir,y+ydir,obj_fist);
            fist.pwr = 1+zspd*1.5;
            fist.z = sprite_yoffset;
            fist.angle = key_dir+irandom(6)-3;
            fist.owner = id;
    }
}

if (animation_hit_frame(6)){
    if (zspd > 1) {
        var xdir = lengthdir_x(5,key_dir);
        var ydir = lengthdir_y(5,key_dir);
        
        var fist = instance_create(x+xdir,y+ydir,obj_fist);
            fist.pwr = 1+zspd*1.5;
            fist.z = sprite_yoffset;
            fist.angle = key_dir+irandom(6)-3;
            fist.owner = id;
    }
    zspd = 0;
}

if (key_hor != 0 || key_vert != 0){
    key_dir = point_direction(0,0,key_hor,key_vert);
    key_spd = min(1,abs(key_hor)+abs(key_vert))*movespd;
    face = scr_get_face(0,0,key_hor,key_vert);
}
