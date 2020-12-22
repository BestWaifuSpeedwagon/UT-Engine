/// @description Movement
#region Movement
if(visible && canMove)
{
	switch(color)
	{
		case AQUA:
		case RED:
			var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
			var vspd = keyboard_check(vk_down) - keyboard_check(vk_up);
		
			x += hspd*3;
			y += vspd*3;
			break;
		case BLUE: //https://www.reddit.com/r/Underminers/comments/3yq1nn/physics_for_blue_soul/
			var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
			x += hspd*3;
			
			//if(onGround) velY = max(0, velY);
			
			if(onGround && keyboard_check_pressed(vk_up)) velY = -6/2;
			
			if(velY <= -4/2) velY += 0.2/4;
			else if(velY <= -1/2) velY += 0.5/4;
			else if(velY <= -0.5/2) velY += 0.2/4;
			else if(velY < 8/2) velY += 0.6/4;
				
			if(keyboard_check_released(vk_up)) velY = max(velY, -1);
			
			x += cos(gravityDir)*velY;
			y += sin(gravityDir)*velY;
			
			//Check for all angles
			onGround = !pointInRectangleRotated(x, y, Box.x+2, Box.y+2, Box.x2-18, Box.y2-18, Box.w/2-8, Box.h/2-8, gravityDir - pi/2, true);
			
			if(slam && onGround)
			{
				screenShake(10);
				audio_play_sound(snd_impact, 3, false);
				
				slam = false;
			}
			break;
	}
}

switch(color)
{
	case AQUA:
		canMove = false; //Reset to false
		break;
	default:
		canMove = true;
		break;
}

///TODO : Add rotation of box
x = clamp(x, Box.x+8, Box.x2-8); //Sprite width/height
y = clamp(y, Box.y+8, Box.y2-8);

pos.set(x, y);

#endregion