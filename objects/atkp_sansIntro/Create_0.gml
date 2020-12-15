/// @description Timer
Box.wantedW = 165;
Box.wantedH = 165;

timer = 0;
num = 0;

currentSpeech = new Speech(
	[ "ready?" ],
	fnt_sans,
	snd_txtsans, 
	spr_blconwdshrt,
	true,
	mon_sans.x + mon_sans.width/2 + 20,
	mon_sans.y - mon_sans.height/2
);

mon_sans.headImage = 4;
mon_sans.bodyState = 1;