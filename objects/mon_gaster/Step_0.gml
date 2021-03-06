/// @description Animation
// Inherit the parent event
event_inherited();

switch(state)
{
	case States.gaster:
		obj_soul.karma = false;
		dodge = false;
		with(gaster)
		{
			bodyScale = (sin( current_time/2000 * pi + pi/2) + 1)/2 * .25 + .875; //Add pi/2 to start at ~1
			
		}
		break;
	case States.sans:
		obj_soul.karma = true;
		dodge = true;
		with(sans)
		{
			var _time = oscillate(0, 1, frac(current_time / 2500 ));
			
			if(bodySprite == spr_sansb_torso)
			{
				switch(bodyState)
				{
					case 0:
						bodyX = animcurve_channel_evaluate(bodyChannelX, _time);
						bodyY = animcurve_channel_evaluate(bodyChannelY, _time);
						headY = sin(current_time / 318.3 * 3);
						break;
					case 1:
						bodyX = 0;
						bodyY = 0;
						headY = 0;
						break;
				}
			}
			else
			{
				var _numImages = sprite_get_number(bodySprite)-1;
				
				bodyX = animcurve_channel_evaluate(bodyChannelX, bodyImage/_numImages);
				bodyY = animcurve_channel_evaluate(bodyChannelY, bodyImage/_numImages);
				
				bodyImage += 0.25;
				
				if(bodyImage >= _numImages)
				{
					changeSprite("body", spr_sansb_torso, 0);
				}
			}
			
			if(headSprite != spr_sansb_face)
			{
				headImage += 0.1;
				
				if(headImage >= sprite_get_number(headSprite))
				{
					headImage = 0;
				}
			}
		}
		break;
}