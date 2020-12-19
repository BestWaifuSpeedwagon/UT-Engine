///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	if(num % 3 == 2) AttackGasterBlaster(Box.x - 50, Box.y2 - 20, 0, 90, 30, 1, 0.5);
	
	if(num < 3)
	{
		AttackBone(Box.x2+10, Box.y2, 20, pi, -5, 0);
		AttackBone(Box.x2+100, Box.y2, Box.h-40, pi, -5, 0).color = AQUA;
	}
	else if(num < 6)
	{
		AttackBone(Box.x-10, Box.y2, 20, pi, 5, 0);
		AttackBone(Box.x-100, Box.y2, Box.h-40, pi, 5, 0).color = AQUA;
	}
	
	timer = 40;
	
	num++;
	if(num == 3) timer = 90;
	if(num >= 6) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;