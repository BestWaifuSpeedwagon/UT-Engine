/// @description Collision
if(visible && (inv <= 0 || obj_soul.karma))
{
	var _atkCount = instance_number(obj_attack);
	for(i = 0; i < _atkCount; i++)
	{
		var _atk = instance_find(obj_attack, i);
	
		if(!_atk.collision) continue; //No need to check if collision is deactivated
		
		if(_atk.boundingAmount > 1)
		{
			var _colOccured = false;
			
			//Check over every bounding box and break if a collision happen
			for(j = 0; j < _atk.boundingAmount; j++)
			{
				//Smart operators will check if color is AQUA then if it's already on, and only then for collision 
				canMove = color != AQUA || canMove || _atk.bounding[@ j].checkCircle(x, y, 32);
				
				//Can't have a collision if you're not close to any
				if(canMove && _atk.bounding[@ j].checkPoint(x, y))
				{
					applyDamage(_atk);
					_colOccured = true;
					break; //Break out of bounding box loop if collision happened
				}
			}
			
			if(_colOccured) break; //Break out of attacks loop if collision happened
		}
		else
		{
			canMove = color != AQUA || canMove || _atk.bounding.checkCircle(x, y, 32);
			
			if(canMove && _atk.bounding.checkPoint(x, y))
			{
				applyDamage(_atk);
				break;
			}
		}
	}
}
else inv--;