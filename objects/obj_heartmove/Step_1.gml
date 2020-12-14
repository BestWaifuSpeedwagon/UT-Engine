/// @description Movement
#region Movement
if(visible)
{
	switch(color)
	{
		case RED:
			var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
			var vspd = keyboard_check(vk_down) - keyboard_check(vk_up);
		
			x += hspd*3;
			y += vspd*3;
			break;
		case BLUE: //https://www.reddit.com/r/Underminers/comments/3yq1nn/physics_for_blue_soul/
			var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
			x += hspd*3;
			
			if(onGround && keyboard_check_pressed(vk_up)) velY = -6;
			
			if(velY <= -4) velY += 0.2/2;
			else if(velY <= -1) velY += 0.5/2;
			else if(velY <= -0.5) velY += 0.2/2;
			else if(velY < 8) velY += 0.6/2;
				
			if(keyboard_check_released(vk_up)) velY = max(velY, -1);
			
			x += cos(gravityDir)*velY/2;
			y += sin(gravityDir)*velY/2;
			
			//Check for all angles
			onGround = !pointInRectangleRotated(x, y, obj_soul.box.x+2, obj_soul.box.y+2, obj_soul.box.x2-18, obj_soul.box.y2-18, obj_soul.box.w/2-8, obj_soul.box.h/2-8, gravityDir - pi/2, true);
			break;
	}
}

x = clamp(x, obj_soul.box.x, obj_soul.box.x2-16); //-16 for the sprite width/height
y = clamp(y, obj_soul.box.y, obj_soul.box.y2-16);

#endregion