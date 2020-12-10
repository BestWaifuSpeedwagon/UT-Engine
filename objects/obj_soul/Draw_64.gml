/// @description Draw the *burp* thing
draw_sprite(spr_fightbt, real(state == 0), 33, 431);
draw_sprite(spr_actbt, real(state == 1), 186, 431);
draw_sprite(spr_itembt, real(state == 2), 346, 431);
draw_sprite(spr_sparebt, real(state == 3), 501, 431);

draw_set_color(c_white);
draw_set_font(fnt_menu);

#region Box
draw_set_color(c_white);
for(i = 0; i < 4; i++)
	draw_rectangle(box.x + i, box.y + i, box.x2 - i, box.y2 - i, true);

#endregion
#region Heart / Text
if(!inBattle)
{
	if(waitingForDialogue)
	{
		dialogue.draw();
	}
	else if(!waitingForDamage)
	{
		var _hx; //Heart x
		var _hy; //Heart y
		
		if(substate[0] == NULL)
		{
			dialogue.draw();
		
			switch(state)
			{
				case FIGHT:
					_hx = 33+16;
					break;
				case ACT:
					_hx = 186+16;
					break;
				case ITEM:
					_hx = 346+16;
					break;
				case SPARE:
					_hx = 501+16;
					break;
			}
			_hy = 453;
		}
		else
		{
			if(substate[1] == NULL)
			{
				switch(state)
				{
					case FIGHT:
						var _maxw = 0;
						
						for(i = 0; i < monsterAmount; i++)
						{
							draw_text(box.x + 64, box.y + 24 + 32*i, monster[i].name);
							
							_maxw = max(_maxw, string_width(monster[i].name));
						}
						
						for(i = 0; i < monsterAmount; i++)
						{
							var _x = box.x + 86 + _maxw,
								_y = box.y + 24 + 32*i;
							
							draw_healthbar(_x, _y+6, _x+80, _y+26, monster[i].hp/monster[i].maxHp * 100, c_red, c_lime, c_lime, 0, true, false);
						}
						_hx = box.x + 40; //+ 64 - 16 - 8
						_hy = box.y + 40 + 32*substate[0];
						
						break;
					case SPARE:
						_hx = box.x + 40;
						_hy = box.y + 40;
						
						draw_set_color(allMonstersSparable() ? c_yellow : c_white);
						
						draw_text(box.x + 64, box.y + 24, "Spare");
						
						draw_set_color(c_white);
						break;
					case ACT:
						for(i = 0; i < monsterAmount; i++)
						{
							draw_text(box.x + 64, box.y + 24 + 32*i, monster[i].name);
						}
						
						_hx = box.x + 40; //+ 64 - 16 - 8
						_hy = box.y + 40 + 32*substate[0];
						break;
					case ITEM:
						var _startItem = substate[0] - substate[0] % 4;
						var _endItem = min(_startItem+4, ds_list_size(obj_stat.items));
						
						_hx = box.x + 40 + (substate[0]%2 * box.w/2)
						_hy = box.y + 40 + ( (substate[0]+1)%4 > 2 ? 32 : 0 );
						
						for(i = _startItem; i < _endItem; i++)
						{
							var _x = box.x + 64 + (i%2 * box.w/2);
							var _y = box.y + 24 + ( (i+1)%4 > 2 ? 32 : 0 );
							
							draw_text(_x, _y, obj_stat.items[| i].name);
						}
						break;
				}
			}
			else
			{
				switch(state)
				{
					case ACT:
						var _l = array_length( monster[substate[0]].acts );
						
						_hx = box.x + 40 + (substate[1]%2 * box.w/2)
						_hy = box.y + 40 + ( (substate[1]+1)%4 > 2 ? 32 : 0 );
						
						for(i = 0; i < _l; i++)
						{
							var _x = box.x + 64 + (i%2 * box.w/2);
							var _y = box.y + 24 + ( (i+1)%4 > 2 ? 32 : 0);
							
							draw_text(_x, _y, monster[substate[0]].acts[i].name);
						}
						break;
				}
			}
		}
		
		draw_sprite(spr_heart, 0, _hx, _hy);
	}
}
#endregion
#region HUD
draw_set_color(c_white);
draw_set_font(fnt_battle_hud);
draw_set_valign(fa_top);

var _x = 31;

draw_text(_x, 395, obj_stat.name);
_x += string_width(obj_stat.name)+30;

draw_text(_x, 395, "LV " + string(obj_stat.lv));
_x += 92;

draw_sprite(spr_hpname, 0, _x, 404);
_x += 31;

draw_set_color(c_red);
draw_rectangle(_x, 399, _x + obj_stat.maxHp*1.2, 419, false);

if(karma)
{
	draw_set_color(c_fuchsia);
	draw_rectangle(_x, 399, _x + kr, 419, false);
}

draw_set_color(c_yellow);
draw_rectangle(_x, 399, _x + obj_stat.hp*1.2, 419, false);

_x += obj_stat.maxHp*1.2 + 9;

if(karma)
{
	draw_sprite(spr_krmeter, 0, _x, 404);
	_x += 40;
}

draw_set_color(c_white);
draw_text(_x, 395, string(obj_stat.hp) + " / " + string(obj_stat.maxHp));
#endregion