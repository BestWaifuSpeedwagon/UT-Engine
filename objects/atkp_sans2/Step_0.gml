///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	if(num % 2 == 0) AttackGasterBlaster(0, 0, obj_soul.box.x - 50, obj_soul.box.y2 - 20, 0, 60, 10, 1, 0.5);
	
	if(num < 3)
	{
		var _b = instance_create_layer(obj_soul.box.x2+10, obj_soul.box.y2, "Attacks", atk_bone);
		_b.height = 20;
		_b.velX = -5;
		_b.theta = pi;
		
		_b = instance_create_layer(obj_soul.box.x2+100, obj_soul.box.y2, "Attacks", atk_bone);
		_b.height = obj_soul.box.h-40;
		_b.velX = -5;
		_b.theta = pi;
		_b.color = AQUA;
	}
	else if(num < 6)
	{
		var _b = instance_create_layer(obj_soul.box.x-10, obj_soul.box.y2, "Attacks", atk_bone);
		_b.height = 20;
		_b.velX = 5;
		_b.theta = pi;
		
		_b = instance_create_layer(obj_soul.box.x-100, obj_soul.box.y2, "Attacks", atk_bone);
		_b.height = obj_soul.box.h-40;
		_b.velX = 5;
		_b.theta = pi;
		_b.color = AQUA;
	}
	
	timer = 40;
	
	num++;
	if(num == 3) timer = 70;
	if(num >= 6) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;