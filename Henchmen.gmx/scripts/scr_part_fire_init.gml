
global.pt_fire = part_type_create();
var pt = global.pt_fire;

part_type_colour_mix(pt,c_maroon,c_yellow)
part_type_size(pt,1,1,0,0);
part_type_sprite(pt,spr_pixel,0,0,0);
part_type_life(pt,30,45);
part_type_blend(pt,1);
part_type_alpha1(pt,0.5);
part_type_direction(pt,80,100,0,1);
part_type_gravity(pt,0.01,90);
part_type_speed(pt,0,0.5,0,0.1);
