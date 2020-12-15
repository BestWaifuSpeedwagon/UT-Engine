///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	var _b = instance_create_layer(Box.x-10, Box.y2, "Attacks", atk_bonegap);
	_b.theta = pi;
	_b.height = Box.h;
	_b.velX = 3;
	_b.gapPos = 20;
	_b.gapHeight = 14;
	
	_b = instance_create_layer(Box.x2+10, Box.y2, "Attacks", atk_bonegap);
	_b.theta = pi;
	_b.height = Box.h;
	_b.velX = -3;
	_b.gapPos = 20;
	_b.gapHeight = 14;
	
	timer = 40;
	
	num++;
	if(num >= 8) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;