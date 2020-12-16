/// @description Insérez la description ici
damage = ct_argument.damage;
monster = ct_argument.monster;
mon = obj_soul.monster[monster];

originalHp = mon.hp;

miss = damage <= 0;

if(damage >= 0)
{
	mon.hp -= damage;
	
	damage = string(damage);
	var _dmg = [];
	for(i = 0; i < string_length(damage); i++)
	{
		_dmg[i] = real(string_char_at(damage, i+1));
	}
	damage = _dmg;
	
	audio_play_sound(snd_damage, 0, false);
}
else damage = [0];

if(mon.hp <= 0)
{
	audio_play_sound(snd_vaporized, 3, false);
		
	obj_soul.gAmount += mon.gAmountFight;
	obj_soul.xpAmount += mon.xpAmount;
	array_delete(obj_soul.monster, monster, 1);
		
	mon.killed = true;
	obj_soul.monsterAmount--;
}
else if(!mon.dodge) mon.hurt = true; //!Sans

_y = y; //For healthbar

velY = -5;