state_text = 'Sleeping';

movement = movement.sleepy;
image_speed = 0.05;
job_index = 0;
show_rage = true;

if (alarm[0] == -1){
    scr_effect(spr_Z,0.05,60,4,1);
    alarm[0] = room_speed*3;
}
