/// @description Set variables
timer = -1;

damage = ct_argument.damage;
monster = ct_argument.monster;
mon = obj_soul.monster[monster];

audio_play_sound(snd_laz, 0, false);