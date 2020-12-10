/// @description Insérez la description iciè
// Vous pouvez écrire votre code dans cet éditeur
if(keyboard_check_pressed(ord("U")))
{
	startBattle([ mon_loox ], false, mus_battle1);
}

if(keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen( !window_get_fullscreen() );
}