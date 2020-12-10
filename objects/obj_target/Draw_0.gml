/// @description Draw myself + target
draw_self();

if(moving)
{
	draw_rectangle(barX-3, y - 115/2, barX+3, y + 115/2, false); //Sprite is 115 high
}
else
{
	var _col = ( t % 30 < 15 ? c_white : c_black );
	
	draw_set_color(_col);
	draw_rectangle(barX-6, y - 115/2, barX+6, y + 115/2, false); //Sprite is 115 high
	draw_set_color(c_white - _col);
	draw_rectangle(barX-3, y - 110/2, barX+3, y + 110/2, false); //MAGIC NUMBER!!
}