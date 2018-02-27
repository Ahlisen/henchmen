///pal_map_auto( sprite/background_name_start - used as "group"[, do_generate_palette = true] )
//This is a powerful system that will automatically handle sprite mapping and layout creations
//It will find all your sprites and palettes by the beginning of sprites' names

//Warning: it's a bit slow at startup since it needs to find all sprites by their names.
//If you really care about performance - you may consider using pal_map_sprite and pal_map_palette functions.
//Though, while game is still in development - it may be better to use this function.

//If do_generate_palette is true - it will also generate a palette for all found images if no palette found.
//Not really a recommended practice to use palette generator, but good for testing purposes.

//Initializing search subsystem only if this function used
if sPal_map_init = false
{
    asset_search_init();
    sPal_map_init = true;
}

var assets = asset_search_find( argument[0] );
if is_undefined(assets)
    exit;
    
var types = assets[0];
var num = ds_list_size(types);
if num = 0
    exit;
var indexes = assets[1];
    
var havePalettes = false;
for(var i = 0; i < num; i++)
{
    var index = indexes[| i];
    var type = types[| i];
    
    if type = asset_sprite
        name = sprite_get_name(index);
    else
        name = background_get_name(index);
        
    var palTag = string_pos(sPal_palTag, name);
    if palTag = 0
    {
        if type = asset_sprite
            pal_map_sprite( argument[0], index);
        else
            pal_map_background( argument[0], index);
    }
    else
    {
        if type = asset_background
        {
            show_debug_message("Palette can't be a background!")
            continue;
        }
        
        havePalettes = true;
        name = string_delete(name, 1, palTag + string_length(sPal_palTag)-1);
        if string_pos('_', name) = 1
            name = string_delete(name, 1, 1);
        pal_map_palette( argument[0], name, index );
    }
}

if (!havePalettes)
{
    var gen = true;
    if argument_count >= 2
        gen = argument[1];
    if gen
        pal_generate(argument[0])
}
