///_pal_init_mapping()

//Creating connections maps
globalvar sPal_maps;
sPal_maps = ds_list_create();
for(var i = sPal_map_total - 1; i >= 0; i--)
    sPal_maps[| i] = ds_map_create();
    
globalvar sPal_tag;
sPal_tag = '';
    
//Initializign asset search subsystem
globalvar sPal_map_init;
sPal_map_init = false;

//UVs for surfaces
globalvar sPal_surface_UVs;
var UVs;
UVs[7] = 1;
UVs[0] = 0;
UVs[1] = 0;
UVs[2] = 1;
UVs[3] = 1;
UVs[4] = 0;
UVs[5] = 0;
UVs[6] = 1;
sPal_surface_UVs = UVs;
