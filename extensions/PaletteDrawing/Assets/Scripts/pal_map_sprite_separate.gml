///pal_map_sprite_separate( sprite_index[, sprite_index, ...])
//This is a simple function that will map all provided sprites as separate groups.. and also generate palettes for them
//Function for times you just want it to work

for(var i = 0; i < argument_count; i++)
{
    var name = sprite_get_name(argument[i]);
    pal_map_sprite( name, argument[i]);
    pal_generate( name );
}
