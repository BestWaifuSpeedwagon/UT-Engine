/// @description Increment yy
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