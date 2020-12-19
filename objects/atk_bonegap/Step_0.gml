/// @description Update bounding box
x += vel.x;
y += vel.y;

bounding[0].p1.set(x, y);
bounding[0].p2.set(x+10, y+gapPos);
bounding[0].theta = theta;

bounding[1].p1.set(x, y+gapPos+gapHeight);
bounding[1].p2.set(x+10, y+height);
bounding[1].theta = theta;

bounding[1].o.set(x+5, y);