///pal_generate( group[, offset = 0] ): sprite_index
//Generates palette for existing group.
//WARNING: sprite_index returned will become valid only after update function is called

var group = argument[0];
var spr = sprite_create_from_surface(sPal_surface, 0, 0, 1, 1, 0, 0, 0, 0);
var task = _pal_task_create(sPal_taskType_generate, group);
task[| sPal_task_palette_sprite] = spr;
if argument_count >= 2
    task[| sPal_task_offset] = argument[1];
    
pal_map_palette( group, '', spr);

sPal_genPalMap[? group] = spr;

return spr;
