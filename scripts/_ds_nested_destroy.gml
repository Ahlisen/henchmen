///_ds_nested_destroy( ds_object, array_pos, array[ds_type_*])

var type = argument2[argument1];
var next = (argument1 + 1) < array_length_1d(argument2);
    
switch( argument1++ )
{
    case ds_type_list:
        if next
        for(var i = ds_list_size(argument0)-1;i >=0; i--)
            _ds_nested_destroy( argument0[| i], argument1, argument2 );
        ds_list_destroy(argument0);
    break;
    
    case ds_type_map:
        if next
        {
            var key = ds_map_find_first(argument0);
            while(!is_undefined(key))
            {
                var ds = argument0[? key];
                _ds_nested_destroy( ds, argument1, argument2 );
                key = ds_map_find_next(argument0, key);
            }
        }
        ds_map_destroy(argument0);
    break;
}
