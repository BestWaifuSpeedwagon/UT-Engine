///@description Get those bones
if(currentSpeech != NULL)
{
	if(currentSpeech.dialogue.update())
	{
		delete currentSpeech;
		
		currentSpeech = NULL;
		
		if(timer > 0)
		{
			mon_sans.bodyState = 0;
			
			audio_play_sound(mus_megalovania, 3, false);
			instance_destroy();
		}
	}
}
else
{
	switch(timer)
	{
		case 0:
			flicker(4);
			break;
		case 4:
			mon_sans.changeSprite("head", spr_sansb_blueeye, 0);
			mon_sans.changeSprite("body", spr_sansb_handdown, 0);
			audio_play_sound(snd_gaster_blaster, 3, false);
			break;
		case 20:
			Slam(pi/2);
			break;
		case 50:
			mon_sans.changeSprite("head", spr_sansb_face, 5);
			mon_sans.changeSprite("body", spr_sansb_handup, 0);
			mon_sans.bodySprite = spr_sansb_handup;
			
			AttackBonestab(0, 54, 10);
			break;
		case 92:
			mon_sans.changeSprite("body", spr_sansb_handright, 0);
			
			heart.changeColor(RED);
			break;
		case 116:
			audio_play_sound(snd_gaster_blaster, 3, false);
			break;
		case 140:
			for(i = 0; i < 20; i++)
			{
				AttackBonegap(Box.x - i*24, Box.y, Box.h, 0, 6, 0, sin(i/3)*20 + 40, 40);
			}
			break;
		case 206:
			AttackGasterBlaster(Box.x-60 ,Box.y    ,0  , 51, 50, 1, 1);
			AttackGasterBlaster(Box.x    ,Box.y-60 ,90 , 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2+60,Box.y2   ,180, 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2   ,Box.y2+60,270, 51, 50, 1, 1);
			break;
		case 260:
			AttackGasterBlaster(Box.x-30 , Box.y-30 , 45 , 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2+30, Box.y-30 , 135, 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2+30, Box.y2+30, 225, 51, 50, 1, 1);
			AttackGasterBlaster(Box.x-30 , Box.y2+30, 315, 51, 50, 1, 1);
			break;
		case 314:
			AttackGasterBlaster(Box.x-60 ,Box.y    ,0  , 51, 50, 1, 1);
			AttackGasterBlaster(Box.x    ,Box.y-60 ,90 , 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2+60,Box.y2   ,180, 51, 50, 1, 1);
			AttackGasterBlaster(Box.x2   ,Box.y2+60,270, 51, 50, 1, 1);
			break;
		case 356:
			AttackGasterBlaster(Box.x-50  ,Box.cy ,0  , 70, 180, 2, 2);
			AttackGasterBlaster(Box.x2+50 ,Box.cy ,180, 70, 180, 2, 2);
		case 600:
			mon_sans.changeSprite("head", spr_sansb_face, 0);
			currentSpeech = new Speech(
				[ "here we go." ],
				fnt_sans,
				snd_txtsans, 
				spr_blconwdshrt,
				true,
				mon_sans.x + mon_sans.width/2 + 20,
				mon_sans.y - mon_sans.height/2
			);
			break;
	}
	timer++;
}