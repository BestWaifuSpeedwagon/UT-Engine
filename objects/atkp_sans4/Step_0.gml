///@description Get those bones
switch(timer)
{
	case 0:
		Platform(15, 346, 61, 2, 0);
		break;
	case 24:
		AttackBonearea(-482, Box.y2-35, 615, 45, 2, 0);
		break;
	case 96:
		Platform(-61, 346, 61, 2.5, 0);
		break;
	case 198:
		Platform(-61, 346, 61, 3, 0);
		break;
	case 258:
		AttackBone(133, 257, 45, 0, 3.5, 0);
		AttackBone(119, 257, 45, 0, 3.5, 0);
		AttackBone(105, 257, 45, 0, 3.5, 0);
		break;
	case 396:
		AttackBone(133, 257, 90, 0, 4.5, 0);
		break;
	case 498:
		instance_destroy();
		break;
}



timer++;