/// @description Draw myself
shader_set(shd_insideOutside);
shader_set_uniform_i(u_uInside, true);
shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);

draw_set_color(c_green);

draw_rectangle(x, y, x + size, y+5, true);

shader_reset();