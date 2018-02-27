///pal_tiles_parse()
//Call this at room start if you want to draw tiles using this system
//It will apply default palettes to all tiles in the room
//All default palettes are accessable for you, so you can apply effects of change palette lines later if you want

var tiles = tile_get_ids();
for(var i = array_length_1d(tiles) - 1; i >=0; i--)
{
    var tl = tiles[i];
    var pal = pal_palette_default_get_back( tile_get_background(tl) );
    
    tile_set_blend(tl, pal);
}
