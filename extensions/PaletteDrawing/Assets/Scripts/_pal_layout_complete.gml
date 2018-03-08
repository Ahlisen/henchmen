///_pal_layout_complete( layout_id )
//Finished configurating layout by setting all layout offsets to proper places

var laList = argument0[| sPal_layout_slots];
var offset = 0;
for(var i = 0; i < ds_list_size(laList); i++)
{
    var item = laList[| i];
    if item[| sPal_laItem_fixed]
        offset = 0;
        
    item[| sPal_laItem_offset] += offset;
    if item[| sPal_laItem_palette] != noone
    {
        offset += sprite_get_height(item[| sPal_laItem_palette]);
        item[| sPal_laItem_palette] = noone;
    }
    argument0[| sPal_layout_size] += offset;
}
