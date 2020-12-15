/// @description Spawn bone area
time--;

if(time == 0)
{
	audio_play_sound(snd_spearrise, 3, false);
	boneArea = AttackBonearea(_x, _y, _w, _h, 0, 0);
}
else if(time >=-5)
{
	boneArea.x -= cos( dir/4 * pi * 2 ) * height / 5;
	boneArea.y -= sin( dir/4 * pi * 2 ) * height / 5;
}
else if(time < -60 && time >= -65)
{
	boneArea.x += cos( dir/4 * pi * 2 ) * height / 5;
	boneArea.y += sin( dir/4 * pi * 2 ) * height / 5;
	
	time--;
}
else
{
	instance_destroy(boneArea);
	instance_destroy();
}