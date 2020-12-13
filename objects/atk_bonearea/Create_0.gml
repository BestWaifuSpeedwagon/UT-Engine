/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

destroy = false;

width = ct_argument.width;
height = ct_argument.height;
angle = ct_argument.angle; //0->0, 1->90, 2->180, 3->270

tileWidth = max(1, floor(width/12)); //Always at least 1 bone

velX = ct_argument.velX;
velY = ct_argument.velY;

bounding.p1.set(x, y);
bounding.p2.set(x+width, y+height);
bounding.theta = angle/4 * pi * 2;

bounding.o.set(width/2, height/2);