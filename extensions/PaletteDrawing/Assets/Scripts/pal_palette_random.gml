///pal_palette_random( blend [, slot ])
//Changes line index of palette in specific slot to random one from existing.
//When blend is true - it will also blend nearby lines at random amount between each other
//If slot is not provided - it will change line of first image found (useful for 1-image palettes)

if argument_count >= 2
    pal_palette_slot( ifelse(argument[0], -2, -1), argument[1])
else
    pal_palette_slot( ifelse(argument[0], -2, -1));
