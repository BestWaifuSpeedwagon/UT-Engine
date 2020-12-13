 /// @description Move heart around or something idunno
var _z = keyboard_check_pressed(ord("Z"));
var _x = keyboard_check_pressed(ord("X"));

var _hKey = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left),
	_vKey = keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);

if(won)
{
	dialogue.passable = true;
	if(dialogue.update())
	{
		room = originalRoom;
	}
}
else if(!inBattle)
{
	box.wantedW = 575;
	box.wantedH = 140;
	
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
if(abs(box.w - box.wantedW) > 1) box.w = lerp(box.w, box.wantedW, 0.1);
else box.w = box.wantedW;

if(abs(box.h - box.wantedH) > 1) box.h = lerp(box.h, box.wantedH, 0.1);
else box.h = box.wantedH;

box.x = 320 - box.w/2;
box.y = min(388, 320 + box.h/2) - box.h;

box.x2 = box.x + box.w;
box.y2 = box.y + box.h;

box.cx = box.x + box.w/2;
box.cy = box.y + box.h/2;

#endregion