/// @description Draw self with shaders
if(!passthrough)
{
	shader_set(shd_insideOutside);

	shader_set_uniform_i(u_uInside, inside);
	shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);
}

draw_sprite_ext(sprite_index, image_index, x+po.x, y+po.y, image_xscale, image_yscale, image_angle, c_white, 1)

shader_reset();