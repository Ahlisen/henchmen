///_pal_tasks_changed( palette_object, isAnimRef, ref_value )

var index = argument0[| sPal_palette_index];
var refs = sPal_modifiedPalRef[# index, 0] || sPal_modifiedPalRef[# index, 1];
if !refs
    ds_list_add( sPal_modifiedPalList, argument0 );
        
sPal_modifiedPalRef[# index, argument1] += argument2;
sPal_modified = true;
