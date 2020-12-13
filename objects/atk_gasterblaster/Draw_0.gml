/// @description Draw myself (not affected by shaders)
if(size > 0)
{
	var oscillation = (sin(t*pi*4)+1)/2 * (1.25-0.75) + 0.75; //From 0.75 to 1.25, in 0.5 second
	
	draw_set_alpha(alpha)
	draw_set_color(c_white);
	drawRectangleRotated(x, y-42*image_yscale*size*oscillation, x+length, y+42*image_yscale*size*oscillation, x, y, wantedDir, false);
	
	draw_set_alpha(1);
}

draw_self();