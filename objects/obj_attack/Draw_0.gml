/// @description Draw self with shaders
shader_set(shd_insideOutside);

shader_set_uniform_i(u_uInside, inside);
shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);

draw_self();

shader_reset();