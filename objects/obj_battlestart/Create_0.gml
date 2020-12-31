/// @description Start values
timer = 0;

monster = ct_argument.monster;
karma = ct_argument.karma;
music = ct_argument.music;
originalRoom = ct_argument.originalRoom;
startAttack = ct_argument.startAttack;

sx = obj_player.x + 12;
sy = obj_player.y;

obj_player.hold = true;

x = sx;
y = sy;

audio_play_sound(snd_b, 1, false);