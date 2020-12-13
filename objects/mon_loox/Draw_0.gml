/// @description Draw myself
if(killed)
{
	shader_set(shd_dust);
	shader_set_uniform_f(u_uFraction, fraction);
	shader_set_uniform_f(u_uY, y - sprite_height);
	shader_set_uniform_f(u_uHeight, sprite_height);
	
	draw_sprite(spr_looxhurt, 0, x, y);
	
	shader_reset();
}
else
{
	if(hurt)
	{
		draw_sprite(spr_looxhurt, 0, x + irandom_range(-5, 5), y);
	}
	else if(spared)
	{
		draw_sprite_ext(spr_looxhurt, 0, x, y, 1, 1, 0, c_white, 0.5);
	}
	else
	{
		draw_self();
	}
}