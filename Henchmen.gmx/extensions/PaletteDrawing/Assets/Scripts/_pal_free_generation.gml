#define _pal_free_generation
///_pal_free_generation()

ds_foreach(sPal_genPalMap, ds_type_map, false, _sprite_delete )
ds_map_destroy(sPal_genPalMap)

#define _sprite_delete
///_sprite_delete( sprite_index )
sprite_delete(argument0)