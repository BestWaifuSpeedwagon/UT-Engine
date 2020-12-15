/// @description Animation
// Inherit the parent event
event_inherited();

var _time = oscillate(0, 1, frac(current_time / 2000 ));

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

if(bodySprite != NULL)
{
	bodyImage += 0.1;
	
	if(bodyImage >= sprite_get_number(bodySprite)-1)
	{
		bodySprite = NULL;
		bodyImage = 0;
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