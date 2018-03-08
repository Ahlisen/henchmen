///scr_get_face(xx,yy,x_axis,y_axis)
var xx = argument[0];
var yy = argument[1];
var x_axis = argument[2];
var y_axis = argument[3];

var dir = point_direction(xx,yy,x_axis,y_axis);

var face = floor(dir/90);

if (face = 4) face = 3;

if (face == 1 || face == 2) image_xscale = -1; else image_xscale = 1;

return face
