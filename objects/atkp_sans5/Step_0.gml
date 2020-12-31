/// @description Spawn attacks
//!#import attack.sans.*
switch(timer)
{
	case 30:
		flicker(10);
		
		heart.changeColor(RED);
		
		mon_sans.changeSprite("head", spr_sansb_face, 5);
		mon_sans.changeSprite("body", spr_sansb_torso, 0);
		
		Box.move(320, 250, 1);
		Box.resize(50, 32, 1);
		
		instance_destroy(tempAttack);
		break;
	case 40:
		audio_play_sound(snd_bell, 3, false);
		attack_sans_gaster_blaster(Box.x + 70, Box.y - 40, 90, 60, 30, 1, 1);
		break;
	case 80:
		Box.setOrigin(0, 0.5);
		Box.resize(100, 32);
		break;
	case 150:
		Box.setOrigin(1, .5);
		Box.move(470, 240);
		Box.resize(20, 32);
		break;
	case 200:
		Box.resize(320, 100);
		
		for(i = 0; i < 6; i++)
		{
			attack_sans_bonerepeat(Box.fx2 - 300*(i+1)/7, Box.fy-70 - i*10 + sin(i*2)*20, 40, 0, 40, 8 - floor(i/2), 0, 2);
		}
		break;
	case 260:
		attack_sans_gaster_blaster(Box.fx2, Box.fy-40, 90, 90, 60, 1, 1);
		break;
	case 290:
		attack_sans_gaster_blaster(Box.fx2 - 84, Box.fy-40, 90, 90, 60, 1, 1);
		break;
	case 320:
		attack_sans_gaster_blaster(Box.fx2 - 168, Box.fy-40, 90, 90, 60, 1, 1);
		break;
	case 350:
		attack_sans_gaster_blaster(Box.fx2 - 252, Box.fy-40, 90, 90, 60, 1, 1);
		break;
}

timer++;