///pal_map_tag( [tag] )
//Tags all future groups with those tag. It resets previousy setted tags
//If you won't provide arguments - it will simply won't tag anything after this

//Tags are used in many things, and allows you to group sprites
//It can help you applying some actions to whole bunch of groups, like apply one layouts to bunch of sprites with different tags

//As you can see, it's possible to apply few tags at the same time

if argument_count > 0
    sPal_tag = argument[0];
else
    sPal_tag = '';
