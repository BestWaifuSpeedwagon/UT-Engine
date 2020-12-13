/// @description Set up variables
x = obj_soul.box.cx;
y = obj_soul.box.cy;

barX = 32.5;
moving = true;

monster = ct_argument.monster;
mon = obj_soul.monster[monster];

timer = -1;

t = 0;

function createSlice(damage)
{
	ct_argument = { damage: damage, monster: monster };
	instance_create_layer(mon.x, mon.y - mon.height, "Instances", obj_slice);
	
	ct_argument = undefined;
}