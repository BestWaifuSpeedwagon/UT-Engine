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
	
	voice = _voice;
	
	border = _border;
	
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
			if(keyboard_check_pressed(ord("Z")) && passable)
			{
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
			draw_rectangle(x-10, y-10, x2, y2, false);
			draw_set_color(c_white);
			for(i = 0; i < 4; i++)
				draw_rectangle(x-10+i, y-10+i, x2-i, y2-i, true);
		}
		
		draw_set_color(c_white);
		draw_set_font(font);
		draw_text(x, y, current);
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

function Item(_name, _effect, _desc) constructor
{
	name = _name;
	effect = _effect;
	description = _desc;
}

function Point(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	function rotate(theta)
	{
		var _x = x*cos(theta)-y*(sin(theta));
		var _y = x*sin(theta)+y*cos(theta);
		
		x = _x;
		y = _y;
	}
	
	function set(_x, _y)
	{
		x = _x;
		y = _y;
	}
	
	/*
		Either add another point or _x and _y
	*/
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