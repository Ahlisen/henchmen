///ds_foreach( ds_object, ds_type_*, isForKey, script<key/value>)
//Will call script with key/value as argument
//For lists, key is index. For maps - key

switch(argument1)
{
    case ds_type_map:
        var key = ds_map_find_first(argument0);
        while(!is_undefined(key))
        {
            if argument2
                script_execute(argument3, key)
            else
                script_execute(argument3, argument0[? key]);
                
            key = ds_map_find_next(argument0, key);
        }
    break;
    
    case ds_type_list:
        for( var i = ds_list_size(argument0) - 1; i >= 0; i--)
        {
            if argument2
                script_execute(argument3, i)
            else
                script_execute(argument3, argument0[| i]);
                
        }
    break;
}
