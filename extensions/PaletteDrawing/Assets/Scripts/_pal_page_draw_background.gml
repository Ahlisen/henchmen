///_pal_page_draw_background( background_index )
//Draws background to corresponding duplicate of texture page
//Set indexing shader outside of this function

var tex = background_get_texture( argument0 );
var page = _pal_page_get( tex );    
var srf = page[| sPal_page_surface];   
var width = surface_get_width(srf);
var height = surface_get_height(srf);
var UVs = background_get_uvs(argument0);    

surface_set_target(srf);    
d3d_set_projection_ortho(0, 0, surface_get_width(srf), surface_get_height(srf), 0); 
//    if sPal_compatibilityMode
        draw_background( argument0, UVs[0] * width, UVs[1] * height)
//    else
//        draw_background( argument0, UVs[0] * width - UVs[4], UVs[1] * height - UVs[5])       
surface_reset_target();
