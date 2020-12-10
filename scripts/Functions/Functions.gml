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

// /!\ ox and oy are relative to x1 and y1
function pointInRectangleRotated(px, py, x1, y1, x2, y2, ox, oy, theta)
{
	/* 
		Checking if a point is inside a rotated rectangle is the same as
		rotating both backwards, then checking if the point is inside the
		normal rectangle.
		We already have the normal rectangle, so we only rotate the point around the 
		origin.
	*/
	
	var p = new Point(px-x1-ox, py-y1-oy); //Relative origin
	p.rotate(-theta);
	p.add(x1+ox, y1+oy)
	
	return p.x > x1 && p.x < x2 && p.y > y1 && p.y < y2;
}

function pointDirection(x1, y1, x2, y2)
{
	return arctan2(y2 - y1, x2 - x1);
}

// /!\ ox and oy are relative to x1 and y1
function drawRectangleRotated(x1, y1, x2, y2, ox, oy, theta)
{
	// p1 o---------o p2
	//	  |			|
	//	  |		 	|
	//	  |			|
	// p3 o---------o p4
	
	var _ox = ox + x1, //Relative origin
		_oy = oy + y1;
	
	var p1 = new Point(x1-_ox, y1-_oy),
		p2 = new Point(x2-_ox, y1-_oy),
		p3 = new Point(x1-_ox, y2-_oy),
		p4 = new Point(x2-_ox, y2-_oy);
	p1.rotate(theta);
	p2.rotate(theta);
	p3.rotate(theta);
	p4.rotate(theta);
	
	p1.add(_ox, _oy);
	p2.add(_ox, _oy);
	p3.add(_ox, _oy);
	p4.add(_ox, _oy);
	
	draw_line(p1.x, p1.y, p2.x, p2.y);
	draw_line(p1.x, p1.y, p3.x, p3.y);
	draw_line(p3.x, p3.y, p4.x, p4.y);
	draw_line(p2.x, p2.y, p4.x, p4.y);
}

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