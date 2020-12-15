/// @description Create bonestab
dir = ct_argument.dir;
time = ct_argument.time;
height = ct_argument.height;

audio_play_sound(snd_b, 3, false);

boneArea = NULL;

_x = 0;
_y = 0;
_w = 0;
_h = 0;

switch(dir)
{
	case 0:
		_x = Box.x;
		_y = Box.y2;
		_w = Box.w;
		_h = height;
		break;
	case 1:
		_x = Box.x - height;
		_y = Box.y;
		_w = height;
		_h = Box.h;
		break;
	case 2:
		_x = Box.x;
		_y = Box.y - height;
		_w = Box.w;
		_h = height;
		break;
	case 3:
		_x = Box.x2;
		_y = Box.y;
		_w = height;
		_h = Box.h;
		break;
}