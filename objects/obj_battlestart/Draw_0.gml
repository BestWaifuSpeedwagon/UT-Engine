/// @description Draw things
if(timer < room_speed)
{
	draw_sprite(spr_exc, 0, x, y-5);
}
else if(timer <= 80)
{
	if(timer % 10 > 2) draw_sprite(spr_heart, 0, x, y);
}
else
{
	draw_sprite(spr_heart, 0, x, y);
}