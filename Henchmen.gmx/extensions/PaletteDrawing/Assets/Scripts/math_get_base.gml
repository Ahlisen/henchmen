///math_get_base( value )
//Returns log2 base of the number
//Value examples:
//256 - 8
//255 - 7
//128 - 7
//2 - 1

var r = -1;
do
{
    argument0 = argument0 >> 1;
    r++;
}
until(!argument0)
    
return r;
