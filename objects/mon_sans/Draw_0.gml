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
		if(bodySprite != spr_sansb_torso)
		{
			draw_sprite_ext(bodySprite, bodyImage, x, y-46, 2, 2, 0, c_white, 1); //Always elative to torso
		}
		else
		{
			draw_sprite_ext(spr_sansb_legs, 0, x, y, 2, 2, 0, c_white, 1);
			draw_sprite_ext(spr_sansb_torso, bodyImage, x + bodyX, y-46 + bodyY, 2, 2, 0, c_white, 1);
		}
		draw_sprite_ext(headSprite, headImage, x + bodyX, y-38-50 + bodyY + headY, 2, 2, 0, c_white, 1);
	}
}