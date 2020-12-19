///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	var _h = 20 + irandom(2)*20;
	
	var _t = 60 + _h - 20;
	var _dist = irandom(300);
	
	var _x = Box.x-10-_dist;
	AttackBonegap(_x, Box.y2, Box.h, pi, _h, 14, abs(_x-Box.cx)/_t, 0);
	
	_dist = irandom(300);
	
	_x = Box.x2+10+_dist;
	AttackBonegap(_x, Box.y2, Box.h, pi, _h, 14, -abs(_x-Box.cx)/_t, 0);
	
	timer = _t;
	
	num++;
	if(num >= 4) timer = -200;
}
else if(timer == -1) instance_destroy();
else timer++;