/// @description Create bonestab
dir = ct_argument.dir;
time = ct_argument.time;
height = ct_argument.height;
destroy = ct_argument.destroy;

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
	case 0:
		_x = Box.fx2 + 30;
		_y = Box.fy1;
		_w = height + 30;
		_h = Box.fh;
		
		_x1 = Box.fx2-height;
		_y1 = Box.fy1;
		_x2 = Box.fx2;
		_y2 = Box.fy2;
		break;
	case 1:
		_x = Box.fx1;
		_y = Box.fy2 + 30;
		_w = Box.fw;
		_h = height + 30;
		
		_x1 = Box.fx1;
		_y1 = Box.fy2-height;
		_x2 = Box.fx2;
		_y2 = Box.fy2;
		break;
	case 2:
		_x = Box.fx1 - 30;
		_y = Box.fy1;
		_w = -height - 30;
		_h = Box.fh;
		
		_x1 = Box.fx1;
		_y1 = Box.fy1;
		_x2 = Box.x+height;
		_y2 = Box.fy2;
		break;
	case 3:
		_x = Box.fx1;
		_y = Box.fy1 - height - 30;
		_w = Box.fw;
		_h = -height - 30;
		
		_x1 = Box.fx1;
		_y1 = Box.fy1;
		_x2 = Box.fx2;
		_y2 = Box.fy1+height;
		break;
}