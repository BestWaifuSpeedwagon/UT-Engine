/// @description Set random speed and direction
image_speed = 0.1;

dir = irandom(90)+45;
speed = random(5)+3;

hspeed = cos(dir)*speed;
vspeed = sin(dir)*speed;