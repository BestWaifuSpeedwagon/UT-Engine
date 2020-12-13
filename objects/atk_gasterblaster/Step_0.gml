/// @description Decrease timer, then fire
if(timer > 0)
{
	x = lerp(x, wantedX, 0.1);
	y = lerp(y, wantedY, 0.1);
	
	var dd = angle_difference(image_angle, -radtodeg(wantedDir));
	image_angle -= min(abs(dd), 5) * sign(dd);
	
	timer--;
}
else if(timer == 0)
{
	audio_play_sound(snd_rainbowbeam, 0, false);
	collision = true;
	
	image_speed = 0.3;
	
	timer = -1;
}
else if(timer > -fadeOut)
{
	size = lerp(size, 1, 0.1);
	timer--;
}
else
{
	alpha -= 4/room_speed; //Fade out in 0.25 seconds
	
	if(alpha < 0.5)
	{
		collision = false;
		size = lerp(size, 0, 0.2);
	}
	
	if(alpha <= 0)
	{
		instance_destroy();
	}
}

if(timer < 0)
{
	//Loop animation
	if(image_index == 6) image_index = 4;
	
	//Set bounding box
	bounding.p1.set(x, y-42*image_yscale*size);
	bounding.p2.set(x+length, y+42*image_yscale*size);
	bounding.o.set(x, y);
	bounding.theta = wantedDir;
	//Increase size / Move
	if(length < 2000) length += 50;
	
	if(x > -100 && y > -100 && x < 740 && y < 580)
	{
		vel -= 0.3;
		x += cos(wantedDir)*vel;
		y += sin(wantedDir)*vel;
	}
}

t += 1/room_speed;