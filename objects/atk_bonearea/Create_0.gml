/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

destroy = false;

width = ct_argument.width;
height = ct_argument.height;

tileWidth = max(1, abs(floor(width/12))); //Always at least 1 bone

velX = ct_argument.velX;
velY = ct_argument.velY;

bounding.p1.set(x, y);
bounding.p2.set(x+width, y+height);
bounding.theta = 0;

bounding.o.set(0, 0);