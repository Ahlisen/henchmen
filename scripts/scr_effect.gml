///scr_effect(sprite, spd, dth_time, offset, tar)
var temp_sprite = argument[0];
var spd = 0.1;
var dth_time = 30;
var offset = 4;
var tar = 2;
if (argument_count > 1) { spd = argument[1]; }
if (argument_count > 2) { dth_time = argument[2]; }
if (argument_count > 3) { offset = argument[3]; }
if (argument_count > 4) { tar = argument[4]; } 

var snore = instance_create(x,y-sprite_yoffset-offset,effect);
snore.sprite_index = temp_sprite;
snore.spd = spd;
snore.tar = tar;
snore.alarm[0] = 45;
