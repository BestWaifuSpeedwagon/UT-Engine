/// @description 
_hx = obj_heartmove.x;
_hy = obj_heartmove.y;

x = 320;
y = 120;

timer = 0;

fade = 0;

room = rm_gameover;

dontGiveUp = new Dialogue(["Don't give up.", obj_stat.name + "!,{30}\nStay DETERMINED"], false, snd_txtasg);
dontGiveUp.spd = 4;
dontGiveUp.pause = true;
dontGiveUp.skippable = false;
dontGiveUp.x = 320;

audio_stop_all();