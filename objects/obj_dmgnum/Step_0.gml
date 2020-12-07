/// @description Move
y += velY;

velY += 0.16; //Gravity 10 per second / 60 step per second

if(velY > 6)
{
	obj_soul.waitingForDamage = false;
	obj_soul.startCombat();
	
	instance_destroy();
}