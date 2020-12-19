/// @description Move bounding box etc etc
x += vel.x;
y += vel.y;

bounding.p1.set(x, y);
bounding.p2.set(x+width, y+height);