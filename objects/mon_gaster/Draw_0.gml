/// @description Draw myself
surface_set_target(monsterSurf);

if(killed)
{
	shader_set(shd_dust);
	shader_set_uniform_f(u_u.dust_fraction, fraction);
	shader_set_uniform_f(u_u.dust_y, y - height);
	shader_set_uniform_f(u_u.dust_height, height);
	
	draw_sprite(spr_looxhurt, 0, x, y);
	
	shader_reset();
}
else
{
	switch(state)
	{
		case States.gaster:
			with(gaster)
			{
				draw_sprite_ext(spr_gaster_body, 0, other.x, other.y, 1, bodyScale, 0, c_white, 1);
			}
			draw_sprite_ext(hand1.sprite_index, hand1.image_index, hand1.x, hand1.y, hand1.image_xscale, 1, 0, c_white, 1);
			draw_sprite_ext(hand2.sprite_index, hand2.image_index, hand2.x, hand2.y, hand2.image_xscale, 1, 0, c_white, 1);
			break;
		case States.sans:
			with(sans)
			{
				if(bodySprite != spr_sansb_torso)
				{
					draw_sprite_ext(bodySprite, bodyImage, other.x, other.y-46, 2, 2, 0, c_white, 1); //Always elative to torso
				}
				else
				{
					draw_sprite_ext(spr_sansb_legs, 0, other.x, other.y, 2, 2, 0, c_white, 1);
					draw_sprite_ext(spr_sansb_torso, bodyImage, other.x + bodyX, other.y-46 + bodyY, 2, 2, 0, c_white, 1);
				}
				draw_sprite_ext(headSprite, headImage, other.x + bodyX, other.y-38-50 + bodyY + headY, 2, 2, 0, c_white, 1);
			}
			break;
	}
}

surface_reset_target();