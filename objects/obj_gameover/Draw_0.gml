/// @description Draw heart

if(timer < 60)
{
	var randPos = random(exp((-(30-timer)/20)*2));
	draw_sprite_ext(spr_heart, 0, _hx + randPos*choose(1, -1), _hy + randPos*choose(1, -1), 1, 1, 0, c_red, 1);
}
else if(timer < 119) draw_sprite(spr_heartbreak, 0, _hx, _hy);

if(fade > 0)
{
	image_alpha = fade;
	draw_self();
	
	draw_set_alpha(fade);
	
	draw_set_halign(fa_left);
	dontGiveUp.draw();
	
	draw_set_alpha(1);
}