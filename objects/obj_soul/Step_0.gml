/// @description Move heart around or something idunno
var _z = keyboard_check_pressed(ord("Z"));
var _x = keyboard_check_pressed(ord("X"));

if(!inBattle)
{
	box.wantedW = 575;
	box.wantedH = 140;
	
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
	else
	{
		if(substate[0] == NULL)
		{
			dialogue.update();
			
			state += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
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
						substate[0] += keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
						
						if(_z) substate[1] = 0;
						break;
					case FIGHT:
						substate[0] += keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up);
						substate[0] = clamp(substate[0], 0, monsterAmount-1);
					
						if(_z) 
						{
							monster[ substate[0] ].fightCount++;
							startCombat();
						}
						break;
					case ITEM:
						substate[0] += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_down)*2 - keyboard_check_pressed(vk_up)*2;
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
							
							startCombat();
						}
						break;
				}
			
				if(_x) substate[0] = NULL;
			}
			else
			{
				switch(state)
				{
					case FIGHT:
						break;
					case ACT:
						substate[1] += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left) + keyboard_check_pressed(vk_down)*2 - keyboard_check_pressed(vk_up)*2;
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
#endregion