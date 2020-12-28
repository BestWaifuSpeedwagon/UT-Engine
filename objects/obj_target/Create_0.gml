/// @description Set up variables
x = Box.cx;
y = Box.cy;

barX = 32.5;
moving = true;

monster = ct_argument.monster;
mon = obj_soul.monster[monster];

t = 0;

function createMiss()
{
	ct_argument = { damage: -1, monster: monster };
	instance_create_layer(mon.x, mon.y - mon.height/2, "Instances", obj_dmgnum);
	
	ct_argument = undefined;
}

function createSlice(damage)
{
	ct_argument = { damage: damage, monster: monster };
	instance_create_layer(mon.x, mon.y - mon.height, "Instances", obj_slice);
	
	ct_argument = undefined;
}