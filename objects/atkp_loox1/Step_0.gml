/// @description Regulat attacks
if(timer == next)
{
	var _x = irandom(100);
	
	instance_create_layer(choose(Box.x - _x, Box.x2 + _x), Box.y+irandom(Box.h), "Attacks", atk_loox1);
	
	next += irandom_range(20, 40);
}

if(timer > 240) instance_destroy();

timer++;