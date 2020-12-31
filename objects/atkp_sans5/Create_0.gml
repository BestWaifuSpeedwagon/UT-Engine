/// @description Resize + values
Box.fw = 375;

tempAttack = attack_sans_bonearea(0, Box.y, -Box.fw, Box.h, 10, 0);

mon_sans.changeSprite("body", spr_sansb_torso, 1);
heart.color = BLUE;

timer = 0;