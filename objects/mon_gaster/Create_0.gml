/// @description Properties
event_inherited(); //Inherit all variables of parent

maxHp = 1;
hp = 1;
name = "Gaster";
def = 1000;

dodge = true;

text = [ "* Something is Wrong...", "* Your back is crawling on your\n spine." ];

acts = [
	new Act("Check", [
		"* GASTER | 999 ATK -457 DEF{12}\n* The _-|-_|_- ennemy."
	], NULL),
]; 

attacks = [ atkp_gaster1 ];//, atkp_gaster2, atkp_gaster3, atkp_gaster4, atkp_gaster5 ];
attackOrder = function(roundType) //Determine order based on current count
{
	return attacks[count];
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


// sans = 
// {
// 	bodyChannelX: animcurve_get_channel(ac_sans_body, 0),
// 	bodyChannelY: animcurve_get_channel(ac_sans_body, 1),
	
// 	bodySprite: spr_sansb_torso,
// 	bodyImage: 0,
	
// 	bodyState: 0,
// 	bodyX: 0,
// 	bodyY: 0,
	
// 	headSprite: spr_sansb_face,
// 	headImage: 0,
	
// 	changeSprite: function(part, sprite, image)
// 	{
// 		variable_struct_set(self, part + "Sprite", sprite);
// 		variable_struct_set(self, part + "Image", image);
// 	},
	
// 	headY: 0
// }

bodyScale = 1;

hand =
[
	instance_create_layer(x - width, y - height/3*2, "Monsters", obj_gaster_hand),
	instance_create_layer(x + width, y - height/3*2, "Monsters", obj_gaster_hand)
];

hand[1].image_xscale = -1;

image_speed = 0.1;

xpAmount = 100;
gAmountFight = 0;
gAmountSpare = 0;