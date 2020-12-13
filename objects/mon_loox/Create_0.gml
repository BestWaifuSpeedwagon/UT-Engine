/// @description Properties
event_inherited(); //Inherit all variables of parent

y = 200;

maxHp = 20;
hp = 20;
name = "Loox";
def = -5;

text = [ "* Loox looks at you intently.", "* Loox expects you to do something." ];

acts = [
	new Act("Check", ["* LOOX - 5 ATK 5 DEF\n* Looks everywhere."], NULL),
	new Act("Talk", ["* You ask Loox how he has been doing{6}.{6}.{6}.{6}.",
					 "* He seems to feel better !"],
			function(){ spare = true })
]; 

attacks = [ atkp_randomblaster ];
attackOrder = function(attacked) //Determine order based on current count
{
	return attacks[0];
}

speechs = [ new Speech( ["Hurt me !"], fnt_dialogue, snd_voice, spr_blconwd, true, x + width/2 + 10, y - height/2 ) ];
speechOrder = function(attacked)
{
	return speechs[0];
}


image_speed = 0.1;

xpAmount = 6;
gAmountFight = 20;
gAmountSpare = 15;