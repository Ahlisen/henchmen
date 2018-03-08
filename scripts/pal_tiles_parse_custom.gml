///pal_tiles_parse_custom( [depth, depth, ...])
//Call this at room start if you want to draw tiles using this system
//It will create a palette for every background group at provided layers and returns them as array
//If no layers provided - it will call pal_tiles_parse and returns 0

//DON'T FORGET TO DELETE THOSE PALETTES WHEN THERE ARE NO TILES USING THEM ANYMORE
//You can do it with pal_tiles_clear. No manual deletion, ok? You can do it, but don't call pal_tiles_clear then

//TIP:  You may want to call pale_tiles_parse first to be sure you applied palettes to all tiles, 
//      and then override palettes with this function for some layers

//TIP:  This function is useful when you want to apply different effects for different layers...
//      or maybe you place some level's part at some depth to apply some effect only to it

if argument_count = 0
{
    pal_tiles_parse();
    return 0;
}

var map = ds_map_create();
var result = 0;
var count = 0;
for(var lr = argument_count - 1; lr >= 0; lr --)
{
    var tiles = tile_get_ids_at_depth(argument[lr]);
    for(var i = array_length_1d(tiles) - 1; i >=0; i--)
    {
        var tl = tiles[i];
        var group =  _pal_map_get(sPal_map_background2group, tile_get_background(tl) );
        var pal = map[? group];
        if is_undefined(pal)
        {
            pal = pal_palette_create( group );
            map[? group] = pal;
            result[count ++] = pal;
        }
                
        tile_set_blend(tl, pal);
    }
}
ds_map_destroy(map);
return result;
