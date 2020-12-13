/// @description Draw myself with shader
shader_set(shd_insideOutside);

shader_set_uniform_i(u_uInside, inside);
shader_set_uniform_f(u_uBox, obj_soul.box.x, obj_soul.box.y, obj_soul.box.x2, obj_soul.box.y2);

draw_set_color(color);
drawRectangleRotated(x+2, y+6, x+8, y+height-6, 3, -6, theta, true);

var p1 = new Point(x, y),
	p2 = new Point(x+10, y+height);

p1.rotate(x+5, y, theta);
p2.rotate(x+5, y, theta);

draw_sprite_ext(spr_bone_top, 0, p1.x, p1.y, 1, 1, -radtodeg(theta), color, 1);
draw_sprite_ext(spr_bone_top, 0, p2.x, p2.y, 1, 1, -radtodeg(theta)+180, color, 1);

shader_reset();