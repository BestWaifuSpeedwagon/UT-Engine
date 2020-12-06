/// @description Put variables
event_inherited();

dir = pointDirection(x, y, obj_heartmove.x, obj_heartmove.y);
dir += irandom(10)-5;

damage = 4;

destroy = true;

po.set(8, 8);