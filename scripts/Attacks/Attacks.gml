//For attacks with lots of arguments
function AttackGasterBlaster(x, y, wantedX, wantedY, wantedDir, timeBeforeBlast, timeBeforeFadeOut, xscale, yscale){
	ct_argument = 
	{
		wantedX: wantedX,
		wantedY: wantedY,
		wantedDir: wantedDir,
		timer: timeBeforeBlast,
		fadeOut: timeBeforeFadeOut
	}
	
	_g = instance_create_layer(x, y, "Attacks", atk_gasterblaster);
	
	_g.image_xscale = xscale;
	_g.image_yscale = yscale;
}