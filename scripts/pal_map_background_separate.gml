///pal_map_background_separate( background_index[, background_index, ...])
//This is a simple function that will map all provided backgrounds as separate groups.. and also generate palettes for them
//Function for times you just want it to work

for(var i = 0; i < argument_count; i++)
{
    var name = background_get_name(argument[i]);
    pal_map_background( name, argument[i]);
    pal_generate( name );
}
