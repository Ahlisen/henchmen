///pal_draw_begin([shader_index])
//At most part, this only sets shader for drawing
//Still, try to call this and pal_draw_end only once per frame! This will save you a lot of FPS

//If argument is provided - it will use that shader for drawing

var sdr = sha_paletteDrawer;
if argument_count > 0
    sdr = argument[0];
shader_set(sdr);

//Comment this out if you're sure to register all shaders beforehand
//I placed it only as foolproof
if (!_pal_shader_isRegistered(sdr))
    pal_shader_register(sdr)

if (sPal_shader_current != sdr || sPal_drawing_texture = noone)
{
    var key = ds_map_find_first(sPal_indexedPages);
    var page = sPal_indexedPages[? key];
    
    var uniforms = sPal_shaders[| sdr];
       
    shader_set_uniform_f(uniforms[| sPal_uniforms.lineSize], sPal_shader_width, sPal_shader_height)
    shader_set_uniform_f(uniforms[| sPal_uniforms.texel], sPal_shader_texel[0], sPal_shader_texel[1])
    texture_set_stage( uniforms[| sPal_uniforms.indexedTexture], background_get_texture(page[| sPal_page_background]));
    texture_set_stage( uniforms[| sPal_uniforms.palette], surface_get_texture(sPal_surface));
    texture_set_interpolation(false);
    texture_set_interpolation_ext(uniforms[| sPal_uniforms.palette], true);
    sPal_drawing_texture = page;
    sPal_shader_current = sdr;
}
