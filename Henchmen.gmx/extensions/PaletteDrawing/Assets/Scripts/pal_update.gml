#define pal_update
///pal_update()
//Place this in draw begin. You can place it in the step event as well, but GM's documentation does not recommend that
//Lately, I encounted bug when drawing does not work in create event on second room load. That's why I moved everything to draw event

if !surface_exists(sPal_surface)
    _pal_surface_recreate( true );

if sPal_modified
{    
    _pal_update_tasks();
    _pal_update_palettes();
}


sPal_drawing_texture = noone;
sPal_shader_current = noone;

#define _pal_update_tasks
///_pal_update_tasks()

var tasks = sPal_tasks;
var tasksSize = ds_list_size(tasks);
if tasksSize = 0
    exit;
    
//First - sort tasks
var task_array = 0;
for(var i = 0; i < tasksSize; i++)
{
    var task = tasks[| i];
    var task_type = task[| sPal_task_type];
    var pos = array_length_2d(task_array, task_type);
    task_array[task_type, pos] = task;
}

//Execute tasks
for(var i = 0; i < array_height_2d(task_array); i++)
for(var j = 0; j < array_length_2d(task_array, i); j++)
{
    var task = task_array[i, j];
    switch( task[| sPal_task_type])
    {
        case sPal_taskType_generate:
            _pal_palette_generate( task[| sPal_task_group], task[| sPal_task_palette_sprite], task[| sPal_task_offset] )
        break;
        
        case sPal_taskType_layout:
            _pal_layout_complete( task[| sPal_task_layout_id]);
        break;    
        
        case sPal_taskType_map:
            _pal_map_group( task[| sPal_task_group]);
        break;
    }
    _pal_task_destroy( task );
}
ds_list_clear(tasks);
ds_map_clear(sPal_taskMap);

//Update pages if changed
var key = ds_map_find_first(sPal_indexedPages);
while(!is_undefined(key))
{
    var page = sPal_indexedPages[? key];
    var srf = page[| sPal_page_surface];
    
    if srf != noone
    {
        var back_existing = page[| sPal_page_background];
        var back_new = background_create_from_surface(srf,0,0,surface_get_width(srf), surface_get_height(srf), 0, 0);
        background_assign(back_existing, back_new);
        background_delete(back_new);
        surface_free(srf);
        page[| sPal_page_surface] = noone;
    }
    key = ds_map_find_next(sPal_indexedPages, page);
}


#define _pal_update_palettes
///_pal_update_palettes()

var modList = sPal_modifiedPalList;
var modList_size = ds_list_size(modList);
if modList_size = 0 
{
    sPal_modified = false;
    exit;
}

texture_set_interpolation(1)
//Updating palette's surfaces
for(var i = 0; i < modList_size; i++)
    _pal_palette_update( modList[| i] );

//Updating shared palette's surface
var refList = sPal_modifiedPalRef;
surface_set_target(sPal_surface)
d3d_set_projection_ortho(0, 0, surface_get_width(sPal_surface), surface_get_height(sPal_surface), 0);
shader_reset();
for(var i = 0; i < modList_size; i++)
{
    var palette = modList[| i];
    var palIndex = palette[| sPal_palette_index];
    var xx = (palIndex % sPal_line) * sPal_palette_width;
    var yy = (palIndex div sPal_line) * sPal_palette_height;
    d3d_transform_set_translation(xx, yy, 0);
    draw_set_blend_mode_ext(bm_one, bm_zero)
    draw_surface(palette[| sPal_palette_surface], 0, 0);
    draw_set_blend_mode(bm_normal)
    
    sPal_modifiedPalRef[# palIndex, 0] = 0;
    if sPal_modifiedPalRef[# palIndex, 1] <= 0
    {
        ds_list_delete(modList, i);
        i--;
        modList_size--;
    }    
    _pal_fx_apply(palette, palette[| sPal_palette_fx], noone);
    shader_reset();
}

for(var i = 0; i < ds_list_size(sPal_fx_tempTargets); i++)
    ds_list_destroy(sPal_fx_tempTargets[| i])
ds_list_clear(sPal_fx_tempTargets);

d3d_transform_set_identity();
draw_set_blend_mode(bm_normal)
surface_reset_target();


if modList_size <= 0
    sPal_modified = false;

texture_set_interpolation(0)