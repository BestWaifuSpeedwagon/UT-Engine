/// @description Move bounding box etc etc
x += velX;
y += velY;

bounding.p1.set(x, y);
bounding.p2.set(x+width, y+height);