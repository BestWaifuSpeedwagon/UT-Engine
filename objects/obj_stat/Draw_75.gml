/// @description Draw gui surface and reset target
surface_reset_target();

draw_surface(guiSurf, random_range(-shake, shake), random_range(-shake, shake));

if(flick > 0) draw_clear(c_black);