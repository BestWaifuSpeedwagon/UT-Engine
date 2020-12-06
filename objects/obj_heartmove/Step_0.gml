/// @description Move
#region Movement
if(visible)
{
	switch(color)
	{
		case RED:
			var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
			var vspd = keyboard_check(vk_down) - keyboard_check(vk_up);
		
			x += hspd*4;
			y += vspd*4;
			break;
	}
}

x = clamp(x, obj_soul.box.x, obj_soul.box.x2-16); //-16 for the sprite width/height
y = clamp(y, obj_soul.box.y, obj_soul.box.y2-16);

#endregion
#region Collision
if(inv == 0 || obj_soul.karma)
{
	var _atkCount = instance_number(obj_attack);
	for(i = 0; i < _atkCount; i++)
	{
		var _atk = instance_find(obj_attack, i);
	
		if(pointInRectangleRotated(x+8, y+8, _atk.p1.x, _atk.p1.y, _atk.p2.x, _atk.p2.y, _atk.po.x, _atk.po.y, _atk.theta))
		{
			obj_stat.hp -= _atk.damage;
			inv = room_speed;
			if(_atk.destroy) instance_destroy(_atk);
			break;
		}
	}
}
else inv--;

#endregion


