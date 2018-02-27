///scr_remove_from_henchList(id,myChestID)

var removed = argument0;
var chest = argument1;

var h_size = ds_list_size(chest.henchList);

for(var i = 0; i < h_size; i++){
    var cur = chest.henchList[| i];
    if(cur == removed){
        ds_list_delete(chest.henchList,i);
        //scr_effect(spr_Henchman2);
    }
}
