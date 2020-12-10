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
attacks = [] //Array of objects
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
expAmount = 0; //Amount of exp gained from killing
gAmountFight = 0; //Amount of gold gained when killing / sparing
gAmountSpare = 0;

spare = false; //Can he be spared ?
spared = false; //Is he spared ? Usually draw the monster faded

killed = false; //About straightforward
yy = 0; //Dust effect
u_uyy = shader_get_uniform(shd_dust, "yy");

hurt = false;
hurtTimer = 0;

y = 230; //Base y, from below