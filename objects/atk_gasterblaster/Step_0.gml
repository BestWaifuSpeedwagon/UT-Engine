/// @description Decrease timer, then fire

image_angle = lerp(image_angle, -radtodeg(wantedDir), .1);

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
	
	screenShake(10);
	
	collision = true;
	
	sprite_index = spr_gasterblaster_fire;
	image_speed = 0.1;
	
	timer = -1;
}
else if(timer > -fadeOut)
{
	size = min(size+.0625, 1);
	
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
	bounding.p2.set(x+2000, y + 32*image_yscale*size);
	bounding.o.set(x, y);
	bounding.theta = wantedDir;
	//Increase size / Move
	if(x > -sprite_width && y > -sprite_height && x < 640+sprite_width && y < 480+sprite_height)
	{
		vel -= 0.5;
		x += cos(wantedDir)*vel;
		y += sin(wantedDir)*vel;
	}
}

t += 1/room_speed;