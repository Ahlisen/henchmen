///_pal_page_destroy( page )

var back = argument0[| sPal_page_background];
var srf = argument0[| sPal_page_surface];
    
if surface_exists(srf)
    surface_free(srf);
background_delete(back);
    
ds_list_destroy(argument0);
