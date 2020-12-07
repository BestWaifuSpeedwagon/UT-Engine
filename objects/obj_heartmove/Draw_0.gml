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
	default:
		_c = c_red;
}

//draw_sprite_ext(sprite_index, inv % 20 < 10 ? 0 : 1, x, y, 1, 1, 0, _c, 1.0); //1 frame on 2 every 6 step
draw_set_color(_c);
draw_point(x+8, y+8);