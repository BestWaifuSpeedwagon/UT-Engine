#region SANS

//Degrees are used, but they go in a clockwise direction, not the usual anticlockwise one !
/// @param {real} wantedX
/// @param {real} wantedY
/// @param {degrees} angle
/// @param {int} timeBeforeBlast
/// @param {int} timeBeforeFadeOut
/// @param {real} xscale
/// @param {real} yscale
/// @returns {atk_gasterblaster}
function attack_sans_gaster_blaster(wantedX, wantedY, angle, timeBeforeBlast, timeBeforeFadeOut, xscale, yscale){
	angle = degtorad(angle);
	
	ct_argument = 
	{
		wantedX: wantedX,
		wantedY: wantedY,
		wantedDir: angle,
		timer: timeBeforeBlast,
		fadeOut: timeBeforeFadeOut
	}
	
	_g = instance_create_layer(wantedX - cos(angle)*700, wantedY - sin(angle)*540, "BackgroundAttacks", atk_gasterblaster);
	
	_g.image_xscale = xscale;
	_g.image_yscale = yscale;
	
	return _g;
}
/**
	x {real}
	y {real}
	width {real} Width of the area created
	height {real} Height of the area created
	
	vel {Vector} Speed it's going to go
	||
	velX {Real}
	velY {Real}
*/
function attack_sans_bonearea(x, y, width, height, vel)
{
	if(argument_count == 6) vel = new Vector(argument[4], argument[5]);
	ct_argument = 
	{
		width: width,
		height: height,
		vel: vel,
	}
	
	return instance_create_layer(x, y, "Attacks", atk_bonearea);
}

/// @param {int} dir
/// @param {real} height
/// @param {int} timeBeforeStab
/// @param {real} ?timeBeforeDestroy
function attack_sans_bonestab(dir, height, timeBeforeStab, timeBeforeDestroy)
{
	if (timeBeforeDestroy == undefined) timeBeforeDestroy = 80;
	ct_argument = 
	{
		dir: dir,
		height: height,
		time: timeBeforeStab,
		destroy: timeBeforeDestroy
	}
	
	return instance_create_depth(0, 0, 0, atk_bonestab);
}

/**
	@param {number} x
	@param {number} y
	@param {number} height Height of the bone created
	@param {number} theta Angle of the bone created
	@param {Vector} vel Speed it's going to go
	@param {number} ?velY
	@returns 
*/
function attack_sans_bone(x, y, height, theta, vel, velY)
{
	vel = velY == undefined ? vel : new Vector(vel, velY); //Vel is velX in that case
	
	var _b = instance_create_layer(x, y, "Attacks", atk_bone);
	_b.height = height;
	_b.theta = theta;
	_b.vel = vel;
	
	return _b;
}


///@param {real} x
///@param {real} y
///@param {real} height Height of the bone created
///@param {radians} theta Angle of the bone created
///@param {Real} gapPos Where the gap is
///@param {Real} gapHeight The size of the gap created
///@param {Vector | Real} vel
///@param {[Real]} velY
///@returns {atk_bonegap}
function attack_sans_bonegap(x, y, height, theta, gapPos, gapHeight, vel)
{
	if(argument_count == 8) vel = new Vector(argument[6], argument[7]);
	
	var _b = instance_create_layer(x, y, "Attacks", atk_bonegap);
	_b.height = height;
	_b.theta = theta;
	_b.vel = vel;
	_b.gapPos = gapPos;
	_b.gapHeight = gapHeight;
	
	return _b;
}

/**
	x {real}
	y {real}
	height {real} Height of the bone created
	boneTheta {radians} Angle of the bone created
	spacing {Real} How far apart the bones are spawned
	
	vel {Vector} Speed it's going to go
	||
	velX {Real}
	velY {Real}
*/
function attack_sans_bonerepeat(x, y, height, boneTheta, spacing, amount, vel)
{
	if(argument_count == 8) vel = new Vector(argument[6], argument[7]);
	
	ct_argument = 
	{
		height: height,
		theta: boneTheta,
		vel: vel,
		spacing: spacing,
		amount: amount
	}
	
	return instance_create_layer(x, y, "Attacks", atk_bonerepeat);
}

/// @param {radians} theta
/// @param {real} ?force
/// @returns {void}
function attack_sans_slam(theta, force)
{
	if (force == undefined) force = 10;
	
	heart.changeColor(BLUE);
	
	heart.gravityDir = theta;
	heart.velY = force;
	heart.slam = true;
}

/// @param {real} x
/// @param {real} y
/// @param {real} size
/// @param {real} velX
/// @param {real} velY
/// @returns {void}
function attack_sans_platform(x, y, size, velX, velY)
{
	var _p = instance_create_layer(x, y, "Attacks", obj_platform);
	_p.size = size;
	_p.velX = velX;
	_p.velY = velY;
	
	return _p;
}
#endregion

#region GASTER

//Degrees are used, but they go in a clockwise direction, not the usual anticlockwise one !
/// @param {real} wantedX
/// @param {real} wantedY
/// @param {degrees} angle
/// @param {int} timeBeforeBlast
/// @param {int} timeBeforeFadeOut
/// @param {real} size
/// @param {color} ?color
/// @returns {atk_gasterhand}
function attack_gaster_hand(wantedX, wantedY, angle, timeBeforeBlast, timeBeforeFadeOut, size, color){
	angle = degtorad(angle);
	if (color == undefined) color = WHITE;
	
	ct_argument = 
	{
		wantedX: wantedX,
		wantedY: wantedY,
		wantedDir: angle,
		timer: timeBeforeBlast,
		fadeOut: timeBeforeFadeOut
	}
	
	_g = instance_create_layer(wantedX - cos(angle)*700, wantedY - sin(angle)*540, "BackgroundAttacks", atk_gasterhand);
	
	_g.image_yscale = size;
	_g.color = color;
	
	return _g;
}

#endregion