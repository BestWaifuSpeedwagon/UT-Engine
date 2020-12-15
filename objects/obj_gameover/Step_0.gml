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
		audio_play_sound(mus_gameover, 3, false);
		break;
}

if(timer > 200 && timer < 260) fade += 1/60;

timer++;