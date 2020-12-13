function startBattle(monster, karma, music)
{
	//Allows setting arguments before create
	ct_argument =
	{
		karma: karma,
		monster: monster,
		music: music,
		originalRoom: room
	};
	
	room = rm_battle;
	
	instance_create_depth(0, 0, 0, obj_battlestart);
	
	ct_argument = undefined;
	
}

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