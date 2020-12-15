/// @description Set random speed and direction
image_speed = 0.1;

dir = irandom(90)+45;
speed = random(5)+3;

hspeed = dcos(dir)*speed;
vspeed = dsin(dir)*speed;