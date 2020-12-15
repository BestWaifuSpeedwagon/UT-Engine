#region Attacks
/*
Degrees are used, but they go in a clockwise direction, not the usual anticlockwise one !
*/
function AttackGasterBlaster(wantedX, wantedY, wantedDir, timeBeforeBlast, timeBeforeFadeOut, xscale, yscale){
	wantedDir = degtorad(wantedDir);
	
	ct_argument = 
	{
		wantedX: wantedX,
		wantedY: wantedY,
		wantedDir: wantedDir,
		timer: timeBeforeBlast,
		fadeOut: timeBeforeFadeOut
	}
	
	_g = instance_create_layer(wantedX - cos(wantedDir)*700, wantedY - sin(wantedDir)*540, "Attacks", atk_gasterblaster);
	
	_g.image_xscale = xscale;
	_g.image_yscale = yscale;
}

function AttackBonestab(dir, height, timeBeforeStab)
{
	ct_argument = 
	{
		dir: dir,
		height: height,
		time: timeBeforeStab
	}
	
	instance_create_depth(0, 0, 0, atk_bonestab);
	
	ct_argument = undefined;
}

function AttackBonegap(x, y, height, theta, velX, velY, gapPos, gapHeight)
{
	var _b = instance_create_layer(x, y, "Attacks", atk_bonegap);
	_b.height = height;
	_b.theta = theta;
	_b.velX = velX;
	_b.velY = velY;
	_b.gapPos = gapPos;
	_b.gapHeight = gapHeight;
}
#endregion
#region Others
function Slam(_dir)
{
	heart.changeColor(BLUE);
	
	heart.gravityDir = _dir;
	heart.velY = 10;
	heart.slam = true;
}


#endregion