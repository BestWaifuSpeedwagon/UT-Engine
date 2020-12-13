/// @description Begin animation then wait
if(image_index == image_number-1)
{
	timer = room_speed/2;
	visible = false;
}

if(timer > 0) timer--;
else if(timer == 0)
{
	ct_argument = { damage: damage, monster: monster };
	instance_create_layer(x, y + mon.height/2, "Instances", obj_dmgnum);
	ct_argument = undefined;
	
	instance_destroy();
}