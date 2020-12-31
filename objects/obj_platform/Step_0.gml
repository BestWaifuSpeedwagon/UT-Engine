/// @description Move, and take the heart with you
x += velX;

if(obj_heartmove.x+8 > x && obj_heartmove.x-8 < x+size) //In range
{
	if(obj_heartmove.y+7 <= y && obj_heartmove.y+9+obj_heartmove.velY >= y) //Intersection
	{
		obj_heartmove.y = y-8;
		obj_heartmove.velY = 0;
		obj_heartmove.x += velX;
		
		obj_heartmove.onGround = true;
	}
}