/// @description Draw myself (with shaders)
shader_set(shd_insideOutside);

shader_set_uniform_i(u_uInside, inside);
shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);

draw_set_color(color);

switch(angle) //x and y are ALWAYS top-left corner
{
	case 0:
	case 2:
		for(i = 0; i < tileWidth; i++)
		{
			var _x = x + (i/tileWidth)*width;
			
			draw_sprite_ext(spr_bone_top, 0, _x, y, 1, 1, angle*90, color, 1);
			draw_sprite_ext(spr_bone_bottom, 0, _x+10, y+height, 1, 1, angle*90, color, 1);
			
			draw_rectangle(_x+2, y+6, _x+8, y+height-6, false);
		}
		break;
	case 1:
	case 3:
		for(i = 0; i < tileWidth; i++)
		{
			var _y = y + (i/tileWidth)*width;
			
			draw_sprite_ext(spr_bone_top, 0, x, _y, 1, 1, angle*90, color, 1);
			draw_sprite_ext(spr_bone_bottom, 0, x+height, _y+10, 1, 1, angle*90, color, 1);
			
			draw_rectangle(x+6, _y+2, x+height-6, _y-2, false);
		}
		break;
}

shader_reset();