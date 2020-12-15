/// @description Spawn bone area
if(time > 0) time--
else if(time == 0)
{
	audio_play_sound(snd_spearrise, 3, false);
	ct_argument = 
	{
		width: _w,
		height: _h,
		angle: dir,
		velX: 0,
		velY: 0
	}
	
	boneArea = instance_create_layer(_x, _y, "Attacks", atk_bonearea);
	
	ct_argument = undefined;
	
	time--;
}
else if(time > -5)
{
	var _spd = height/4;
	
	boneArea.x += cos( (dir/4-.25) * pi * 2 ) * _spd;
	boneArea.y += sin( (dir/4-.25) * pi * 2 ) * _spd;
	
	time--;
}
else if(time > -60) time--;
else if(time > -65)
{
	var _spd = height/5;
	
	boneArea.x -= cos( dir/4-.25 * pi * 2 ) * _spd;
	boneArea.y -= sin( dir/4-.25 * pi * 2 ) * _spd;
	
	time--;
}
else
{
	instance_destroy(boneArea);
	instance_destroy();
}