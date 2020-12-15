/// @description Draw red area
if(time > 0)
{
	draw_set_color(c_red);
	draw_rectangle(_x+2, _y-2, _x+_w-2, _y-_h+2, true);
}