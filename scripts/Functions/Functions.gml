#region Geometry
function pointDirection(x1, y1, x2, y2)
{
	return arctan2(y2 - y1, x2 - x1);
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
	
	return p.x > x1 && p.x < x2 && p.y > y1 && p.y < y2; //Normal collision check
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

function drawRectangleRotated(x1, y1, x2, y2, ox, oy, theta, relative)
{
	var points = getRectangleRotated(x1, y1, x2, y2, ox, oy, theta, relative);
	
	draw_primitive_begin(pr_trianglestrip);
	
	draw_vertex(points.p1.x, points.p1.y);
	draw_vertex(points.p2.x, points.p2.y);
	draw_vertex(points.p3.x, points.p3.y);
	draw_vertex(points.p4.x, points.p4.y);
	
	draw_primitive_end();
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

function startBattle(monster, karma, music, startAttack)
{
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

//arr: any[]
//index: number
//=> void
function splice(arr, index)
{
	//[0, 1, 2, 3]
	//splice(arr, 2)
	//[0, 1, 3, -1]
	
	for(i = index; i < array_length(arr)-1; i++)
	{
		arr[@ i] = arr[@ i+1];
	}
	arr[@ array_length(arr)-1] = -1;
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

function getStats(xp)
{
	var file = file_text_open_read("LV.txt");
	
	file_text_readln(file);
	file_text_readln(file);
	
	show_debug_message( file_text_read_real(file) );
	show_debug_message( file_text_read_real(file) );
	show_debug_message( file_text_read_real(file) );
	show_debug_message( file_text_read_real(file) );
	
	file_text_close(file);
}

function saveFile()
{
	ini_open(FILENAME);
	
	ini_write_real("stat", "room", room);
	ini_write_real("stat", "hp", obj_stat.hp);
	ini_write_real("stat", "maxHp", obj_stat.maxHp);
	ini_write_real("stat", "xp", obj_stat.xp);
	ini_write_real("stat", "lv", obj_stat.lv);
	ini_write_real("stat", "g", obj_stat.g);
	ini_write_real("stat", "atk", obj_stat.atk);
	ini_write_real("stat", "def", obj_stat.def);
	
	ini_write_real("player", "x", obj_player.x);
	ini_write_real("player", "y", obj_player.y);
	
	ini_close();
}

function loadFile()
{
	ini_open(FILENAME);
	
	
	
	ini_close();
}

#endregion