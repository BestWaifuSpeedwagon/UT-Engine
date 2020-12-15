/// @description Decrease timer, then fire
if(timer > 0)
{
	x += (wantedX-x)/10;
	y += (wantedY-y)/10;
	
	timer--;
	
	if(timer <= 40) image_index = floor(1 - timer/40)*4;
}
else if(timer == 0)
{
	audio_play_sound(snd_gaster_blast, 0, false);
	
	screenShake(max(image_xscale*image_yscale, 5));
	
	collision = true;
	
	sprite_index = spr_gasterblaster_fire;
	image_speed = 0.1;
	
	timer = -1;
}
else if(timer > -fadeOut)
{
	size += min(1-size, 0.05);
	timer--;
}
else
{
	alpha -= 4/room_speed;
	size = sqr(alpha);
	
	collision = false;
	
	if(alpha <= 0)
	{
		instance_destroy();
	}
}

if(timer < 0)
{
	//Set bounding box
	bounding.p1.set(x, y - 32*image_yscale*size);
	bounding.p2.set(x+length, y + 32*image_yscale*size);
	bounding.o.set(x, y);
	bounding.theta = wantedDir;
	//Increase size / Move
	if(length < 2000) length += 50;
	
	if(x > -100 && y > -100 && x < 740 && y < 580)
	{
		vel -= 0.5;
		x += cos(wantedDir)*vel;
		y += sin(wantedDir)*vel;
	}
}

t += 1/room_speed;