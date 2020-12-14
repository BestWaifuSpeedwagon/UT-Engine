///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	var _h = 20 + irandom(2)*20;
	
	var _t = _h*2;
	
	
	var _b = instance_create_layer(obj_soul.box.x-10, obj_soul.box.y, "Attacks", atk_bonegap);
	_b.height = obj_soul.box.h;
	_b.velX = 5;
	_b.theta = pi;
	_b.gapPos = _h;
	_b.gapHeight = 14;
	
	_b = instance_create_layer(obj_soul.box.x2+10, obj_soul.box.y2, "Attacks", atk_bonegap);
	_b.height = obj_soul.box.h;
	_b.velX = -5;
	_b.theta = pi;
	_b.gapPos = _h;
	_b.gapHeight = 14;
	
	timer = _t;
	
	num++;
	if(num >= 4) timer = -200;
}
else if(timer == -1) instance_destroy();
else timer++;