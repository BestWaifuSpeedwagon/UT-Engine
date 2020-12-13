///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	var _b = instance_create_layer(obj_soul.box.x-10, obj_soul.box.y, "Attacks", atk_bone);
	_b.height = 100;
	_b.velX = 3;
	
	_b = instance_create_layer(obj_soul.box.x-10, obj_soul.box.y2, "Attacks", atk_bone);
	_b.height = 20;
	_b.theta = pi;
	_b.velX = 3;
	
	_b = instance_create_layer(obj_soul.box.x2+10, obj_soul.box.y, "Attacks", atk_bone);
	_b.height = 100;
	_b.velX = -3;
	
	_b = instance_create_layer(obj_soul.box.x2+10, obj_soul.box.y2, "Attacks", atk_bone);
	_b.height = 20;
	_b.theta = pi;
	_b.velX = -3;
	
	timer = 40;
	
	num++;
	if(num >= 8) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;