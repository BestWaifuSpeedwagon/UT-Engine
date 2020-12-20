/// @description Draw things
if(timer < room_speed)
{
	draw_sprite(spr_exc, 0, x, y-5);
}
else if(timer <= 80)
{
	if(timer % 10 > 2) draw_sprite_ext(spr_heart, 0, x, y, 1, 1, 0, c_red, 1);
}
else
{
	draw_sprite_ext(spr_heart, 0, x, y, 1, 1, 0, c_red, 1);
}