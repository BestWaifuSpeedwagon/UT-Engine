//!#import attack.sans.*

if(timer > 0) timer--;
else if(timer == 0)
{
	if(num < 3)
	{
		attack_sans_bone(Box.x2+10, Box.y2, 20, pi, -5, 0);
		attack_sans_bone(Box.x2+100, Box.y2, Box.h-40, pi, -5, 0).color = AQUA;
	}
	else if(num < 6)
	{
		attack_sans_bone(Box.x-10, Box.y2, 20, pi, 5, 0);
		attack_sans_bone(Box.x-100, Box.y2, Box.h-40, pi, 5, 0).color = AQUA;
	}
	
	timer = 40;
	
	num++;
	if(num == 3) timer = 90;
	if(num >= 6) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;