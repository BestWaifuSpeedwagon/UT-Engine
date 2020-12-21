//!#import audio.*

switch(timer)
{
    case 0:
        flicker(10, false);
        audio_pause_sound(mus_gasterMegalovania);
        
        mon_gaster.state = States.sans;
        
        Box.setOrigin(.5, .5);
        Box.move(320, 320, 1);
        Box.resize(120, 50, 1);
        break;
    case 10:
        audio_sound_set_track_position(mus_megalovania, 16000);
        audio_play_sound(mus_megalovania, 3, true);
        
        AttackGasterBlaster(Box.fx1 + 32, Box.fy1 - 80, 90, 60, 30, 1, 1);
        break;
    case 80:
        heart.changeColor(BLUE);
        
        Box.setOrigin(.5, 1);
        Box.move(320, 360);
        
        Box.resize(16, 16);
        break;
    case 110:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(120, 120);
        
        for(i = 0; i < 20; i++)
        {
            array_push(attacks, AttackBonegap(Box.fx1, Box.fy1 - i*16, Box.fw, pi/2*3, sin(i/4)*Box.fw/5 + Box.fw/2, 30, 0, 4));
        }
        break;
    case 220:
        Box.setOrigin(1, .5);
        
        Box.move(480, 360);
        Box.resize(20, 20);
        
        forEach(attacks, function(b){ instance_destroy(b); });
        array_resize(attacks, 0);
        break;
    case 250:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(320, 20);
        heart.changeColor(RED);
        
        for(i = 0; i < 15; i++)
        {
            var b = AttackBone(Box.fx1 - i*45, Box.fy1, Box.fh, 0, 4, 0);
            b.color = random(1) < .25 ? AQUA : ORANGE;
        }
        break;
    case 310:
        AttackGasterBlaster(480 - 32, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 340:
        AttackGasterBlaster(480 - 96, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 370:
        AttackGasterBlaster(480 - 160, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 400:
        AttackGasterBlaster(480 - 224, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 500:
        Box.setOrigin(.5, .5);
        Box.move(320, 240);
        Box.resize(30, 30);
        break;
    case 510:
        audio_play_sound(snd_impact, 5, false);
        screenShake(15);
        
        array_push(attacks, AttackGasterBlaster(320-120, 240, 0, 1000, 1, 1, 1));
        break;
    case 520:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 - sin(pi/4)*120, 45, 1000, 1, 1, 1));
        break;
    case 530:
        array_push(attacks, AttackGasterBlaster(320, 240-120, 90, 1000, 1, 1, 1));
        break;
    case 540:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 - sin(pi/4)*120, 135, 1000, 1, 1, 1));
        break;
    case 550:
        array_push(attacks, AttackGasterBlaster(320 + 120, 240, 180, 1000, 1, 1, 1));
        break;
    case 560:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 + sin(pi/4)*120, 225, 1000, 1, 1, 1));
        break;
    case 570:
        array_push(attacks, AttackGasterBlaster(320, 240 + 120, 270, 1000, 1, 1, 1));
        break;
    case 580:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 + sin(pi/4)*120, 315, 1000, 1, 1, 1));
        break;
    case 610:
        flicker(30, true);
        
        Box.setOrigin(.5, .5);
        Box.freePos = false;
        Box.resize(125, 125);
        
        forEach(attacks, function(g){ instance_destroy(g); });
        break;
    case 760:
        Slam(pi/4);
        AttackBonestab(1, 40, 40);
        break;
}

timer++;