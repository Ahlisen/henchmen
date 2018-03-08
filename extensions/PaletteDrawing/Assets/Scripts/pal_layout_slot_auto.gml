///pal_layout_slot_auto( palette_sprite_index )
//Creates a slot in layout to fit provided sprite. 
//Slot name comes from previous mapping (you did it, right?)

var slot = pal_layout_slot(argument[0], 0);
slot[| sPal_laItem_palette] = argument0;
