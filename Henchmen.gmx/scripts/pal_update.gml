///pal_update()
//Place this in draw begin. You can place it in the step event as well, but GM's documentation does not recommend that
//Lately, I encounted bug when drawing does not work in create event on second room load. That's why I moved everything to draw event

if !surface_exists(sPal_surface)
    _pal_surface_recreate( true );

if sPal_modified
{    
    _pal_update_tasks();
    _pal_update_palettes();
}


sPal_drawing_texture = noone;
sPal_shader_current = noone;

