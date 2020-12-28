/// @description Draw myself (not affected by shaders)
if(size > 0)
{
	var oscillation = (sin(t*pi*8)+1)/2 * 0.25 + 1; //0.25 second
	
	var __cos = cos(wantedDir),
		__sin = sin(wantedDir);
	
	var blastX = x + __cos*30*image_xscale,
		blastY = y + __sin*30*image_xscale;
	
	draw_sprite_ext(spr_gasterblaster_blast, 0, blastX, blastY, image_xscale, size*image_yscale, image_angle, color, alpha);
	
	blastX += __cos*20*image_xscale;
	blastY += __sin*20*image_xscale;
	
	draw_set_alpha(alpha);
	draw_set_color(color);
	drawRectangleRotated(blastX, blastY-32*image_yscale*size * oscillation, blastX+2000, blastY+32*image_yscale*size * oscillation, blastX, blastY, wantedDir, false, false);
	draw_set_alpha(1);
}

draw_self();