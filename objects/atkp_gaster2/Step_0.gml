// #import audio.*

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
        audio_play_sound(mus_megalovania, 3, true);
        audio_sound_set_track_position(mus_megalovania, 16);
        
        AttackGasterBlaster(Box.fx1 + 32, Box.fy1 - 80, 90, 60, 30, 1, 1);
        break;
    case 60:
        heart.changeColor(BLUE);
        
        Box.setOrigin(.5, 1);
        Box.spdPos = .05;
        Box.spdSize = .05;
        
        Box.move(320, 360);
        
        Box.resize(16, 16);
        break;
    case 80:
        audio_play_sound(snd_spearrise, 3, false);
        
        Box.resize(120, 120);
        
        for(i = 0; i < 20; i++)
        {
            array_push(bones, AttackBonegap(Box.fx1, Box.fy1 - i*16 - 40, Box.fw, pi/2*3, sin(i/2)*Box.fw/4, 30, 0, 3));
        }
        break;
    case 260:
        Box.setOrigin(1, .5);
        
        Box.spdPos = .1;
        Box.spdSize = .1;
        
        Box.move(480, 360);
        Box.resize(30, 30);
        
        forEach(bones, function(b){ instance_destroy(b); });
        break;
    case 300:
        Box.resize(300, 30);
        break;
    
}

timer++;