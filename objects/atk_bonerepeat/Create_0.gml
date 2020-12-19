/// @description Repeatedly place bones
event_inherited();

spacing = ct_argument.spacing;
amount = ct_argument.amount;

height = ct_argument.height;
vel = ct_argument.vel;
theta = ct_argument.theta;

timer = (spacing + cos(theta + pi/4)*12 + sin(theta + pi/4)*height) / vel.magnitude(); //Add the bone width
t = timer;

collision = false;