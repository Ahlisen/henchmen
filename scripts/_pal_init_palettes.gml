///_pal_init_palettes( isUpdate )
//Inits lists of created draw palettes

globalvar sPal_palettes, sPal_index_stack, sPal_def_palettes;

if (!argument0)
{
    //List to store all palette surfaces and image list.
    //Surface is used to apply animated effects
    //Images are used to recreate all surfaces if they got destroyed by GPU
    var list = ds_list_create();
    for(var i = sPal_palette_number - 1; i >= 0; i--)
        list[| i] = noone;
    sPal_palettes = list;
    
    //Stack to track all added and deleted palette indexes
    sPal_index_stack = ds_stack_create();
    for(var i = sPal_palette_number - 1; i >= 0; i--)
        ds_stack_push(sPal_index_stack, i);
        
    sPal_def_palettes = ds_map_create();
}
else
{
    //Adding new free palette indexes
    var prevSize = ds_list_size(sPal_palettes);
    
    var list = sPal_palettes;
    for(var i = sPal_palette_number - 1; i >= prevSize; i--)
        list[| i] = noone;
    
    sPal_index_stack = ds_stack_create();
    for(var i = sPal_palette_number - 1; i >= prevSize; i--)
        ds_stack_push(sPal_index_stack, i);  
}
