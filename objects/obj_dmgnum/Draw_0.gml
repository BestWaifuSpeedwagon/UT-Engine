/// @description Draw myself
if(miss)
{
	draw_sprite(spr_dmgmiss, 0, x - 118/2, y);
}
else
{
	for(i = 0; i < array_length(damage); i++)
	{
		draw_sprite(spr_dmgnum, damage[i], x + i*30, y);
	}
}