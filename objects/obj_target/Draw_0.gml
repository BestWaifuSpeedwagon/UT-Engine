/// @description Draw myself + target
draw_self();

draw_set_color(c_white);
draw_rectangle(barX-5, y, barX+5, y+115, false);

draw_set_color(get_timer() % 10 < 5 ? c_white : c_black);
draw_rectangle(barX-5, y, barX+5, y+115, true);