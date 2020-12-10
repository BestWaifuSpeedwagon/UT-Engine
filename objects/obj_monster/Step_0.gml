/// @description Increment yy
if(killed)
{
	yy += 0.1;
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