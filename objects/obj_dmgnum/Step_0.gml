/// @description Move
y += velY;

velY += 0.16; //Gravity 10 per second / 60 step per second

if(velY > 6)
{
	obj_soul.waitingFor.damage = false;
	obj_soul.startSpeech();
	
	instance_destroy(obj_target);
	instance_destroy();
}

originalHp = lerp(originalHp, mon.hp, 0.05);