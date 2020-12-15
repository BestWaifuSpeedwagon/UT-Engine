/// @description Draw gui surface and reset target
surface_reset_target();

draw_surface(guiSurf, hShake, vShake);

if(flick > 0) draw_clear(c_black);