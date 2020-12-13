/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
bounding.p1.set(x, y);
bounding.p2.set(x+16, y+16);

bounding.theta = dir;
image_angle = -radtodeg(dir);

x += cos(dir)*2;
y += sin(dir)*2;