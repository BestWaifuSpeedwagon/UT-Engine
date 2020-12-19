/// @description Draw myself with shader
shader_set(shd_insideOutside);

shader_set_uniform_i(u_u.insideOutside_inside, inside);
shader_set_uniform_f(u_u.insideOutside_box, Box.x, Box.y, Box.x2, Box.y2);

draw_set_color(color);

var _y1 = [ y, y+gapPos+gapHeight ],
	_y2 = [ y+gapPos, y+height ];

var angle = round(-radtodeg(theta));

for(i = 0; i < 2; i++)
{
	drawRectangleRotated(x+2, _y1[i]+6, x+8, _y2[i]-6, x+5, y, theta, false, false);

	var p1 = new Point(x, _y1[i]),
		p2 = new Point(x+10, _y2[i]);

	p1.rotate(x+5, y, theta);
	p2.rotate(x+5, y, theta);

	draw_sprite_ext(spr_bone_top, 0, p1.x, p1.y, 1, 1, angle, color, 1);
	draw_sprite_ext(spr_bone_bottom, 0, p2.x, p2.y, 1, 1, angle, color, 1);
}

shader_reset();