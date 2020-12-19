/// @description Spawn bone area
time--;

if(time > 0){}
else if(time == 0)
{
	audio_play_sound(snd_spearrise, 3, false);
	boneArea = AttackBonearea(_x, _y, _w, _h, new Vector(0, 0));
}
else if(time > -60)
{
	boneArea.x = lerp(boneArea.x, _x - cos( dir/4 * pi * 2 )*_h, 0.2);
	boneArea.y = lerp(boneArea.y, _y - sin( dir/4 * pi * 2 )*_h, 0.2);
}
else if(time > -80)
{
	boneArea.x = lerp(boneArea.x, _x, 0.2);
	boneArea.y = lerp(boneArea.y, _y, 0.2);
	
	time--;
}
else if(time < -80)
{
	instance_destroy(boneArea);
	instance_destroy();
}