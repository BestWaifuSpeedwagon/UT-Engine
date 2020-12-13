/// @description PARENT OBJECT -- Placeholder Values
//Parametrable stuff
maxHp = 100;
hp = 100;
name = "";
def = 1;

count = -1; //Number of "rounds"
fightCount = 0; //Number of "rounds" where you attacked
actCount = 0;   //...
itemCount = 0;  //...
spareCount = 0; //...

text = []; //Array of text going in the box
acts = []; //Different acts possible, /** Act[] */

attacks = [] //Array of objects

/*function attackOrder(roundType) Return the wanted attack
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

speechs = [];
/*function speechOrder(roundType) Returns the chosen speech bubble, and NULL if noone is showing
{
	//Exemples
	if(roundType == ITEM)
	{
		...
	}
}*/

//Functionnal stuff
xpAmount = 0; //Amount of xp gained from killing
gAmountFight = 0; //Amount of gold gained when killing / sparing
gAmountSpare = 0;

spare = false; //Can he be spared ?
spared = false; //Is he spared ? Usually draw the monster faded

killed = false; //About straightforward

//Dust effect
fraction = 0; 
u_uY = shader_get_uniform(shd_dust, "y");
u_uHeight = shader_get_uniform(shd_dust, "height");
u_uFraction = shader_get_uniform(shd_dust, "fraction");

height = sprite_height; //Default at sprite height, modify for multi-sprite monsters
width = sprite_width; //Default at sprite width, modify fot multi-sprite monsters

hurt = false;
hurtTimer = 0;

y = 230; //Base y, from below