/// @description Creation
// /!\ Use the gaster blaster function to create one !

// Inherit the parent event
event_inherited();

audio_play_sound(snd_gaster_blaster, 0, false);

passthrough = true;
damage = 1; //K A R M A

collision = false; //No collision at first, and removed when fading away
destroy = false;

wantedX = ct_argument.wantedX;
wantedY = ct_argument.wantedY;
wantedDir = ct_argument.wantedDir;
image_angle = -radtodeg(wantedDir);

timer = ct_argument.timer; //Time before it fires
fadeOut = ct_argument.fadeOut; //Time for it to start fading out

//image_xscale; Set later
//image_yscale;

t = 0;

size = 0; //Size of the blast, from 0 to 1, relative to yscale

length = 0; //Length of the blas, from 0 to 1

alpha = 1; //For fading away at the end
vel = 0; //Accelerate when the beam is fired

image_speed = 0;

bounding.relative = false;