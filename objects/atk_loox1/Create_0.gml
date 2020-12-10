/// @description Set values
// Inherit the parent event
event_inherited();

passthrough = true;
destroy = true;

damage = 4;

theta = 0;

var _dir = pointDirection(x, y, obj_heartmove.x, obj_heartmove.y);

hspeed = cos(_dir)*2;
vspeed = sin(_dir)*2;