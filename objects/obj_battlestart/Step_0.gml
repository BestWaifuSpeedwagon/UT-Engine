/// @description Timer thingy
switch(timer)
{
	case 60:
	case 70:
	case 80:
		audio_play_sound(snd_noise, 1, false);
		break;
	case 100:
		audio_play_sound(snd_battlefall, 3, false);
		break;
	case 140:
		var _l = array_length(monster);
		var _monsterInstances = [];
		for(i = 0; i < _l; i++)
		{
			_monsterInstances[i] = instance_create_depth((i+1)/(_l+1) * 640, 60, 10, monster[i]);
		}
		
		ct_argument = 
		{
			karma: karma,
			monster: _monsterInstances,
			originalRoom: originalRoom
		}
		
		instance_create_depth(0, 0, 0, obj_soul);
		
		ct_argument = undefined;
		
		if(startAttack == NULL) audio_play_sound(music, 3, true);
		else
		{
			obj_heartmove.visible = true;
			obj_heartmove.x = Box.cx;
			obj_heartmove.y = Box.cy;
			
			obj_soul.inBattle = true;
			obj_soul.currentAttack = instance_create_depth(0, 0, 0, startAttack);
		}
		
		instance_destroy();
		break;
}

timer++;

if(timer >= 100 && timer < 135)
{
	x = lerp(sx, 33+16, (timer-100)/35);
	y = lerp(sy, 453, (timer-100)/35);
}