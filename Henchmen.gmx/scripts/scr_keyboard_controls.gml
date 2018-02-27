if(team == 1){
    key_hor = keyboard_check(ord('D')) - keyboard_check(ord('A'));
    key_vert = keyboard_check(ord('S')) - keyboard_check(ord('W'));
    key_roll = keyboard_check_pressed(vk_space);
    key_punch = keyboard_check(ord('Q'));
    key_groundpound = keyboard_check_pressed(ord('R'));
    key_throw = keyboard_check_pressed(ord('E'));
}
