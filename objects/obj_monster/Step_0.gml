/// @description Increment yy, dodge, hurt timer
if(killed)
{
	fraction += 0.01;
	
	for(i = x-width/2; i <= x+width/2; i+=2)
	{
		if(random(1) < 0.8) continue;
		
		var _y = y - height * (1-fraction);
		
		part_particles_create(ptSystem, i, _y + random(6)-3, ptDust, 1);
	}
	
	if(fraction > 1)
	{
		instance_destroy();
	}
}

if(hurt)
{
	if(hurtTimer < 60) hurtTimer++;
	else
	{
		hurt = false;
		hurtTimer = 0;
	}
}

if(dodging < 0)
{
	var startX = x-dodging;
	
	dodgingTimer += 1/room_speed;
	
	dodging = lerp(0, -200, dodgingTimer*dodgingTimer*(3-2*dodgingTimer));
	
	if(dodging >= 0) 
	{
		dodging = 0;
		dodgingTimer = 0;
	}
	
	x = startX + dodging;
}