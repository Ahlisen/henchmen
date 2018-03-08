///scr_player_dash();

image_speed = 0.5;

if(round(image_index) == image_number){
    previous_state = scr_player_movement;
    state = scr_player_movement;
    image_index = 0;
    /*
    if (agility > 5){
        state = scr_player_movement;
    }
    else{
        image_xscale = -image_xscale;
        state = scr_life_attacked;
    }
    */
    
    exit;
}

if (key_hor == 0 && key_vert == 0){
    switch( face ){
        case face.r_up:
            key_hor = 1;
            break;
            
        case face.l_up:
            key_vert = -1;
            break;
            
        case face.l_down:
            key_hor = -1;
            break;
            
        case face.r_down:
            key_vert = 1;
            break;
    }
}

var after = instance_create(x,y,effect);
after.sprite_index = sprite_index;
after.image_index = image_index;
after.image_alpha = random(0.5);
after.image_speed = 0;
after.image_blend = image_blend;
after.depth = depth+2;
after.image_xscale = image_xscale;
after.alarm[0] = 10;

key_dir = point_direction(0,0,key_hor,key_vert);

//x += lengthdir_x(movespd+agility,key_dir);
//y += lengthdir_y(movespd+agility*.9,key_dir);

physics_apply_force(x,y,lengthdir_x(movespd,key_dir)*agility*30,lengthdir_y(movespd,key_dir)*agility*30*perspective);
