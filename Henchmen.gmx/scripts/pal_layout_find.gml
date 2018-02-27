///pal_layout_find( name )L layout_id
//Returns layouts by its name. Only if you speficied a name for it of course
//Returns noone if no layout found

//Funny fact: every group have its own layout, named after it
//So if you have group "spr_Player" - you can find its layout with name "spr_Player"

var la = sPal_layouts_map[? argument0];
if is_undefined(la)
    return noone;
else
    return la;
