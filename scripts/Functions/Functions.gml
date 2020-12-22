#region GMEdit Stuff
#endregion
#region Geometry
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2
/// @returns {radians} Angle in radians
function pointDirection(x1, y1, x2, y2)
{
	return arctan2(y2 - y1, x2 - x1);
}

/// @param {radians} src
/// @param {radians} dest
/// @returns {radians} Difference between the two
function angleDifference(src, dest)
{
	var phi = abs(dest - src) % 360;       // This is either the distance or 360 - distance
    var distance = phi > 180 ? 360 - phi : phi;
    
    var s = (src - dest >= 0 && src - dest <= 180) || (src - dest <= -180 && src - dest>= -360) ? 1 : -1;
    
    return distance*s;
}

/// @param {real}    px       Point X
/// @param {real}    py       Point Y
/// @param {real}    x1       Left side of rectangle
/// @param {real}    y1       Top side of rectangle
/// @param {real}    x2       Right side of rectangle
/// @param {real}    y2       Bottom side of rectangle
/// @param {real}    ox       Origin of the rectangle
/// @param {real}    oy       Origin of the rectangle
/// @param {radians} theta    Angle of rectanle (clockwise)
/// @param {bool}    relative Wether the origin is relative to x1/y1
/// @returns {bool} If the point is in the rectangle
function pointInRectangleRotated(px, py, x1, y1, x2, y2, ox, oy, theta, relative)
{
	/* 
		Checking if a point is inside a rotated rectangle is the same as
		rotating both backwards, then checking if the point is inside the
		normal rectangle.
		We already have the normal rectangle, so we only rotate the point backwards
	*/
	
	//Add the base coordonates if the origin is relative
	var _ox = ox + (relative ? x1 : 0), 
		_oy = oy + (relative ? y1 : 0);
	
	var p = new Point(px, py);
	
	p.rotate(_ox, _oy, -theta); //Rotate the point backwards
	
	return p.inside("rectangle", x1, y1, x2, y2); //Normal collision check
}

/// @param {Point}    pc      Center of circle
/// @param {real}     radius  Radius of circle
/// @param {Point}    p1      Top-left corner of rectangle
/// @param {Point}    p2      Bottom-right corner of rectangle
/// @param {Point}    po      Origin of rectangle
/// @param {radians} theta    Angle of rectanle (clockwise)
/// @param {bool}    relative If the origin is relative to p1
/// @returns {bool}           If the circle and the rectangle intersects
function circleIntersectsRectangleRotated(pc, radius, p1, p2, po, theta, relative)
{
	//Add the base coordonates if the origin is relative
	var _ox = ox + (relative ? x1 : 0), 
		_oy = oy + (relative ? y1 : 0);
	
	pc.rotate(_ox, _oy, -theta); //Make the circle relative to the non-rotated rectangle
	
	//Find most closest point
	var _x = clamp(pc.x, p1.x, p2.x),
		_y = clamp(pc.y, p1.y, p2.y);
		
	return sqr(pc.x-_x)+sqr(pc.y-_y) > sqr(radius);
}

function getRectangleRotated(x1, y1, x2, y2, ox, oy, theta, relative)
{
	// p1 o---------o p2
	//	  |			|
	//	  |		 	|
	//	  |			|
	// p3 o---------o p4
	
	//Add the base coordonates if the origin is relative
	var _ox = ox + (relative ? x1 : 0), 
		_oy = oy + (relative ? y1 : 0);
	
	var p1 = new Point(x1, y1),
		p2 = new Point(x2, y1),
		p3 = new Point(x1, y2),
		p4 = new Point(x2, y2);
		
	p1.rotate(_ox, _oy, theta);
	p2.rotate(_ox, _oy, theta);
	p3.rotate(_ox, _oy, theta);
	p4.rotate(_ox, _oy, theta);
	
	return {
		p1: p1,
		p2: p2,
		p3: p3,
		p4: p4
	}
}

