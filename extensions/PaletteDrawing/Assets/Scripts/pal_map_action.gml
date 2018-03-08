#define pal_map_action
///pal_map_action( pAct_layout_*, group/tag, layout_id )
///pal_map_action( pAct_palette_*, group/tag, group/tag )
/*
Arguments are different depening on first argument's value
Sets specific layou for the group.
Layouts are automatically created for every tag, buf if you want to make some custom layouts - you can apply them with this function
MODES:
    pAct_layout_set_group:
        Changes layout for the group to provided one
    pAct_layout_add_group:
        Adds layouts to existing layouts for the group, merging them
    pAct_layout_merge_group:
        Merges group layout with provided layout. When merged, slots will stay on exact same positions they were before mering
        When merge used palettes may overlap, but this way you can map some image with layout_id, then merge this layouts with some other layouts
        and be sure color indexes will match sprites mapped with layout_id
    pAct_palette_{a}2{b}
        Coplies palettes used for mapping {a} to {b}. There are versions for groups and tags.
        Those are used when you have some global palettes in your game, which are used in a lot of groups.
    
    *_tag_*
        Same, as above, but applied to all groups under provided tag
    
*/

//Since all actions are paired - it's possible to check actions for tags this way
var groups = _pal_map_action_getGroups( argument1, argument0 mod 2 = pAct_layout_add_tag mod 2);

switch argument0
{
    case pAct_layout_set_group:
    case pAct_layout_set_tag:
        for(var i = array_length_1d(groups) - 1; i >= 0; i--)
            _pal_map_set(sPal_map_group2layout, groups[i], argument2);
        break;
    case pAct_layout_add_group:
    case pAct_layout_add_tag:
    case pAct_layout_merge_group:
    case pAct_layout_merge_tag:
        var foolproof = ds_map_create();
        var merge_type = argument0 = pAct_layout_merge_group || argument0 = pAct_layout_merge_tag;
        for(var i = array_length_1d(groups) - 1; i >= 0; i--)
        {
            var la = _pal_map_get(sPal_map_group2layout, groups[i]);
            var la_new = foolproof[? la];
            if is_undefined(la_new)
            {
                la_new = pal_layouts_merge(merge_type, la, argument2);
                ds_map_add(foolproof, la, la_new)
            }
            _pal_map_set(sPal_map_group2layout, groups[i], la_new);
        }
        ds_map_destroy(foolproof);
        break;
    case pAct_palette_group2group:
    case pAct_palette_group2tag:
    case pAct_palette_tag2group:
    case pAct_palette_tag2tag:
        var groups_other = _pal_map_action_getGroups( argument2, argument0 = pAct_palette_group2tag || argument0 = pAct_palette_tag2tag);
        var tag_saved = sPal_tag;
        pal_map_tag();
        for(var i = array_length_1d(groups) - 1; i >= 0; i--)
        {
            var gr_source = groups[i];
            var palettes = _pal_map_get( sPal_map_group2palettes, gr_source);
            
            for(var j = array_length_1d(groups_other) - 1; j >= 0; j--)
            {
                var gr_dest = groups_other[j];
                for(var k = ds_list_size(palettes) - 1; k >=0; k--)
                {
                    var pal = palettes[| k];
                    var slot = _pal_map_get(sPal_map_palette2slot, pal)
                    pal_map_palette( gr_dest, slot, pal);
                }
            }
        }
        pal_map_tag(tag_saved);
        break;
}

#define _pal_map_action_getGroups
///_pal_map_action_getGroups( group/tag, isTag ): array[groups]

var groups = 0;
if argument1
{
    var group_list = _pal_map_get(sPal_map_tag2groups, argument0);
    for(var i = ds_list_size(group_list) - 1; i >=0; i--)
        groups[i] = group_list[| i];
        
    
}
else
{
    groups[0] = _pal_get_group(argument0);
}

return groups;