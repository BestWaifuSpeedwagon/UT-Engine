/// @description Draw myself with shader
shader_set(shd_insideOutside);

shader_set_uniform_i(u_u.insideOutside_inside, inside);
shader_set_uniform_f(u_u.insideOutside_box, Box.x, Box.y, Box.x2, Box.y2);

draw_set_color(color);
drawRectangleRotated(x+2, y+6, x+8, y+height-6, 3, -6, theta, true, false);

var p1/*:Point*/ = new Point(x, y),
	p2/*:Point*/ = new Point(x+10, y+height);

p1.rotate(x+5, y, theta);
p2.rotate(x+5, y, theta);

var angle = round(-radtodeg(theta));

draw_sprite_ext(spr_bone_top, 0, p1.x, p1.y, 1, 1, angle, color, 1);
draw_sprite_ext(spr_bone_bottom, 0, p2.x, p2.y, 1, 1, angle, color, 1);

shader_reset();