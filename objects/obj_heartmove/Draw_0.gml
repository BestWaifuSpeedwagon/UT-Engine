/// @description Draw myself
var _rot = 0;
switch(color)
{
	case BLUE:
		_rot = -radtodeg(gravityDir)+90;
		break;
}

draw_sprite_ext(sprite_index, inv % 20 < 10 ? 0 : 1, x, y, 1, 1, _rot, color, 1.0); //1 frame on 2 every 6 step