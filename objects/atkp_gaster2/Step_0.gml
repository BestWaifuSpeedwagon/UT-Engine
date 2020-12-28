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
        audio_sound_set_track_position(mus_megalovania, 16);
        audio_play_sound(mus_megalovania, 3, true);
        
        heart.changeColor(BLUE);
        
        Slam(pi);
        
        AttackGasterBlaster(Box.fx1 + 15, Box.fy1 - 80, 90, 45, 30, 1, .5);
        break;
    case 87:
        mon_gaster.sans.changeSprite("body", spr_sansb_handdown, 0);
        break;
    case 90:
        
        Box.setOrigin(.5, 1);
        Box.move(320, 360);
        
        Box.resize(24, 24);
        
        Slam(pi/2);
        break;
    case 130:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(120, 120);
        break;
    case 150:
        for(i = 0; i < 20; i++)
        {
            var _diff = (sin(i/4 + 1)+1)/2 * (Box.fw-50);
            
            array_push(attacks, AttackBonegap(Box.fx1, Box.fy1 - i*18, Box.fw, pi/2*3, _diff, 30, 0, 5));
        }
        break;
    case 250:
        Box.setOrigin(1, .5);
        
        Box.move(480, 360);
        Box.resize(24, 24);
        
        forEach(attacks, function(b){ instance_destroy(b); });
        array_resize(attacks, 0);
        break;
    case 280:
        audio_play_sound(snd_spearrise, 3, false);
        Box.resize(320, 24);
        heart.changeColor(RED);

        for(i = 0; i < 12; i++)
        {
            var b = AttackBone(Box.fx1 - 30 - i*50, Box.fy1, Box.fh, 0, 3, 0);
            b.color = random(1) < .25 ? AQUA : ORANGE;
        }
        break;
    case 440:
    case 410:
    case 380:
    case 350:
        var _x = (timer-350)/30 * 64 + 32;
        
        AttackGasterBlaster(480 - _x, Box.fy1 - 100, 90, 60, 30, 1, 1);
        break;
    case 540:
        audio_play_sound(snd_spearrise, 3, false);
        
        Box.setOrigin(.5, .5);
        Box.move(320, 240);
        Box.resize(600, 440);
        
        break;
    //From 560 to 660
    case 720:
    	Box.setOrigin(1, .5);
    	Box.move(620, 240);
    	Box.resize(140, 20);
    	
    	Slam(0);
    	
    	break;
    case 740:
    	Box.resize(140, 300);
    	break;
    //From 740 to 860
    case 920:
        Box.setOrigin(.5, .5);
        Box.move(320, 240);
        Box.resize(20, 24);
        
	    heart.slam = true;
        break;
    case 930:
        array_push(attacks, AttackGasterBlaster(320-120, 240, 0, 1000, 1, 1, 1));
        break;
    case 940:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 - sin(pi/4)*120, 45, 1000, 1, 1, 1));
        break;
    case 950:
        array_push(attacks, AttackGasterBlaster(320, 240-120, 90, 1000, 1, 1, 1));
        break;
    case 960:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 - sin(pi/4)*120, 135, 1000, 1, 1, 1));
        break;
    case 970:
        array_push(attacks, AttackGasterBlaster(320 + 120, 240, 180, 1000, 1, 1, 1));
        break;
    case 980:
        array_push(attacks, AttackGasterBlaster(320 + cos(pi/4)*120, 240 + sin(pi/4)*120, 225, 1000, 1, 1, 1));
        break;
    case 990:
        array_push(attacks, AttackGasterBlaster(320, 240 + 120, 270, 1000, 1, 1, 1));
        break;
    case 1000:
        array_push(attacks, AttackGasterBlaster(320 - cos(pi/4)*120, 240 + sin(pi/4)*120, 315, 1000, 1, 1, 1));
        break;
    case 1060:
        flicker(10);
        
        Box.setOrigin(.5, .5);
        Box.freePos = false;
        Box.resize(125, 125);
        
        forEach(attacks, function(g){ instance_destroy(g); });
        array_resize(attacks, 0);
        break;
    case 1070:
        mon_gaster.sans.changeSprite("body", spr_sansb_handdown, 0);
        
        Slam(pi/2);
        AttackBonestab(1, 40, 30, 25);
        break;
    // case 770:
    //     stop_sound(mus_megalovania);
        
    //     sound_set_track_position(mus_gasterMegalovania, 30.8);
    //     play_sound(mus_gasterMegalovania, 3, true);
        
    //     heart.changeColor(RED);
        
    //     flicker(30);
        
    //     Box.resize(150, 150);
        
    //     mon_gaster.state = States.gaster;
    //     break;
    // case 780:
    //     var ga:atk_gasterhand = AttackGasterHand(Box.fx1 - 30, Box.fcy, 0, 60, 60, 2, AQUA);
    //     ga.turnIntoColor = true;
    //     break;
    // case 930:
    //     instance_destroy();
    //     break;
}

if(timer >= 560 && timer <= 660)
{
	if(timer % 10 == 0)
	{
		var __p = new Point(irandom(640), irandom(480));
	        
        var __dir = -point_direction(__p.x, __p.y, heart.x, heart.y);
        
        AttackGasterBlaster(__p.x, __p.y, __dir, 60, 30, .5, .5);
	}
}
else if(timer >= 720 && timer <= 860)
{
	if(timer % 40 == 0)
	{
		AttackBonegap(Box.x2, Box.y-10, Box.w, pi/2, 20, 14, 0, 3);
		AttackBonegap(Box.x2, Box.y2+10, Box.w, pi/2, 20, 14, 0, -3);
	}
}

if(keyboard_check(ord("A"))) Slam(pi    , 30);
if(keyboard_check(ord("Z"))) Slam(pi*1.5, 30);
if(keyboard_check(ord("D"))) Slam(0     , 30);
if(keyboard_check(ord("S"))) Slam(pi/2  , 30);

timer++;