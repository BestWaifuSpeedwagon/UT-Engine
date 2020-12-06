///Holds all of the structs
function Dialogue(_messages, _border) constructor
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
	
	border = _border;
	
	function update()
	{
		if(keyboard_check_pressed(ord("X")) && skippable)
		{
			pos = string_length(messages[_id])+1;
			current = messages[_id];
		}
		
		if(pos <= string_length(messages[_id]))
		{
			if(t > 0) //Countdown before adding string
			{
				t--;
				return false;
			}
			
			current += string_char_at(messages[_id], pos);
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

function Act(_name, _text) constructor
{
	name = _name;
	text = _text;
}

function Item(_name, _effect, _desc) constructor
{
	name = _name;
	effect = _effect;
	description = _desc;
}