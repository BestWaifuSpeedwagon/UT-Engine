/// @description Move
switch(color)
{
	case RED:
		var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
		var vspd = keyboard_check(vk_down) - keyboard_check(vk_up);
		
		x += hspd;
		y += vspd;
		break;
}

x = clamp(x, obj_soul.box.x, obj_soul.box.x2);
y = clamp(y, obj_soul.box.y, obj_soul.box.y2);

if(inv > 0) inv--;