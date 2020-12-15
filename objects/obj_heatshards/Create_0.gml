/// @description Set random speed and direction
image_speed = 0.3;

dir = irandom(70)+245;
speed = random(5)+3;

hspeed = dcos(dir)*speed;
vspeed = dsin(dir)*speed;