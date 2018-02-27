///instance_nth_nearest(x, y, object, n);
var arg_x = argument[0];
var arg_y = argument[1];
var arg_obj = argument[2];
var arg_n = argument[3];
var list = ds_priority_create();
arg_n = clamp(arg_n, 1, instance_number(arg_obj));
var nearest = noone;
with (arg_obj)
{
    ds_priority_add(list, id, distance_to_point(arg_x, arg_y));
}
repeat (arg_n)
{
    nearest = ds_priority_delete_min(list);
}
ds_priority_destroy(list);
return nearest;
