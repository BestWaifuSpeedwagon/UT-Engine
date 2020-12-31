/// @description Spawn bone area
time--;

if(time > 0){}
else if(time == 0)
{
	audio_play_sound(snd_spearrise, 3, false);
	boneArea = attack_sans_bonearea(_x, _y, _w, _h, new Vector(0, 0));
}
else if(time > -30)
{
	boneArea.x = lerp(boneArea.x, _x - cos( dir/4 * pi * 2 )*_w, 0.2);
	boneArea.y = lerp(boneArea.y, _y - sin( dir/4 * pi * 2 )*_h, 0.2);
}
else if(time > -destroy-30)
{
	boneArea.x = lerp(boneArea.x, _x, 0.2);
	boneArea.y = lerp(boneArea.y, _y, 0.2);
	
	time--;
}

if(time < -destroy-30)
{
	instance_destroy(boneArea);
	instance_destroy();
}