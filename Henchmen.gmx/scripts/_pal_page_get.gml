///_pal_page_get( texture_id ): indexed_page

//Textures are unique for every sprite now. Now workaround yet. You must have all indexing sprites at same texture page for now
var mapKey = 0;
var page = sPal_indexedPages[? mapKey];

if is_undefined(page)
{
    page = ds_list_create();
    var width = 1/texture_get_texel_width(argument0);
    var height = 1/texture_get_texel_height(argument0);
    var newSrf = surface_create(width, height);
    surface_set_target(newSrf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
    //Placeholder background
    var newBack = background_create_colour(1,1,c_black);
    
    page[| sPal_page_background] = newBack;
    page[| sPal_page_surface] = newSrf;
    
    sPal_indexedPages[? mapKey] = page;
}
else
{
    var tex = page[| sPal_page_surface];
    if !surface_exists(tex)
    {
        var width = texture_get_width(argument0);
        var height = texture_get_height(argument0);
        var newSrf = surface_create(width, height);
        surface_set_target(newSrf);
        draw_clear_alpha(c_black, 0);
        draw_background(page[| sPal_page_background], 0, 0);
        surface_reset_target();
        page[| sPal_page_surface] = newSrf;
    }
        
}

return page;
