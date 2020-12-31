/// @description Draw gui surface and reset target
surface_reset_target();

draw_surface_stretched(guiSurf, random_range(-shake, shake), random_range(-shake, shake), 640, 480);

if(flick > 0) draw_clear(c_black);