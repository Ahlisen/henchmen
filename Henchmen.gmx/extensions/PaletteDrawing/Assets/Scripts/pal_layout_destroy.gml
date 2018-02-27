///pal_layout_destroy( layout_id )

var items = argument0[| sPal_layout_slots];
for(var i = 0; i < ds_list_size(items); i++)
    ds_list_destroy(items[| i]);

ds_list_destroy(items);
ds_list_destroy(argument0);
