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

