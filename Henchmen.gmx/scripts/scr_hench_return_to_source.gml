state_text="Return to source";

if (distance_to_point(SourceID.x,SourceID.y-norm_sprite_yoffset+2) < 1){
    phy_position_x = SourceID.x;
    phy_position_y = SourceID.y-norm_sprite_yoffset+2;
    speed = 0;
    state = scr_hench_progress;
    exit;
}

if (SourceID){
    scr_face_and_move(x,y,SourceID.x,SourceID.y-norm_sprite_yoffset+2);
}
