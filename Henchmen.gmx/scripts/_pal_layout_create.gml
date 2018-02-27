///_pal_layout_create()

var la = ds_list_create();
la[| sPal_layout_size] = 1; //Number of colors in layout. Starts from 1 since there is always a transparent color 0
la[| sPal_layout_slots] = ds_list_create();
la[| sPal_layout_currentTag] = '';
la[| sPal_layout_name] = '';

return la;
