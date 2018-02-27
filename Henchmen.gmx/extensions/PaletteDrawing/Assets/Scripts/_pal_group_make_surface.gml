#define _pal_group_make_surface
///_pal_group_make_surface( group ): surface_id

var group = argument0;
var layout = _pal_map_get( sPal_map_group2layout, argument0 );
if is_undefined(layout)
    return noone;
    
var tag = _pal_map_get(sPal_map_group2tag, argument0 );
var slottag2palette = _pal_map_get(sPal_map_group2slots, argument0);

var srf  = surface_create(1, min(layout[| sPal_layout_size], sPal_palette_height));
surface_set_target(srf)
    d3d_set_projection_ortho(0, 0, surface_get_width(srf), surface_get_height(srf), 0);
    draw_clear_alpha(c_black, 0);
    var layout_items = layout[| sPal_layout_slots];
    for(var i = 0; i < ds_list_size(layout_items); i++)
    {
        var layout_item = layout_items[| i];
        var slottag = layout_item[| sPal_laItem_slot];  
        //Anti-color collapsing
        //if string_pos(tag, slottag ) != 1
        //    continue;      
        var spr = slottag2palette[? slottag];
        if !is_undefined(spr)
            draw_sprite_part(spr, 0, 0, 0, 1, sprite_get_height(spr), 0, layout_item[| sPal_laItem_offset]);
    }
surface_reset_target();


return srf;

#define _pal_group_make_surface_palette
///_pal_group_make_surface_palette( palette_object, recreate ): surface_id

var group_current = argument0[| sPal_palette_group];
var layout = _pal_map_get(sPal_map_group2layout, group_current);
var palette_slottags = argument0[| sPal_palette_slots];

argument0[| sPal_palette_layout] = layout;

var slottag2palette = _pal_map_get(sPal_map_group2slots, group_current);

//Returning a baked list with all sprites and line indexes set
var baked = argument0[| sPal_palette_baked];
if argument1
{
    var baked_map = argument0[| sPal_palette_baked_map];
    //Clearing existing list
    for(var i = 0; i < ds_list_size(baked); i++)
        ds_list_destroy(baked[| i]);
    ds_list_clear(baked);
    ds_map_clear(baked_map);
    //Filling empty list with data
    var layout_items = layout[| sPal_layout_slots];
    for(var i = 0; i < ds_list_size(layout_items); i++)
    {
        var layout_item = layout_items[| i];
        var slottag = layout_item[| sPal_laItem_slot];
        var pos = 0;
        
        var palItem = palette_slottags[? slottag];
        if !is_undefined(palItem)
        {
            var group_new = palItem[| sPal_palette_slot_group];
            if (group_new != group_current)
            {
                group_current = group_new;
                slottag2palette = _pal_map_get(sPal_map_group2slots, group_current);
            }
            pos = palItem[| sPal_palette_slot_line];
        }
        
        var spr = slottag2palette[? slottag];
        if !is_undefined(spr)
        { 
            var data = ds_list_create();
            data[| sPal_palBaked_offset] = layout_item[| sPal_laItem_offset];
            data[| sPal_palBaked_line] = pos;
            data[| sPal_palBaked_sprite] = spr;
            ds_list_add(baked, data)
            baked_map[? slottag] = data;
        }
    }
}

//Making a surface from baked list
var srf  = surface_create(sPal_palette_width, min(layout[| sPal_layout_size], sPal_palette_height));
surface_set_target(srf)
    d3d_set_projection_ortho(0, 0, surface_get_width(srf), surface_get_height(srf), 0);
    draw_clear_alpha(c_black, 0);
    _pal_palette_draw( argument0, 0, sPal_palette_width);    
surface_reset_target();

return srf;