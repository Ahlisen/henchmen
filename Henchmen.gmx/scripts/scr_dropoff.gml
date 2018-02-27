///scr_dropoff(chest)

var chest = argument0;

chest.resources[ObjectID.type]+=ObjectID.worth;
pay = instance_create(ObjectID.x,ObjectID.y,homing_item);
pay.target = chest;
pay.sprite_index = ObjectID.sprite_index;
pay.image_speed = 0;
pay.image_index = ObjectID.image_index;

chest.image_index = 1;
chest.alarm[0] = room_speed*2;

ObjectID.alarm[0] = 1;
ObjectID.worth = 0;
ObjectID = noone;

held = false;
