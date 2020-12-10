/// @description Move bar and calculate damage
if(keyboard_check_pressed(ord("Z")) && moving)
{
	moving = false;
	timer = 60;
	
	_dstFromCenter = 320 - abs(barX - 320);
		
	var damage;
	
	if(_dstFromCenter <= 12) damage = round((obj_stat.atk - mon.def + random(2)) * 2.2);
	else damage = round((obj_stat.atk - mon.def + random(2)) * (1 - _dstFromCenter/575) * 2);
		
	createSlice(damage);
}

t++;

if(moving)
{
	barX += 7;
	if(barX > obj_soul.box.x2)
	{
		createSlice(-1);
	}
}

//Destroyed by obj_dmgnum