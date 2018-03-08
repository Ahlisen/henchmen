///_pal_page_draw_sprite( sprite_index )
//Draws sprite to corresponding duplicate of texture page
//Set indexing shader outside of this function

var img_num = sprite_get_number(argument0);
var off_x = sprite_get_xoffset(argument0);
var off_y = sprite_get_yoffset(argument0);
        
for(var i = 0; i < img_num; i++)
{
    var tex = sprite_get_texture( argument0, i);
    var page = _pal_page_get( tex );    
    var srf = page[| sPal_page_surface];   
    var width = surface_get_width(srf);
    var height = surface_get_height(srf);
    var UVs = sprite_get_uvs(argument0, i);    
    
    surface_set_target(srf);     
    d3d_set_projection_ortho(0, 0, surface_get_width(srf), surface_get_height(srf), 0);
        if sPal_compatibilityMode
            draw_sprite( argument0, i, UVs[0] * width + off_x, UVs[1] * height + off_y)
        else
            draw_sprite( argument0, i, UVs[0] * width + off_x - UVs[4], UVs[1] * height + off_y - UVs[5])       
    surface_reset_target();
    
    
}
