///pal_layout_slot( slot_name/palette_sprite_index, max_color_number )
//Creates an named position in the layouts, and books max_color_number colors inside
//Palette with provided slot_name will go there automatically
//If not palette found - it will be left empty

//When you provide palette sprite instead of slot name - this sprite must be aleady mapped so its slot name is already known
//Also, you can't and don't need to set tag when providing sprites as slot name - tag used when mapping that palette will be used

var la = sPal_layout_creating;

var item = ds_list_create();
item[| sPal_laItem_fixed] = false;
item[| sPal_laItem_palette] = noone;
item[| sPal_laItem_offset] = la[| sPal_layout_size];
item[| sPal_laItem_slot] = _pal_get_slot_layout( argument0, la );

la[| sPal_layout_size] += argument1;
ds_list_add(la[| sPal_layout_slots], item);


//For internal usage
return item;
