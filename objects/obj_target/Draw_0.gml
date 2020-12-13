/// @description Draw myself + target
draw_self();

var _h = (obj_soul.box.h - 16)/2;

if(moving)
{
	
	draw_set_color(c_black);
	draw_rectangle(barX-4, y - _h, barX+4, y + _h, false);
	draw_set_color(c_white);
	draw_rectangle(barX-2, y - _h+2, barX+2, y + _h-2, false);
}
else
{
	var _col = ( t % 30 < 15 ? c_white : c_black );
	
	draw_set_color(_col);
	draw_rectangle(barX-4, y - _h, barX+4, y + _h, false);
	draw_set_color(c_white - _col);
	draw_rectangle(barX-2, y - _h+2, barX+2, y + _h-2, false);
}