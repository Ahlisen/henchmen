///math_texture_power( pixel_count )
//Returns minimum power of texture that is needed to store provided number of pixels

return math_get_base(ceil(sqrt(argument0))-1)+1;
