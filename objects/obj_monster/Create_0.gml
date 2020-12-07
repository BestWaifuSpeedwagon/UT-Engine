/// @description PARENT OBJECT -- Placeholder Values
//Parametrable stuff
maxHp = 100;
hp = 100;
name = "";
def = 1;

count = 0; //Number of "rounds"
fightCount = 0; //Number of "rounds" where you attacked
spareCount = 0; //Number of "rounds" where you spared

text = []; //Array of text going in the box
acts = []; //Different acts possible, /** Act[] */
attacks = [] /** (_t: time) => bool */
var attackOrder; /* Function, Determine order based on current count
{
	//Exemples
	return attacks[count];
	
	switch(count)
	{
		case 0:
			return attacks[choose(0, 1, 2)];
			break;
		...
	}
	
	return attacks[irandom(array_length(attacks))]
}*/

//Functionnal stuff
persistent = true;

spare = false; //Can he be spared ?