/// @description Create bones on timer
if(t > 0) t--;
else
{
	var _b = AttackBone(x, y, height, theta, vel);
	
	amount--;
	if(amount <= 0) instance_destroy();
	
	t = timer;
}