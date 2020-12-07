/// @description Move bar and calculate damage
if(keyboard_check_pressed(ord("Z")))
{
	moving = false;
	timer = 60;
}

if(moving)
{
	barX += 5;
	if(barX > 600)
	{
		moving = false;
		timer = 60;
	}
}
else
{
	if(timer > 0) timer--;
	else
	{
		_dstFromCenter = abs(barX - 320);
		
		var damage;
		
		if(_dstFromCenter <= 12) damage = round((obj_stat.atk - mon.def + random(2)) * 2.2);
		else damage = round((obj_stat.atk - mon.def + random(2)) * (1 - _dstFromCenter/575) * 2);
		
		if(_dstFromCenter > 360) damage = -1;
		
		ct_argument = { damage: damage };
		instance_create_layer(mon.x, mon.y, "Instances", obj_slice);
		ct_argument = undefined;
		
		instance_destroy();
	}
}