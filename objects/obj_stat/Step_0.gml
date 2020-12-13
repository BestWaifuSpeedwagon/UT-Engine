/// @description Insérez la description iciè
// Vous pouvez écrire votre code dans cet éditeur
if(keyboard_check_pressed(ord("U")))
{
	startBattle([ mon_sans ], true, mus_megalovania);
}

if(keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen( !window_get_fullscreen() );
}

if(!surface_exists(guiSurf)) guiSurf = surface_create(width*2, height*2);