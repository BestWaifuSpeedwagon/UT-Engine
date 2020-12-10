/// @description Begin animation then wait
if(image_index == image_number-1)
{
	timer = room_speed/2;
	visible = false;
}

if(timer > 0) timer--;
else if(timer == 0)
{
	mon.hurt = true;
	
	audio_play_sound(snd_damage, 0, false);
	
	ct_argument = { damage: damage };
	instance_create_layer(x, y, "Instances", obj_dmgnum);
	ct_argument = undefined;
	
	instance_destroy();
}