/// @description Draw things
if(timer < 60)
{
	draw_sprite(spr_exc, 0, x, y);
}
else if(timer <= 80)
{
	if(timer % 10 > 2) draw_sprite_ext(spr_heart, 0, x, y, 1, 1, 0, c_red, 1);
}
else
{
	draw_sprite_ext(spr_heart, 0, x, y, 1, 1, 0, c_red, 1);
}

if(debug_mode)
{
	draw_set_color(c_yellow);
	draw_circle(sx, sy, 5, false);
}