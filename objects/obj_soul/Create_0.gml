/// @description Insérez la description ici
//UI
state = 0;
substate = [ NULL, NULL ]; //Substate, subsubstate, subsubsubstate, etc...

inBattle = false;
waitingForDialogue = false; //True when your waiting for the dialogue to finish
waitingForDamage = false; //Waiting for the hit, then the slice then the damage

box = 
{
	x: 32.5,
	y: 248,
	w: 575,
	h: 140,
	wantedW: 575,
	wantedH: 140,
	x2: 32.5+575, //Convenience
	y2: 248+140, 
	cx: 32.5+575/2,
	cy: 248+140/2
}

//Battle Variables
monster = ct_argument.monster; //Array of obj_monster instances
monsterAmount = array_length(monster);

karma = ct_argument.karma;
kr = obj_stat.hp;

currentAttack = undefined;
time = 0;

instance_create_layer(0, 0, "Instances", obj_heartmove);

//Other
originalRoom = ct_argument.originalRoom;

gAmount = 0;
xpAmount = 0;

won = false;

// ----------

function getDialogue()
{
	var _mon = monster[ irandom(monsterAmount-1) ];
	
	return _mon.text[ irandom(array_length(_mon.text)-1) ];
}

dialogue = new Dialogue( [ getDialogue() ], false, snd_text );
dialogue.passable = false;

dialogue.x = box.x + 16;
dialogue.y = box.y + 24;

dialogue.font = fnt_menu;

#region Utilities

function startCombat() //Start the combat event
{
	substate[0] = NULL;
	substate[1] = NULL;
	
	if(monsterAmount <= 0) //Won
	{
		var _t =  "You won !{9}\nYou gained " + string(gAmount) + "G and " +  string(xpAmount) + " EXP !";
		
		obj_stat.xp += xpAmount;
		obj_stat.g += gAmount;
		
		dialogue.messages = [_t];
		dialogue.reset();
		won = true;
		return;
	}
	
	for(i = 0; i < monsterAmount; i++)
		monster[i].count++;
	
	inBattle = true;
	dialogue.messages = [ getDialogue() ];
	dialogue.reset();
	
	time = 0;
	currentAttack = monster[ irandom(monsterAmount-1) ].attackOrder();
	instance_create_depth(0, 0, 0, currentAttack);
	
	obj_heartmove.visible = true;
	obj_heartmove.x = box.cx;
	obj_heartmove.y = box.cy;
}

function allMonstersSparable()
{
	for(i = 0; i < monsterAmount; i++)
	{
		if(!monster[i].spare) return false;
	}
	
	return true;
}

#endregion