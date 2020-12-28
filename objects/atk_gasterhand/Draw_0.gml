/// @description Draw myself (not affected by shaders)
if(size > 0)
{
	var oscillation = (sin(t*pi*8)+1)/2 * 0.25 + 1; //0.25 second
	
	draw_set_alpha(alpha);
	draw_set_color(color);
	drawRectangleRotated(x, y-32*image_yscale*size * oscillation, x+length, y+32*image_yscale*size, x, y, wantedDir, false, false);
	draw_set_alpha(1);
}

if(timer < 0 && timer > -5) //Flash screen when fire
{
	draw_set_color(c_white);
	draw_set_alpha((timer+5)/5);
	draw_rectangle(0, 0, 640, 480, false);
	draw_set_alpha(1);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color, alpha);