/// @description Draw myself (with shaders)
shader_set(shd_insideOutside);

shader_set_uniform_i(u_u.insideOutside_inside, inside);
shader_set_uniform_f(u_u.insideOutside_box, Box.x, Box.y, Box.x2, Box.y2);

draw_set_color(color);

for(i = 0; i < tileWidth; i++)
{
	var _x = x + (i/tileWidth)*width;
			
	draw_sprite_ext(spr_bone_top, 0, _x, y, 1, 1, 0, color, 1);
	draw_sprite_ext(spr_bone_bottom, 0, _x+10, y+height, 1, 1, 0, color, 1);
	
	draw_rectangle(_x+2, y+6, _x+8, y+height-6, false);
}

shader_reset();