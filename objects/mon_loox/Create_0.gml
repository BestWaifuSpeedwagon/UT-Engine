/// @description Properties
event_inherited(); //Inherit all variables of parent

maxHp = 100;
hp = 100;
name = "Loox";

text = [ "* Loox looks at you intently.", "* Loox expects you to do something." ];

acts = [
	new Act("Check", ["* LOOX - 5 ATK 5 DEF\n* Looks everywhere."]),
	new Act("Talk", ["* You talk about your like to Loox\n  about your life."]),
	new Act("Therapy", ["* Loox talks to you about his life."])
]; 
attacks = [
	function(t)
	{
		obj_soul.box.wantedW = 100;
		obj_soul.box.wantedH = 100;
		
		switch(t)
		{
			case 90:
			case 60:
			case 30:
				repeat(2)
					instance_create_layer(choose(obj_soul.box.x, obj_soul.box.x2), choose(obj_soul.box.y, obj_soul.box.y2), "Attacks", atk_circle);
				break;
			case 120:
				return true;
				break;
		}
		return false;
	}
]
attackOrder = function() //Determine order based on current count
{
	return attacks[0];
}