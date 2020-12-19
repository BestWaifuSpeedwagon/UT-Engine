/// @description Update bounding box
x += vel.x;
y += vel.y;

bounding.p1.set(x, y);
bounding.p2.set(x+10, y+height);
bounding.theta = theta;