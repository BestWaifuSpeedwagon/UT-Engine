/// @description Movement
#region Movement
shiftFactor = keyboard_check(ord("X")) ? .5 : 1;

var upK    = vk_up   ,
	downK  = vk_down ,
	leftK  = vk_left ,
	rightK = vk_right,
	jumpK  = vk_up   ;
gravityDir = sanitizeAngle(gravityDir);

if(gravityDir < pi/2)
{
	upK = vk_up;
	downK = vk_down;
	jumpK = vk_left;
}
else if(gravityDir < pi)
{
	jumpK = vk_up;
	leftK = vk_left;
	rightK = vk_right;
}
else if(gravityDir < pi*1.5)
{
	upK = vk_up;
	downK = vk_down;
	jumpK = vk_right;
}
else
{
	jumpK = vk_down;
	leftK = vk_left;
	rightK = vk_right;
}

if(visible && canMove)
{
	switch(color)
	{
		case AQUA:
		case RED:
			var hspd = keyboard_check(rightK) - keyboard_check(leftK),
				vspd = keyboard_check(downK) - keyboard_check(upK);
		
			x += hspd*3*shiftFactor;
			y += vspd*3*shiftFactor;
			break;
		case BLUE: //https://www.reddit.com/r/Underminers/comments/3yq1nn/physics_for_blue_soul/
			//if(onGround) velY = max(0, velY);
			
			var hspd = keyboard_check(rightK) - keyboard_check(leftK),
				vspd = keyboard_check(downK) - keyboard_check(upK);
			
			if(onGround && keyboard_check_pressed(jumpK)) velY = -6/2;
			
			if(velY <= -4/2) velY += 0.2/4;
			else if(velY <= -1/2) velY += 0.5/4;
			else if(velY <= -0.5/2) velY += 0.2/4;
			else if(velY < 8/2) velY += 0.6/4;
				
			if(keyboard_check_released(jumpK)) velY = max(velY, -1/2);
			
			var __cos = cos(gravityDir),
				__sin = sin(gravityDir);
			
			x += __cos*velY + abs(__sin)*hspd*3*shiftFactor;
			y += __sin*velY + abs(__cos)*vspd*3*shiftFactor;
			break;
	}
}

///TODO : Add rotation of box
x = median(x, Box.x+10, Box.x2-10); //Sprite width/height + box thickness
y = median(y, Box.y+10, Box.y2-10);

switch(color)
{
	case AQUA:
		canMove = false; //Reset to false
		break;
	case BLUE:
		//Need to check after clamp
		var maxVelY = max(velY, 1);
		
		onGround = line_intersects_rectangle(x, y, x+cos(gravityDir)*maxVelY, y+sin(gravityDir)*maxVelY, Box.x+9, Box.y+9, Box.x2-9, Box.y2-9);
		
		if(slam && onGround)
		{
			screenShake(10);
			audio_play_sound(snd_impact, 3, false);
			
			slam = false;
		}
		
		canMove = true;
		break;
	default:
		canMove = true;
		break;
}

#endregion