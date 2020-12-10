/// @description Draw myself
draw_circle(x, y, 6, true);

var _x = x + cos(theta)*6,
	_y = y + sin(theta)*6;

draw_circle(_x, _y, 4, true);

_x += cos(theta)*4;
_y += sin(theta)*4;

draw_circle(_x, _y, 3, true);