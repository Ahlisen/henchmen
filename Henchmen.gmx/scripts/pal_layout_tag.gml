///pal_layout_tag( [tag] )
/*
Sets tags for all next slots in layout
Tags limit slot filling to palettes with slots provided. 
If no tags applied - any palette with corresponding slot can go there.

Why do you want to limit it in the first place? Few reasons:
1. Tags break layout into groups. Colors of different groups won't collapse no matter what since they are indexed separately.
That mean, that if you have sprites with same colors, but with different groups in one layouts - you still will be able to change those colors separately

2. You can have slots with same names inside one layout. That can be useful if you're making layout that is merged from 2 different layouts.
Like two characters interaction layout for example.
*/

if argument_count > 0
    sPal_layout_creating[| sPal_layout_currentTag] = argument[0]
else
    sPal_layout_creating[| sPal_layout_currentTag] = '';
