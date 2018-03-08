///_pal_free_generation()

ds_foreach(sPal_genPalMap, ds_type_map, false, _sprite_delete )
ds_map_destroy(sPal_genPalMap)

