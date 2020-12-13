/// @description Put variables
event_inherited();

dir = pointDirection(x, y, obj_heartmove.x, obj_heartmove.y);
dir += random(pi/2)-pi/4;

damage = 4;

destroy = true;

bounding.o.set(8, 8); //Origin is relative