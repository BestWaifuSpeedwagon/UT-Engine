/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

height = 10; //Changed later
theta = 0; //Radians, changed later

vel = new Vector(0, 0);

gapPos = 0; //[ where, size ]
gapHeight = 0;

boundingAmount = 2;
bounding = [ new BoundingBox(), new BoundingBox() ];

bounding[0].o.set(5, 0);

bounding[1].relative = false;

destroy = false;