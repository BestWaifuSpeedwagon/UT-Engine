/// @description Various actions
#region Camera
if(flick > 0) flick--;
else if(flick == 0)
{
	audio_play_sound(snd_noise, 3, false);
	
	flick = -1;
	
	if(pauseAll)
	{
		audio_resume_all();
		pauseAll = false;
	}
}

if(shake > 0) shake -= shake/10;

if(!surface_exists(guiSurf)) guiSurf = surface_create(width*2, height*2);

if(keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen( !window_get_fullscreen() );
}

#endregion

if(keyboard_check_pressed(ord("U")))
{
	startBattle([ mon_sans ], true, mus_megalovania, atkp_sansIntro);
}