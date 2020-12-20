#region Geometry
/// @param {number} x1
/// @param {number} y1
/// @param {number} x2
/// @param {number} y2
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

function flicker(time)
{
	audio_pause_all();
	
	audio_play_sound(snd_noise, 3, false);
	
	obj_stat.flick = time;
}
#endregion
#region Utility

/// @param {object[]} monster
/// @param {bool} karma
/// @param {sound} music
/// @param {object} ?startAttack
function startBattle(monster, karma, music, startAttack)
{
	if(startAttack == undefined) startAttack = NULL;
	
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

function cosine(val1, val2, amount)
{
	return lerp(val1, val2, (1-cos(amount*pi))/2);
}

function oscillate(val1, val2, amount) //Amount from 0 to 1
{
	if(amount < .5) return lerp(val1, val2, amount*2);
	else return lerp(val2, val1, (1-amount)*2);
}

function createDialogue(dialogue)
{
	ds_list_add(obj_dialogueManager.dialogues, dialogue);
}

//arr: any[]
//length: number --- OPTIONAL
//callback : (element: any, index: number) => void
//=> void
function forEach(arr, callback)
{
	var _l = argument_count == 3 ? argument[1] : array_length(arr);
	for(i = 0; i < _l; i++)
	{
		argument[argument_count-1](arr[@ i], i);
	}
}
#endregion
#region File System
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