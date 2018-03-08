///pal_palette_destroy( palette_index )

var pal = sPal_palettes[| argument0];
if pal = noone
{
    show_debug_message('Palette destroy failed. Palette with index '+string(argument0)+' does not exists.');
    exit;
}
    
surface_free( pal[| sPal_palette_surface ]);
var map = pal[| sPal_palette_slots ];
var key = ds_map_find_first(map)
while(!is_undefined(key))
{
    ds_list_destroy(map[? key])
    key = ds_map_find_next(map, key);
}
ds_map_destroy(pal[| sPal_palette_slots ]);
ds_foreach(pal[| sPal_palette_fx ], ds_type_list, false, _pal_fx_destroy )
ds_list_destroy(pal[| sPal_palette_fx ]);
ds_nested_destroy(pal[| sPal_palette_baked], ds_type_list, ds_type_list)
ds_map_destroy(pal[| sPal_palette_baked_map]);

ds_list_destroy(pal);

//Index is now available for use
sPal_palettes[| argument0] = noone;
ds_stack_push(sPal_index_stack, argument0);
