/// @description Variables
color = RED;

x = Box.cx;
y = Box.cy;

inv = 0; //Invicibility time
visible = false;

canMove = true;

customFunc = NULL; //Will be run for specific colors

//BLUE
onGround = true;
velY = 0;
gravityDir = pi/2; //Down by default
slam = false; //SLAM DUNK when you touch box

/// @param {obj_attack} _atk
function applyDamage(_atk)
{
	audio_play_sound(snd_hurt1, 1, false);

	obj_stat.hp -= _atk.damage;
	
	if(obj_soul.karma) obj_soul.kr++;
	
	inv = room_speed;
	
	if(_atk.turnIntoColor) color = _atk.color;
	if(_atk.destroy) instance_destroy(_atk);
}

function changeColor(_color)
{
	if(color == _color) return; //If color is already color
	
	audio_play_sound(snd_bell, 0, false);
	color = _color;
}