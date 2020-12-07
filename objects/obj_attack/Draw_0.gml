/// @description Draw self with shaders
shader_set(shd_insideOutside);

shader_set_uniform_i(u_uInside, inside);
shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);

draw_sprite_ext(sprite_index, image_index, x+po.x, y+po.y, image_xscale, image_yscale, image_angle, c_white, 1)

shader_reset();

draw_set_color(c_red);
drawRectangleRotated(p1.x, p1.y, p2.x, p2.y, po.x, po.y, theta);