///_pal_map_setShader( texture_id, UVs, offset )
//Sets up palette indexing shader for specifis palette

var tex = argument0;
var UVs = argument1;
shader_set(sha_paletteMapper);
texture_set_stage(sha_paletteMapper_palette_texture, tex);

var texel_x = texture_get_texel_width(tex);
var texel_y = texture_get_texel_height(tex);
var texel_hx = texel_x * 0.5;
var texel_hy = texel_y * 0.5;

if !sPal_compatibilityMode
{
    UVs[0] -= texel_x * UVs[4];
    shader_set_uniform_f(sha_paletteMapper_start_index, (argument2+UVs[5]) * texel_y);
}
else
    shader_set_uniform_f(sha_paletteMapper_start_index, argument2 * texel_y);
shader_set_uniform_f(sha_paletteMapper_texel_height, texel_y);
shader_set_uniform_f(sha_paletteMapper_palette_height, texel_y*255.0);
shader_set_uniform_f(sha_paletteMapper_palette_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
