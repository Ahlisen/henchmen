
global.pt_footstep = part_type_create();
var pt = global.pt_footstep;

part_type_shape(pt,pt_shape_pixel);
part_type_size(pt,1,1,0,0);
part_type_life(pt,1,1);
part_type_sprite(pt,spr_Footstep,0,0,0);
//part_type_alpha1(pt,0.5);
