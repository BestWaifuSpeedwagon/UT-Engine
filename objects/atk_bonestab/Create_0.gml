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

_x1 = 0;
_y1 = 0;
_x2 = 0;
_y2 = 0;

switch(dir)
{
	case 3:
		_x = Box.x;
		_y = Box.y - height;
		_w = Box.w;
		_h = height;
		
		_x1 = Box.x;
		_y1 = Box.y;
		_x2 = Box.x2;
		_y2 = _y1+_h;
		break;
	case 1:
		_x = Box.x;
		_y = Box.y2;
		_w = Box.w;
		_h = -height;
		
		_x1 = Box.x;
		_y1 = Box.y2-height;
		_x2 = Box.x2;
		_y2 = Box.y2;
		break;
	case 2:
		_x = Box.x2;
		_y = Box.y;
		_w = -height;
		_h = Box.h;
		
		_x1 = Box.x2-height;
		_y1 = Box.y;
		_x2 = Box.x2;
		_y2 = Box.y2;
		break;
	case 0:
		_x = Box.x - height;
		_y = Box.y;
		_w = height;
		_h = Box.h;
		
		_x1 = Box.x2-_w;
		_y1 = Box.y;
		_x2 = Box.x2;
		_y2 = Box.y2;
		break;
}