/// @description Properties
event_inherited(); //Inherit all variables of parent

maxHp = 1000;
hp = 1000;
name = "Gaster";
def = 1000;

dodge = false;

text = [ "* Your back is crawling on your\n  spine." ];

acts = [
	new Act("Check", [
		"* G4ST3R___999AT4 K-57 DEF{12}\n* The _^|¤-_|µ_- ennemy."
	], NULL),
]; 

attacks = [ atkp_gaster1, atkp_gaster2 ];//, atkp_gaster2, atkp_gaster3, atkp_gaster4, atkp_gaster5 ];
attackOrder = function(roundType) //Determine order based on current count
{
	return attacks[fightCount];
}

y = 200;
width = 140;
height = 180;

var _bx = x + width/2 + 10,
	_by = y - height/2;

speechs = [];
speechOrder = function(roundType)
{
	return NULL;
	if(roundType == FIGHT) return speechs[fightCount];
	
}

enum States
{
	gaster,
	sans
}

state = States.gaster;

sans = 
{
	bodyChannelX: animcurve_get_channel(ac_sans_body, "spr_sansb_torso_x"),
	bodyChannelY: animcurve_get_channel(ac_sans_body, "spr_sansb_torso_y"),
	
	bodySprite: spr_sansb_torso,
	bodyImage: 0,
	
	bodyState: 0,
	bodyX: 0,
	bodyY: 0,
	
	headSprite: spr_sansb_face,
	headImage: 0,
	
	changeSprite: function(part, sprite, image)
	{
		var struct = self; //Bug with self assignement
		
		struct[$ (part + "Sprite")] = sprite;
		struct[$ (part + "Image")] = image;
		
		bodyChannelX = animcurve_get_channel(ac_sans_body, sprite_get_name(sprite) + "_x");
		bodyChannelY = animcurve_get_channel(ac_sans_body, sprite_get_name(sprite) + "_y");
	},
	
	headY: 0
}

gaster = 
{
	bodyScale: 1
}

hand1 = instance_create_layer(x - width, y - height/3*2, "Monsters", obj_gaster_hand);
hand2 = instance_create_layer(x + width, y - height/3*2, "Monsters", obj_gaster_hand);

function resetHandPos()
{
	hand1.go(x - width, y - height/3*2, 60, 0);
	hand2.go(x + width, y - height/3*2, 60, 0);
}

hand1.image_xscale = -1;

image_speed = 0.1;

xpAmount = 100;
gAmountFight = 0;
gAmountSpare = 0;