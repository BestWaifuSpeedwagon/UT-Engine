/// @description Move heart around or something idunno

var _z = keyboard_check_pressed(ord("Z"));
var _x = keyboard_check_pressed(ord("X"));

var _hKey = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left),
	_vKey = keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);

#region Selection
if(won)
{
	dialogue.passable = true;
	if(dialogue.update())
	{
		surface_free(monsterSurf);
		room = originalRoom;
	}
}
else if(!inBattle)
{
	box.resize(575, 140, 0);
	
	if(waitingFor.dialogue)
	{
		dialogue.passable = true;
		if(dialogue.update())
		{
			dialogue.reset();
			dialogue.passable = false;
			waitingFor.dialogue = false;
			startSpeech();
		}
	}
	else if(!waitingFor.damage && !waitingFor.speech)
	{
		if(_z) audio_play_sound(snd_select, 1, false);
		if(_hKey != 0 || _vKey != 0) audio_play_sound(snd_squeak, 1, false);
		
		if(substate[0] == NULL)
		{
			dialogue.update();
			
			state += _hKey;
			state = clamp(state, 0, 3);
		
			if(_z) substate[0] = 0;
		}
		else
		{
			if(substate[1] == NULL)
			{
				switch(state)
				{
					case FIGHT:
						substate[0] += _vKey;
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
					
						if(_z) 
						{
							roundType = FIGHT;
							
							waitingFor.damage = true;
							ct_argument = 
							{
								monster: substate[0]
							}
							instance_create_layer(0, 0, "Instances", obj_target);
						}
						break;
					case ACT:
						substate[0] += _vKey;
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
						
						if(_z) substate[1] = 0;
						break;
					case ITEM:
						if(ds_list_size(obj_stat.items) <= 0) substate[0] = NULL;
					
						//Horizontal + Vertical choosing
						substate[0] += _hKey + _vKey*2;
						substate[0] = clamp(substate[0], 0, array_length(obj_stat.items));
					
						if(_z)
						{
							roundType = ITEM;
							
							var _item = obj_stat.items[| substate[0]];
							
							audio_play_sound(_item.sound, 3, false);
							
							obj_stat.hp += _item.effect;
							obj_stat.hp = min(obj_stat.hp, obj_stat.maxHp);
							
							var _m;
							if(obj_stat.hp == obj_stat.maxHp) _m = "Your HP maxed out !";
							else _m = "You recovered " + string(_item.effect) + " HP.";
							
							dialogue.messages = [ "* You eat the " + _item.name + ".{30}\n* " + _m ];
							dialogue.reset();
							
							ds_list_delete(obj_stat.items, substate[0]);
							
							waitingFor.dialogue = true;
						}
						break;
					case SPARE:
						if(_z)
						{
							roundType = SPARE;
							
							for(i = 0; i < monsterAmount; i++)
							{
								if(monster[i].spare)
								{
									if(!audio_is_playing(snd_vaporized)) audio_play_sound(snd_vaporized, 3, false);
									gAmount += monster[i].gAmountSpare;
									
									monster[i].spared = true;
									splice(monster, i);
									i--;
									monsterAmount--;
								}
								else
								{
									monster[i].spareCount++;
								}
							}
							
							startSpeech();
						}
						break;
				}
			
				if(_x)
				{
					dialogue.reset();
					substate[0] = NULL;
				}
			}
			else
			{
				switch(state)
				{
					case ACT:
						substate[1] += _hKey + _vKey*2;
						substate[1] = clamp(substate[1], 0, array_length(monster[substate[0]].acts));
						
						if(_z)
						{
							roundType = ACT;
							
							var _act = monster[substate[0]].acts[substate[1]];
							
							if(_act.effect)
							{
								with(monster[substate[0]])
								{
									_act.effect();
								}
							}
							
							dialogue.messages = _act.text;
							dialogue.reset();
							waitingFor.dialogue = true;
						}
						break;
				}
			
			
				if(_x) substate[1] = NULL;
			}
		}
	}
}
else
{
	if(!instance_exists(currentAttack))
	{
		inBattle = false;
		
		obj_heartmove.visible = false;
		
		with(obj_attack)
		{
			instance_destroy();
		}
	}
	time++;
}
#endregion
#region Speech

if(currentSpeech != NULL)
{
	if(currentSpeech.dialogue.update())
	{
		if(currentSpeech.wait) startCombat(); //If you didn't wait for the speech, the combat is already started
		
		currentSpeech.dialogue.reset();
		currentSpeech = NULL;
		waitingFor.speech = false;
	}
}

#endregion
#region Box

with(box)
{
	w = lerp(w, fw, .1);
	h = lerp(h, fh, .1);

	if(freePos)
	{
		//o.x = lerp(o.x, fo.x, .1);
		//o.y = lerp(o.y, fo.y, .1);
	
		x = lerp(x, fx - fw*o.x, .1);
		y = lerp(y, fy - fh*o.y, .1);
	}
	else
	{
		x = 320 - w/2;
		y = min(388, 320 + h/2) - h;
	
		fx = x + w*o.x;
		fy = y + h*o.y;
	}
	x2 = x + w;
	y2 = y + h;

	cx = fx + fw/2;
	cy = fy + fh/2;
	
	if(keyboard_check_pressed(ord("A")))
	{
		move(mouse_x, mouse_y, 1);
	}
}
#endregion
#region Health / Karma

if(karma)
{
	var _krTimer = ceil(power(1.25, -kr)*120);
	
	if(_krTimer < krCount) krCount = _krTimer;
	
	if(krCount > 0) krCount--;
	else
	{
		if(kr > 0)
		{
			kr--;
			krCount = _krTimer;
		}
	}
	
	if(obj_stat.hp <= 0)
	{
		if(kr > 0)
		{
			obj_stat.hp = 1;
			kr--; //Additional damage remove karma
		}
		else instance_create_depth(0, 0, 0, obj_gameover);
	}
}
else
{
	if(obj_stat.hp <= 0) instance_create_depth(0, 0, 0, obj_gameover);
}
#endregion
#region Surfaces
if(!surface_exists(monsterSurf)) monsterSurf = surface_create(width*2, height*2);

#endregion