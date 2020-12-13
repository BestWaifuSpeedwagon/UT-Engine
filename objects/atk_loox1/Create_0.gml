/// @description Set values
// Inherit the parent event
event_inherited();

passthrough = true;
destroy = true;

damage = 4;

angle = random(pi*2); //Different angles for circles
_spd = random(0.05) + 0.05;

boundingAmount = 3;
bounding = [ new BoundingBox(), new BoundingBox(), new BoundingBox() ];

bounding[0].o.set(36/2, 36/2);
bounding[1].o.set(17/2, 17/2);
bounding[2].o.set(8/2, 8/2);

var _dir = pointDirection(x, y, obj_heartmove.x, obj_heartmove.y);

hspeed = cos(_dir)*2;
vspeed = sin(_dir)*2;