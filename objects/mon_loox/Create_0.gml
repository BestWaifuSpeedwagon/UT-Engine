/// @description Properties
event_inherited(); //Inherit all variables of parent

maxHp = 100;
hp = 100;
name = "Loox";
def = -50;

text = [ "* Loox looks at you intently.", "* Loox expects you to do something." ];

acts = [
	new Act("Check", ["* LOOX - 5 ATK 5 DEF\n* Looks everywhere."], NULL),
	new Act("Talk", ["* You ask Loox how he has been doing{6}.{6}.{6}.{6}.",
					 "* He seems to feel better !"],
			function(){ spare = true })
]; 
attacks = [ atkp_loox1 ]
attackOrder = function() //Determine order based on current count
{
	return attacks[0];
}

y = 120;

expAmount = 6;
gAmountFight = 20;
gAmountSpare = 15;