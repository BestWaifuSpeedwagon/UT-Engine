/// @description Timer
Box.wantedW = 375;

obj_heartmove.changeColor(BLUE);

timer = 500;
num = 0;

AttackBonearea(-450, Box.y2, 500, -30, 2, 0);

var _p = instance_create_layer(-25, Box.y2-50, "Attacks", obj_platform);
_p.velX = 2;

_p = instance_create_layer(-200, Box.y2-50, "Attacks", obj_platform);
_p.velX = 2;

_p = instance_create_layer(-375, Box.y2-50, "Attacks", obj_platform);
_p.velX = 2;

AttackBonearea(-350, Box.y, 50, 40, 1.75, 0);