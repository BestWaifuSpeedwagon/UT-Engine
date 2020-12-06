/// @description Insérez la description ici
//UI
state = 0;
substate = [ NULL, NULL ]; //Substate, subsubstate, subsubsubstate, etc...

inBattle = false;
waitingForDialogue = false; //True when your waiting for the dialogue to finish

box = 
{
	x: 32.5,
	y: 248,
	w: 0,
	h: 0,
	wantedW: 575,
	wantedH: 140,
	x2: 32.5, //Convenience
	y2: 248,
	cx: 32.5,
	cy: 248
}

//Battle Variables
monster = ct_argument.monster; //Array of obj_monster instances
monsterAmount = array_length(monster);

karma = ct_argument.karma;
kr = obj_stat.hp;

currentAttack = undefined;
time = 0;

instance_create_layer(0, 0, "Instances", obj_heartmove);

function getDialogue()
{
	var _mon = monster[ irandom(monsterAmount-1) ];
	
	return _mon.text[ irandom(array_length(_mon.text)-1) ];
}

function startCombat() //Start the combat event, _type either FIGHT, ACT, ITEM or SPARE
{
	substate[0] = NULL;
	substate[1] = NULL;
	
	for(i = 0; i < monsterAmount; i++)
		monster[i].count++;
	
	inBattle = true;
	dialogue.messages = [ getDialogue() ];
	
	time = 0;
	currentAttack = monster[ irandom(monsterAmount-1) ].attackOrder();
	
	obj_heartmove.visible = true;
	obj_heartmove.x = box.cx;
	obj_heartmove.y = box.cy;
}

dialogue = new Dialogue( [ getDialogue() ], false );
dialogue.passable = false;

dialogue.x = box.x + 16;
dialogue.y = box.y + 24;

dialogue.font = fnt_menu;