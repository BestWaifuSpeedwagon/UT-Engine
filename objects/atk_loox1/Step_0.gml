/// @description Update bounding box
angle += _spd;

bounding[0].p1.set(x - 18, y - 18);
bounding[0].p2.set(x + 18, y + 18);

var _x = x + cos(angle)*26.5,
	_y = y + sin(angle)*26.5;

bounding[1].p1.set(_x - 8.5, _y - 8.5);
bounding[1].p2.set(_x + 8.5, _y + 8.5);

_x += cos(angle)*12.5;
_y += sin(angle)*12.5;

bounding[2].p1.set(_x - 4, _y - 4);
bounding[2].p2.set(_x + 4, _y + 4);