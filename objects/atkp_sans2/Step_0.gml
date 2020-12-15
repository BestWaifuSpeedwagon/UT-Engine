///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	if(num % 3 == 2) AttackGasterBlaster(Box.x - 50, Box.y2 - 20, 0, 90, 30, 1, 0.5);
	
	if(num < 3)
	{
		var _b = instance_create_layer(Box.x2+10, Box.y2, "Attacks", atk_bone);
		_b.height = 20;
		_b.velX = -5;
		_b.theta = pi;
		
		_b = instance_create_layer(Box.x2+100, Box.y2, "Attacks", atk_bone);
		_b.height = Box.h-40;
		_b.velX = -5;
		_b.theta = pi;
		_b.color = AQUA;
	}
	else if(num < 6)
	{
		var _b = instance_create_layer(Box.x-10, Box.y2, "Attacks", atk_bone);
		_b.height = 20;
		_b.velX = 5;
		_b.theta = pi;
		
		_b = instance_create_layer(Box.x-100, Box.y2, "Attacks", atk_bone);
		_b.height = Box.h-40;
		_b.velX = 5;
		_b.theta = pi;
		_b.color = AQUA;
	}
	
	timer = 40;
	
	num++;
	if(num == 3) timer = 90;
	if(num >= 6) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;