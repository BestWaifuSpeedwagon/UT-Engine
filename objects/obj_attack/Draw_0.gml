/// @description Draw self with shaders
if(sprite_exists(sprite_index))
{
	if(!passthrough)
	{
		shader_set(shd_insideOutside);
	
		shader_set_uniform_i(u_u.insideOutside_inside, inside);
		shader_set_uniform_f(u_u.insideOutside_box, Box.x, Box.y, Box.x2, Box.y2);
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color, 1);
	
	shader_reset();
}