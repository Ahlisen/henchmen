///ds_nested_destroy( ds_object, ds_type_*[, ds_type_*, ...])
//Destroye nested ds structures

//Example: ds_nested_destroy( lst, ds_type_list, ds_type_map )
//This will loop though lst ds_list, will threat all its values as ds_maps and destroy it, and will destory list itself after that

var array;
for(var i = 1; i < argument_count; i++)
    array[i - 1] = argument[i];
    
_ds_nested_destroy(argument[0], 0, array);

