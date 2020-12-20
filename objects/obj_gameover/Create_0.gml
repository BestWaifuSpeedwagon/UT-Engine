/// @description 
_hx = obj_heartmove.x;
_hy = obj_heartmove.y;

x = 320;
y = 120;

timer = 0;

fade = 0;
fadeOut = false;

room = rm_gameover;

dontGiveUp = new Dialogue(["Don't give up.", obj_stat.name + "!,{30} Stay DETERMINED"], false, snd_txtasg);
dontGiveUp.spd = 5;
dontGiveUp.pause = true;
dontGiveUp.skippable = false;

audio_stop_all();