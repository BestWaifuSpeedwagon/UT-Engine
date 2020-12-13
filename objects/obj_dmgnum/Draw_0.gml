/// @description Draw myself
if(miss)
{
	draw_sprite(spr_dmgmiss, 0, x - 118/2, y);
}
else
{
	draw_healthbar(mon.x - 50, _y, mon.x + 50, _y+20, originalHp / mon.maxHp * 100, c_red, c_lime, c_lime, 0, true, false);
	
	var _mx = x - 28/2, //Sprite width is 28
		_length = array_length(damage);
	
	for(i = 0; i < _length; i++)
	{
		draw_sprite_ext(spr_dmgnum, damage[i], _mx + floor(i-_length/2)*30, y, 1, 1, 0, c_red, 1);
	}
}