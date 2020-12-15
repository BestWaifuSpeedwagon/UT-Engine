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
	case 260:
		dontGiveUp.spd = 6;
		dontGiveUp.passable = true;
		break;
}

if(timer > 200 && timer < 280) fade += 1/80;


if(dontGiveUp.update()){}

timer++;