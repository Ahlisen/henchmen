///_pal_init_shaders()

globalvar sha_paletteMapper_palette_texture, sha_paletteMapper_texel_height, sha_paletteMapper_palette_UVs, sha_paletteMapper_palette_height, sha_paletteMapper_start_index;
sha_paletteMapper_palette_texture = shader_get_sampler_index(sha_paletteMapper, 'palette_texture');
sha_paletteMapper_texel_height = shader_get_uniform(sha_paletteMapper, 'texel_height');
sha_paletteMapper_palette_height = shader_get_uniform(sha_paletteMapper, 'palette_height');
sha_paletteMapper_palette_UVs = shader_get_uniform(sha_paletteMapper, 'palette_UVs');
sha_paletteMapper_start_index = shader_get_uniform(sha_paletteMapper, 'start_index');

enum sPal_uniforms
{
    indexedTexture = 0,
    palette = 1,
    lineSize = 2,
    texel = 3
}

globalvar sPal_shaders, sPal_shader_common, sPal_shader_current;
sPal_shaders = ds_list_create();
pal_shader_register(sha_paletteDrawer);
sPal_shader_common = sPal_shaders[| sha_paletteDrawer];
sPal_shader_current = noone;
