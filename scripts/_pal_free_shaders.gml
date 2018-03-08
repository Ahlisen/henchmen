///_pal_free_shaders()

for(var i = ds_list_size(sPal_shaders)-1; i >= 0; i--)
{
    var item = sPal_shaders[| i];
    if (item > 0)
        ds_list_destroy(item);
}
ds_list_destroy(sPal_shaders)
