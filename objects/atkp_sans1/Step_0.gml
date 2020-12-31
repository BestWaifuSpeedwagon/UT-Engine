//!#import attack.sans.*

if(timer > 0) timer--;
else if(timer == 0)
{
	attack_sans_bonegap(Box.x-10, Box.y2, Box.h, pi, 20, 14, 3, 0);
	attack_sans_bonegap(Box.x2+10, Box.y2, Box.h, pi, 20, 14, -3, 0);
	
	timer = 40;
	
	num++;
	if(num >= 8) timer = -121;
}
else if(timer == -1) instance_destroy();
else timer++;