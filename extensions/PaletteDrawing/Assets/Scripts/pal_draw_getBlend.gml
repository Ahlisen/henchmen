///pal_draw_getBlend( palette_index, subpalette_index )
//Used when you have > 1 width drawing palettes, and want to draw non-stardard one
//That function will return image_blend you need to use to get other subpalette

return argument0 | (floor((255*argument1)/(sPal_palette_width-1)) << 16);
