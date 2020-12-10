/// @description Regulat attacks
if(timer == next)
{
	var _x = irandom(100);
	
	instance_create_layer(choose(obj_soul.box.x - _x, obj_soul.box.x2 + _x), obj_soul.box.y+irandom(obj_soul.box.h), "Attacks", atk_loox1);
	
	next += irandom_range(20, 40);
}

if(timer > 240) instance_destroy();

timer++;