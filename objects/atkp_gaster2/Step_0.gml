//!#import audio.*

switch(timer)
{
    case 0:
        flicker(10);
        audio_stop_sound(mus_gasterMegalovania);
        
        mon_gaster.state = States.sans;
        
        Box.setOrigin(.5, .5);
        Box.move(320, 320, 1);
        Box.resize(120, 50, 1);
        break;
    case 10:
        audio_play_sound(mus_megalovaniaQuickStart, 3, true);
        
        heart.changeColor(BLUE);
        
        Slam(pi);
        
        AttackGasterBlaster(Box.fx1 + 30, Box.fy1 - 80, 90, 45, 30, 1, 1);
        break;
    case 87:
        mon_gaster.sans.changeSprite("body", spr_sansb_handdown, 0);
        break;
    case 90:
        
        Box.setOrigin(.5, 1);
        Box.move(320, 360);
        
        Box.resize(16, 16);
        
        Slam(pi/2);
        break;
    case 130:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(120, 120);
        break;
    case 150:
        for(i = 0; i < 20; i++)
        {
            array_push(attacks, AttackBonegap(Box.fx1, Box.fy1 - i*16, Box.fw, pi/2*3, sin(i/4)*Box.fw/6 + Box.fw/3, 30, 0, 5));
        }
        break;
    case 250:
        Box.setOrigin(1, .5);
        
        Box.move(480, 360);
        Box.resize(20, 20);
        
        forEach(attacks, function(b){ instance_destroy(b); });
        array_resize(attacks, 0);
        break;
    case 280:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(320, 20);
        heart.changeColor(RED);

        for(i = 0; i < 13; i++)
        {
            var b = AttackBone(Box.fx1 - 30 - i*50, Box.fy1, Box.fh, 0, 4, 0);
            b.color = random(1) < .25 ? AQUA : ORANGE;
        }
        break;
    case 350:
        AttackGasterBlaster(480 - 32, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 380:
        AttackGasterBlaster(480 - 96, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 410:
        AttackGasterBlaster(480 - 160, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 440:
        AttackGasterBlaster(480 - 224, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 540:
        Box.setOrigin(.5, .5);
        Box.move(320, 240);
        Box.resize(16, 16);
        break;
    case 550:
        audio_play_sound(snd_impact, 5, false);
        screenShake(60);
        
        array_push(attacks, AttackGasterBlaster(320-120, 240, 0, 1000, 1, 1, 1));
        break;
    case 560:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 - sin(pi/4)*120, 45, 1000, 1, 1, 1));
        break;
    case 570:
        array_push(attacks, AttackGasterBlaster(320, 240-120, 90, 1000, 1, 1, 1));
        break;
    case 580:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 - sin(pi/4)*120, 135, 1000, 1, 1, 1));
        break;
    case 590:
        array_push(attacks, AttackGasterBlaster(320 + 120, 240, 180, 1000, 1, 1, 1));
        break;
    case 600:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 + sin(pi/4)*120, 225, 1000, 1, 1, 1));
        break;
    case 610:
        array_push(attacks, AttackGasterBlaster(320, 240 + 120, 270, 1000, 1, 1, 1));
        break;
    case 620:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 + sin(pi/4)*120, 315, 1000, 1, 1, 1));
        break;
    case 660:
        flicker(30);
        
        Box.setOrigin(.5, .5);
        Box.freePos = false;
        Box.resize(125, 125);
        
        forEach(attacks, function(g){ instance_destroy(g); });
        array_resize(attacks, 0);
        break;
    case 690:
        mon_gaster.sans.changeSprite("body", spr_sansb_handdown, 0);
        
        Slam(pi/2);
        AttackBonestab(1, 40, 30, 10);
        break;
    case 740:
        flicker(5);
        break;
    case 745:
        heart.x = Box.fcx;
        heart.y = Box.fcy;
        
        mon_gaster.sans.changeSprite("body", spr_sansb_handup, 0);
        Slam(pi * 1.5);
        
        AttackBonestab(2, 40, 30, 10);
        AttackBonestab(3, 40, 30, 10);
        
        break;
    case 780:
        flicker(5);
        break;
}

timer++;