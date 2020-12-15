/// @description Start values
timer = 0;

monster = ct_argument.monster;
karma = ct_argument.karma;
music = ct_argument.music;
originalRoom = ct_argument.originalRoom;
startAttack = ct_argument.startAttack;

if(instance_exists(obj_player))
{
	sx = obj_player.x;
	sy = obj_player.y;
}
else
{
	sx = 160;
	sy = 120;
}

x = sx;
y = sy;

audio_play_sound(snd_b, 1, false);