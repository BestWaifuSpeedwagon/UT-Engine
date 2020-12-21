/// @description Collision
#region Attacks
if(inv == 0 || obj_soul.karma)
{
	var moved = (xprevious != x || yprevious != y);
	
	var _atkCount = instance_number(obj_attack);
	for(i = 0; i < _atkCount; i++)
	{
		var _atk = instance_find(obj_attack, i);
	
		if(!_atk.collision) continue;
		
		if(_atk.boundingAmount > 1)
		{
			var _colOccured = false;
				
			//Check over every bounding box and break if a collision happen
			for(j = 0; j < _atk.boundingAmount; j++)
			{
				if(_atk.bounding[j].checkPoint(x, y))
				{
					switch(_atk.color)
					{
						case WHITE:
							_colOccured = true;
							break;
						case AQUA:
							if(moved) _colOccured = true;
							break;
						case ORANGE:
							if(!moved) _colOccured = true;
							break;
					}
						
					if(_colOccured) break;
				}
			}
				
			if(_colOccured)
			{
				applyDamage(_atk);
				break;
			}
		}
		else if(_atk.bounding.checkPoint(x, y)) //Using else if since we know there is only 1 bounding box
		{
			switch(_atk.color)
			{
				case WHITE:
					applyDamage(_atk);
					break;
				case AQUA:
					if(moved) applyDamage(_atk);
					break;
				case ORANGE:
					if(!moved) applyDamage(_atk);
					break;
			}
			break;
		}
	}
}
else inv--;

#endregion