/// @description Draw self with shaders
if(!passthrough)
{
	shader_set(shd_insideOutside);

	shader_set_uniform_i(u_uInside, inside);
	shader_set_uniform_f(u_uBox, Box.x, Box.y, Box.x2, Box.y2);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color, 1)

shader_reset();