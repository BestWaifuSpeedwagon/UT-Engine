/// @description Draw myself
if(killed)
{
	shader_set(shd_dust);
	shader_set_uniform_f(u_uFraction, fraction);
	shader_set_uniform_f(u_uY, y - height);
	shader_set_uniform_f(u_uHeight, height);
	
	draw_sprite(spr_looxhurt, 0, x, y);
	
	shader_reset();
}
else
{
	if(spared)
	{
		draw_sprite_ext(spr_looxhurt, 0, x, y, 1, 1, 0, c_white, 0.5);
	}
	else
	{
		if(bodySprite)
		{
			draw_sprite_ext(bodySprite, floor(bodyImage), x, y, 2, 2, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_sansb_legs, 0, x, y, 2, 2, 0, c_white, 1);
			draw_sprite_ext(spr_sansb_torso, 0, x + bodyX, y-46 + bodyY, 2, 2, 0, c_white, 1);
		}
		draw_sprite_ext(headSprite, headImage, x + bodyX, y-46-38 + bodyY + headY, 2, 2, 0, c_white, 1);
	}
}