/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2
/// @param {real} ox
/// @param {real} oy
/// @param {radians} theta
/// @param {boolean} relative
/// @param {boolean | real} outline
/// @returns {void}
function drawRectangleRotated(x1, y1, x2, y2, ox, oy, theta, relative, outline)
{
	var points = getRectangleRotated(x1, y1, x2, y2, ox, oy, theta, relative);
	
	if(outline > 0)
	{
		draw_line_width(points.p1.x, points.p1.y, points.p2.x, points.p2.y, outline);
		draw_line_width(points.p2.x, points.p2.y, points.p4.x, points.p4.y, outline);
		draw_line_width(points.p4.x, points.p4.y, points.p3.x, points.p3.y, outline);
		draw_line_width(points.p3.x, points.p3.y, points.p1.x, points.p1.y, outline);
	}
	else
	{
		draw_primitive_begin(pr_trianglestrip);
		
		draw_vertex(points.p1.x, points.p1.y);
		draw_vertex(points.p2.x, points.p2.y);
		draw_vertex(points.p3.x, points.p3.y);
		draw_vertex(points.p4.x, points.p4.y);
		
		draw_primitive_end();
	}
}
#endregion
#region Camera
function screenShake(_power)
{
	obj_stat.shake = max(obj_stat.shake, _power);
}

/// @param {real} time
/// @param {bool} ?pauseAll
function flicker(time, pauseAll)
{
	if (pauseAll == undefined) pauseAll = true;
	
	if(pauseAll) audio_pause_all();
	
	audio_play_sound(snd_noise, 3, false);
	
	obj_stat.flick = time;
	obj_stat.pauseAll = pauseAll;
}
#endregion
#region Utility

#region startBattle
/// @param {object[]} monster
/// @param {bool} karma
/// @param {sound} music
/// @param {object} ?startAttack
function startBattle(monster, karma, music, startAttack)
{
	if (startAttack == undefined) startAttack = NULL;
	
	//Allows setting arguments before create
	ct_argument =
	{
		karma: karma,
		monster: monster,
		music: music,
		originalRoom: room,
		startAttack: startAttack
	};
	
	room = rm_battle;
	
	instance_create_depth(0, 0, 0, obj_battlestart);
	
	ct_argument = undefined;
	
}
#endregion
#region cosine
/// @param {real} val1
/// @param {real} val2
/// @param {float} amount
/// @returns {real}
function cosine(val1, val2, amount)
{
	return lerp(val1, val2, (1-cos(amount*pi))/2);
}
#endregion
#region oscillate
/// @param {real} val1
/// @param {real} val2
/// @param {float} amount
function oscillate(val1, val2, amount) //Amount from 0 to 1
{
	if(amount < .5) return lerp(val1, val2, amount*2);
	else return lerp(val2, val1, (1-amount)*2);
}
#endregion
#region createDialogue
/// @param {Dialogue} dialogue
function createDialogue(dialogue)
{
	ds_list_add(obj_dialogueManager.dialogues, dialogue);
}
#endregion
#region forEach
/// @param {any[]} arr
/// @param {function} callback
/// @returns {void}
function forEach(arr, callback)
{
	_l = array_length(arr);
	for(i = 0; i < _l; i++)
	{
		callback(arr[@ i], i);
	}
}
#endregion
#endregion
#region File System
///TODO : Implement big boy (binary) saving

function saveFile()
{
	ini_open(FILENAME);
	
	ini_write_real("stat", "room", room);
	ini_write_real("stat", "hp", obj_stat.hp);
	ini_write_real("stat", "xp", obj_stat.xp);
	ini_write_real("stat", "g", obj_stat.g);
	
	ini_write_real("player", "x", obj_player.x);
	ini_write_real("player", "y", obj_player.y);
	
	ini_close();
}

function loadFile()
{
	ini_open(FILENAME);
	
	room = ini_read_real("stat", "room", rm_start);
	obj_stat.hp = ini_read_real("stat", "hp", 20);
	obj_stat.xp = ini_read_real("stat", "xp", 0);
	
	with(obj_stat)
	{
		var lv = 0;
		while(xp >= lvDetails[lv][4])
		{
			lv++;
		}
		
		maxHp = lvDetails[lv][1];
		atk = lvDetails[lv][2];
		def = lvDetails[lv][3];
	}
	
	ini_close();
}

#endregion
#region Audio
/// @param {sound} mus1
/// @param {sound} mus2
function fadeBetween(mus1, mus2)
{
	audio_sound_gain(mus1, 0, 1000);
	
	audio_sound_gain(mus2, 0, 0);
	audio_play_sound(mus2, 3, true);
	audio_sound_gain(mus2, 1, 1000);
}
#endregion
#region Drawing
function applyInsideOutside(inside, callback)
{
	shader_set(shd_insideOutside);
	shader_set_uniform_i(u_u.insideOutside_inside, inside);
	shader_set_uniform_f(u_u.insideOutside_box, Box.x, Box.y, Box.x2, Box.y2);
	
	callback();
	
	shader_reset();
}

#endregion