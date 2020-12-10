/// @description Set up variables
x = obj_soul.box.cx;
y = obj_soul.box.cy;

barX = 32.5;
moving = true;

mon = ct_argument.monster;

timer = -1;

t = 0;

function createSlice(damage)
{
	ct_argument = { damage: damage, monster: mon };
	instance_create_layer(mon.x, mon.y, "Instances", obj_slice);
	
	mon.hp -= damage;
	
	if(mon.hp < 0) //ded
	{
		mon.killed = true;
	}
	
	ct_argument = undefined;
}