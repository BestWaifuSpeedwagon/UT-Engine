/// @description Draw myself
var _c;
switch(color)
{
	case RED:
		_c = c_red;
		break;
	case BLUE:
		_c = c_blue;
		break;
	case GREEN:
		_c = c_green;
		break;
}

draw_sprite_ext(sprite_index, inv % 6 < 3 ? 0 : 1, x, y, 1, 1, 0, _c, 1.0); //1 frame on 2 every 6 step