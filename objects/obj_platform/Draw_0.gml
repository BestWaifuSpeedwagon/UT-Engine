/// @description Draw myself
shader_set(shd_insideOutside);
shader_set_uniform_i(u_uInside, true);
shader_set_uniform_f(u_uBox, Box.x, Box.y, Box.x2, Box.y2);

draw_set_color(c_white);
draw_rectangle(x, y+3, x + size, y+8, true);

draw_set_color(c_green);
draw_rectangle(x, y, x + size, y+5, true);

shader_reset();