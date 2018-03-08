///scr_dropoff_init();
for (var i = 0; i < 3; i++){
    var hench = instance_create(phy_position_x+(i*32)-32,phy_position_y+32,henchman);
    hench.team = team;
    hench.current_pal = team;
    hench.myChestID = id;
    hench.owner = owner.id;
    ds_list_add(henchList, hench.id);
}
alarm[11] = 1; //Set default pos around chest 
