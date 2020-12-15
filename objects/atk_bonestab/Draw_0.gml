/// @description Draw red area
if(time > 0)
{
	draw_set_color(c_red);
	draw_rectangle(_x1+2, _y1-2, _x2-2, _y2+2, true);
}