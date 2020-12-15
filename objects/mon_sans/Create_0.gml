/// @description Properties
event_inherited(); //Inherit all variables of parent

maxHp = 1;
hp = 1;
name = "Sans";
def = 1000;

dodge = true;

text = [ "* You feel like your going to\n  have a bad time." ];

acts = [
	new Act("Check", [
		"* SANS - 1 ATK 1 DEF{12}\n* The easiest ennemy.",
		"* Can't keep dodging forever.{12}\n* Keep attacking."
	], NULL),
]; 

attacks = [ atkp_sans4, atkp_sans2, atkp_sans3, atkp_sans4 ];
attackOrder = function(roundType) //Determine order based on current count
{
	return attacks[fightCount];
}

y = 200;
width = 60;
height = 180;

var _bx = x + width/2 + 10,
	_by = y - height/2;

speechs = [
	new Speech( ["what ?{20}\nyou think i'm just gonna stand there and take it ?"], fnt_sans, snd_txtsans, spr_blconwdshrt, true, _bx, _by ),
	new Speech( [
		"our reports showed a massive anomaly in the timespace continuum.",
		"timelines jumping left and right,{20} stopping and starting..."
	], fnt_sans, snd_txtsans, spr_blconwdshrt, true, _bx, _by ),
	new Speech( ["until suddenly,{20} everything ends."], fnt_sans, snd_txtsans, spr_blconwdshrt, true, _bx, _by ),
	new Speech( ["heh heh heh...{30} that's your fault, isn't it?"], fnt_sans, snd_txtsans, spr_blconwdshrt, true, _bx, _by ),
	
];
speechOrder = function(roundType)
{
	if(roundType == FIGHT) return speechs[fightCount];
	
	return NULL;
}

bodyChannelX = animcurve_get_channel(ac_sans_body, 0);
bodyChannelY = animcurve_get_channel(ac_sans_body, 1);

bodySprite = NULL;
bodyImage = 0;

bodyState = 0;
bodyX = 0;
bodyY = 0;

headSprite = spr_sansb_face;
headImage = 0;

function changeSprite(part, sprite, image)
{
	variable_instance_set(id, part + "Sprite", sprite);
	variable_instance_set(id, part + "Image", image);
}

headY = 0;

image_speed = 0.1;

xpAmount = 100;
gAmountFight = 0;
gAmountSpare = 0;