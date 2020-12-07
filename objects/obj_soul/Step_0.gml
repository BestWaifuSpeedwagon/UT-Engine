/// @description Move heart around or something idunno
var _z = keyboard_check_pressed(ord("Z"));
var _x = keyboard_check_pressed(ord("X"));

var _hKey = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left),
	_vKey = keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);

if(!inBattle)
{
	box.wantedW = 575;
	box.wantedH = 140;
	
	if(_z) audio_play_sound(snd_select, 1, false);
	if(_hKey != 0 || _vKey != 0) audio_play_sound(snd_squeak, 1, false);
	
	if(waitingForDialogue)
	{
		dialogue.passable = true;
		if(dialogue.update())
		{
			dialogue.reset();
			dialogue.passable = false;
			waitingForDialogue = false;
			startCombat();
		}
	}
	else if(!waitingForDamage)
	{
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
					case ACT: //ACT acts like SPARE for selecting monster
					case SPARE:
						substate[0] += _vKey;
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
						
						if(_z) substate[1] = 0;
						break;
					case FIGHT:
						substate[0] += _vKey;
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
					
						if(_z) 
						{
							monster[ substate[0] ].fightCount++;
							waitingForDamage = true;
							ct_argument = 
							{
								monster: monster[ substate[0] ]
							}
							instance_create_layer(0, 0, "Instances", obj_target);
						}
						break;
					case ITEM:
						//Horizontal + Vertical choosing
						substate[0] += _hKey + _vKey*2;
						substate[0] = clamp(substate[0], 0, array_length(obj_stat.items));
					
						if(_z)
						{
							var _item = obj_stat.items[| substate[0]];
							
							obj_stat.hp += _item.effect;
							obj_stat.hp = min(obj_stat.hp, obj_stat.maxHp);
							
							var _m;
							if(obj_stat.hp == obj_stat.maxHp) _m = "Your HP maxed out !";
							else _m = "You recovered " + _item.effect + " HP.";
							
							dialogue.messages = [ "* You eat the " + _item.name + ".\n* " + _m ];
							dialogue.reset();
							
							ds_list_delete(obj_stat.items, substate[0]);
							
							waitingForDialogue = true;
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
					case FIGHT:
						break;
					case ACT:
						substate[1] += _hKey + _vKey*2;
						substate[1] = clamp(substate[1], 0, array_length(monster[substate[0]].acts));
						
						if(_z)
						{
							dialogue.messages = monster[substate[0]].acts[substate[1]].text;
							dialogue.reset();
							waitingForDialogue = true;
						}
						break;
					case SPARE:
						if(_z)
						{
							monster[ substate[0] ].spareCount++;
							startCombat();
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
	if(currentAttack(time))
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