///pal_palette_default_get( sprite_index/ group ): palette_index
//Retrives a global drawing palette for provided group/sprite
//It creates it if it does not exists and returns created if it does

var group = _pal_get_group(argument0);
var pal = sPal_def_palettes[? group];
if (is_undefined(pal))
{
    pal = pal_palette_create( group );
    sPal_def_palettes[? group] = pal;
}

return pal;