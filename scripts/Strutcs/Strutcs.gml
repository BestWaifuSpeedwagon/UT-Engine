///Holds all of the structs
function Dialogue(_messages, _border, _voice) constructor
{
	messages = _messages;
	current = ""; //Holds the current string
	pos = 1;
	_id = 0;
	
	skippable = true; //Can you skip it ? - MODIFY PROPERTY
	passable = true; //Do you pass it with Z ? - MODIFY PROPERTY - Mostly for combat
	
	x = 40; //Change where its drawn - MODIFY PROPERTY
	y = 330; // ↑
	x2 = 610;// ↑
	y2 = 450;// ↑
	
	font = fnt_dialogue; //Font draw - MODIFY PROPERTY
	
	t = 2;
	tVoice = 3;
	
	pass = false; //Auto pass text with timers and shit
	
	voice = _voice;
	
	border = _border;
	speech = false; //Wether this is showed in a speech bubble - MODIFY PROPERTY
	width = -1; //Bubble related
	
	function update()
	{
		if(keyboard_check_pressed(ord("X")) && skippable)
		{
			current = "";
			pos = string_length(messages[_id])+1;
			for(i = 1; i < pos; i++)
			{
				var _curChar = string_char_at(messages[_id], i);
				if(_curChar == "{")
				{
					do
					{
						i++;
						_curChar = string_char_at(messages[_id], i);
					}
					until(_curChar == "}")
					
					continue;
				}
				
				current += _curChar;
			}
		}
		
		if(pos <= string_length(messages[_id]))
		{
			if(tVoice > 0) tVoice--;
			else if(t == 0)
			{
				audio_play_sound(voice, 1, false);
				tVoice = choose(2, 3, 4);
			}
			
			if(t > 0) //Countdown before adding string
			{
				t--;
				return false;
			}
			
			var _curChar = string_char_at(messages[_id], pos);
			
			if(_curChar == "{")
			{
				var _num = "";
				
				pos++;
				
				_curChar = string_char_at(messages[_id], pos);
				while(_curChar != "}")
				{
					_num += _curChar;
					pos++;
					
					_curChar = string_char_at(messages[_id], pos);
				}
				pos++;
				
				t = real(_num);
				return false;
			}
			
			current += _curChar;
			pos++;
			t = 2;
		}
		else
		{
			//If pressed Z or text has to be passed
			//AND
			//Text can be passed
			if((keyboard_check_pressed(ord("Z")) || pass) && passable)
			{
				pass = false;
				if(_id >= array_length(messages)-1)
				{
					return true;
				}
				
				_id++;
				pos = 1;
				current = "";
			}
		}
		
		return false;
	}
	
	function draw()
	{
		if(border)
		{
			draw_set_color(c_black);
			draw_rectangle(x-16, y-24, x2, y2, false);
			draw_set_color(c_white);
			for(i = 0; i < 4; i++)
				draw_rectangle(x-10+i, y-10+i, x2-i, y2-i, true);
		}
		
		if(speech) //If this is a speech bubble
		{
			draw_set_color(c_black);
			draw_set_font(font);
			draw_text_ext(x, y, current, -1, width);
		}
		else
		{
			draw_set_color(c_white);
			draw_set_font(font);
			draw_text(x, y, current);
		}
	}
	
	function reset()
	{
		pos = 1;
		_id = 0;
		current = "";
	}
}

function Act(_name, _text, _effect) constructor
{
	name = _name;
	text = _text;
	effect = _effect;
}

function Speech(_text, _font, _voice, _bubbleSprite, _waitForEnd, _x, _y) constructor
{
	dialogue = new Dialogue(_text, false, _voice);
	dialogue.font = _font;
	dialogue.speech = true;
	
	dialogue.pass = !_waitForEnd;
	wait = _waitForEnd;
	
	sprite = _bubbleSprite;
	
	
	x = _x;
	y = _y;
	
	switch(sprite)
	{
		case spr_blconabove:
			dialogue.width = 165;
			dialogue.x = x+5;
			dialogue.y = y-95;
			break;
		case spr_blconwd:
			dialogue.width = 190;
			dialogue.x = x+30;
			dialogue.y = y-84;
			break;
		case spr_blconwdshrt:
			dialogue.width = 200;
			dialogue.x = x+35;
			dialogue.y = y-30;
			break;
		case spr_blconwdshrt_l:
			dialogue.width = 200;
			dialogue.x = x-230;
			dialogue.y = y-30;
			break;
	}
	
	function draw()
	{
		draw_sprite(sprite, 0, x, y);
		dialogue.draw();
	}
}

function Item(_name, _effect, _desc, _sound) constructor
{
	name = _name;
	effect = _effect;
	description = _desc;
	sound = _sound;
}

function Point(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	//https://stackoverflow.com/questions/2259476/rotating-a-point-about-another-point-2d
	function rotate(ox, oy, theta)
	{
		var nx = cos(theta) * (x-ox) - sin(theta) * (y-oy) + ox;
		var ny = sin(theta) * (x-ox) + cos(theta) * (y-oy) + oy;
		
		x = nx;
		y = ny;
	}
	
	function set(_x, _y)
	{
		x = _x;
		y = _y;
	}
	
	//Either add another point or a x and y
	function add()
	{
		if(argument_count == 1)
		{
			x += argument[0].x;
			y += argument[0].y;
		}
		else
		{
			x += argument[0];
			y += argument[1];
		}
	}
}

//No argument is passed since everything is changed in child attack instance
function BoundingBox() constructor
{
	//Rectangle of bounding box
	p1 = new Point(0, 0);
	p2 = new Point(0, 0);
	
	//Angle
	theta = 0;
	
	//Origin, and wether it's relative to x1/y1
	o = new Point(0, 0);
	relative = true; //Relative by default
	
	function checkPoint(_x, _y) //Mostly for heartmove, but can be used for other things I guess
	{
		return pointInRectangleRotated(_x, _y, p1.x, p1.y, p2.x, p2.y, o.x, o.y, theta, relative);
	}
	
	function draw()
	{
		drawRectangleRotated(p1.x, p1.y, p2.x, p2.y, o.x, o.y, theta, relative);
	}
	
	function centerOrigin(relative)
	{
		o.set( (relative ? (p2.x-p1.x)/2 : (p2.x+p1.x)/2), (relative ? (p2.y-p1.y)/2 : (p2.y+p1.y)/2));
	}
}