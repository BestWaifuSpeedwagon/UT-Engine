/// @description Draw myself (not affected by shaders)
if(size > 0)
{
	var oscillation = (sin(t*pi*8)+1)/2 * 0.25 + 1; //0.25 second
	
	draw_set_alpha(alpha);
	draw_set_color(c_white);
	drawRectangleRotated(x, y-32*image_yscale*size * oscillation, x+length, y+32*image_yscale*size * oscillation, x, y, wantedDir, false);
	draw_set_alpha(1);
}

draw_self();