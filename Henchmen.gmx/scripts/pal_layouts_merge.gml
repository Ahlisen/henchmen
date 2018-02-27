///pal_layouts_merge( do_merge, layout, layout[, layout, ...] ): layout_id
//Merges two or more layouts
//When do_merge is true - slot palette positions will stay on same places
//When false - they will get added at the end
//Funny fact: if you provide only one argument - you will recieve a copy of layout

var la_new = pal_layout_begin();
var offset = 0;
for(var i = 1; i < argument_count; i++)
{
    var la = argument[i];
    la_new[| sPal_layout_size] += la[| sPal_layout_size] - 1;
    
    //Duplicating slot list
    var slots = la[| sPal_layout_slots];
    var slots_new = la_new[| sPal_layout_slots];
    for(var j = 0; j < ds_list_size(slots); j++)
    {
        var sourceItem = slots[| j];
        var newItem = ds_list_create();
        ds_list_copy(newItem, sourceItem);
        ds_list_add(slots_new, newItem);
        newItem[| sPal_laItem_offset] += offset;
        if (j = 0 && argument[0])
            newItem[| sPal_laItem_fixed] = true;
    }
    if !argument[0]
        offset += la[| sPal_layout_size] - 1;
}
return pal_layout_end();
