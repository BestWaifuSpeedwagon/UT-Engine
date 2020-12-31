//!#import attack.sans.*

switch(timer)
{
	case 0:
		attack_sans_platform(15, 346, Box.y2-55, 2, 0);
		break;
	case 24:
		attack_sans_bonearea(-482, Box.y2-40, 615, 45, 2, 0);
		break;
	case 96:
		attack_sans_platform(-61, Box.y2-55, 61, 2.5, 0);
		break;
	case 198:
		attack_sans_platform(-61, Box.y2-55, 61, 3, 0);
		break;
	case 258:
		attack_sans_bone(133, 257, 45, 0, 3.5, 0);
		attack_sans_bone(119, 257, 45, 0, 3.5, 0);
		attack_sans_bone(105, 257, 45, 0, 3.5, 0);
		break;
	case 396:
		attack_sans_bone(133, 257, 90, 0, 4.5, 0);
		break;
	case 498:
		instance_destroy();
		break;
}



timer++;