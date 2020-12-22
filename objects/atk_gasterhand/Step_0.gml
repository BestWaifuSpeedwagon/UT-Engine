/// @description Decrease timer, then fire
if(timer > 0)
{
	x += (wantedX-x)/10;
	y += (wantedY-y)/10;
	
	timer--;
}
else if(timer == 0)
{
	audio_play_sound(snd_gaster_blast, 0, false);
	
	screenShake(max(image_xscale*image_yscale, 5));
	
	collision = true;
	
	x -= cos(wantedDir)*10;
	y -= sin(wantedDir)*10;
	
	timer = -1;
}
else if(timer > -fadeOut)
{
	size += min(1-size, 0.05);
	timer--;
	
	x -= cos(wantedDir)/40;
	y -= sin(wantedDir)/40;
}
else
{
	alpha -= 1/room_speed;
	size = sqr(alpha);
	vel -= 0.2;
	
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
	
	
	
	if(x > -100 && y > -128*image_yscale && x < 740 && y < 480 + 128*image_yscale)
	{
		x += cos(wantedDir)*vel;
		y += sin(wantedDir)*vel;
	}
}

t += 1/room_speed;