/// @description Events
switch(timer)
{
	case 60:
		audio_play_sound(snd_break1, 3, false);
		break;
	case 120:
		audio_play_sound(snd_break2, 3, false);
		repeat(3) instance_create_depth(_hx, _hy, 0, obj_heatshards);
		break;
	case 200:
		audio_play_sound(mus_gameover, 3, true);
		break;
	case 280:
		dontGiveUp.pause = false;
		break;
}

if(timer > 200 && timer < 280) fade += 1/80;
if(fadeOut) fade -= 1/80;

if(fade < -.1) 
{
	audio_stop_sound(mus_gameover);
	audio_sound_gain(mus_gameover, 1, 1);
	loadFile();
	
	instance_destroy();
}

if(dontGiveUp.update())
{
	fadeOut = true;
	audio_sound_gain(mus_gameover, 0, 750);
}
timer++;