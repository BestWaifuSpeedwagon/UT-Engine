#region Attacks
/*
Degrees are used, but they go in a clockwise direction, not the usual anticlockwise one !
*/
function AttackGasterBlaster(wantedX, wantedY, angle, timeBeforeBlast, timeBeforeFadeOut, xscale, yscale){
	angle = degtorad(angle);
	
	ct_argument = 
	{
		wantedX: wantedX,
		wantedY: wantedY,
		wantedDir: angle,
		timer: timeBeforeBlast,
		fadeOut: timeBeforeFadeOut
	}
	
	_g = instance_create_layer(wantedX - cos(angle)*700, wantedY - sin(angle)*540, "Attacks", atk_gasterblaster);
	
	_g.image_xscale = xscale;
	_g.image_yscale = yscale;
	
	return _g;
}

function AttackBonearea(x, y, width, height, velX, velY)
{
	ct_argument = 
	{
		width: width,
		height: height,
		velX: velX,
		velY: velY
	}
	
	return instance_create_layer(x, y, "Attacks", atk_bonearea);
	
	ct_argument = undefined;
}

function AttackBonestab(dir, height, timeBeforeStab)
{
	ct_argument = 
	{
		dir: dir,
		height: height,
		time: timeBeforeStab
	}
	
	return instance_create_depth(0, 0, 0, atk_bonestab);
	
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
	
	return _b;
}

function AttackBone(x, y, height, theta, velX, velY)
{
	var _b = instance_create_layer(x, y, "Attacks", atk_bone);
	_b.height = height;
	_b.theta = theta;
	_b.velX = velX;
	_b.velY = velY;
}
#endregion
#region Others
function Slam(theta)
{
	heart.changeColor(BLUE);
	
	heart.gravityDir = theta;
	heart.velY = 10;
	heart.slam = true;
}

function Platform(x, y, size, velX, velY)
{
	var _p = instance_create_layer(x, y, "Attacks", obj_platform);
	_p.size = size;
	_p.velX = velX;
	_p.velY = velY;
}
#endregion