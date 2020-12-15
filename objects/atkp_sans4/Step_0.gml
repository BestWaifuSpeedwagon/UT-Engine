///@description Get those bones
if(timer > 0) timer--;
else if(timer == 0)
{
	
	num++;
	if(num >= 4) timer = -200;
}
else if(timer == -1) instance_destroy();
else timer++;