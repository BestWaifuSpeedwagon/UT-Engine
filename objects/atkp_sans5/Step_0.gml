/// @description Spawn attacks
switch(timer)
{
	case 30:
		flicker(10);
		
		mon_sans.changeSprite("head", spr_sansb_face, 5);
		mon_sans.changeSprite("body", spr_sansb_torso, 0);
		
		Box.setOrigin(.5, .5);
		Box.instantMove(320, 250);
		Box.instantResize(50, 50);
		
		instance_destroy(tempAttack);
		break;
	case 40:
		audio_play_sound(snd_bell, 3, false);
		AttackGasterBlaster(Box.cx, Box.y - 40, 90, 60, 30, 1, 1);
		break;
	case 80:
		Box.resize(100, 50);
		break;
	case 150:
		Box.setOrigin(1, 0);
		
		Box.resize(300, 100);
		break;
}


timer++;