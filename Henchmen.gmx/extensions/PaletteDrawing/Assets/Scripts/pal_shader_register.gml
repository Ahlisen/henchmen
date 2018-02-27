///pal_shader_register( shader_index )
//Registers drawing shader within system
//You must registed shaders you're going to use with pal_draw_begin_shader

if (_pal_shader_isRegistered(argument0))
{
    show_debug_message('Shader is already registered.');
    exit;
}

var uniforms = ds_list_create();
uniforms[| sPal_uniforms.indexedTexture] = shader_get_sampler_index(argument0, 'indexedTexture');
uniforms[| sPal_uniforms.palette] = shader_get_sampler_index(argument0, 'palette');
uniforms[| sPal_uniforms.lineSize] = shader_get_uniform(argument0, 'lineSize');
uniforms[| sPal_uniforms.texel] = shader_get_uniform(argument0, 'texel');

sPal_shaders[| argument0] = uniforms;
