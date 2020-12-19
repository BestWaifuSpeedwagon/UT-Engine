/// @description Insérez la description ici
//UI
state = 0;
substate = [ NULL, NULL ]; //Substate, subsubstate, subsubsubstate, etc...

inBattle = false;

roundType = NULL; //Wether you attacked, acted, eated or spared this round

monsterSurf = surface_create(obj_stat.width*2, obj_stat.height*2);

waitingFor = 
{
	dialogue: false, //True when your waiting for the dialogue to finish
	damage: false,	 //Waiting for the hit, then the slice then the damage
	speech: false    //Waiting for the monster to stop talking
}

box = 
{
	x: 32.5,
	y: 248,
	w: 575,
	h: 140,
	fw: 575, //Wanted W
	fh: 140, //Wanted H
	
	//Free Pose
	freePos: false,
	fx: 32.5, //Wanted X
	fy: 248,  //Wanted Y
	o: new Point(.5, .5), //Origin from 0 to 1
	
	//Convenience
	cx: 320, 
	cy: 318,
	x2: 607.5,
	y2: 388, 
	fx2: 320,
	fy2: 318,
	fcx: 607.5,
	fcy: 388,
	
	
	resize: function(_w, _h, _amount)
	{
		fw = _w;
		fh = _h;
		
		w = lerp(w, fw, _amount);
		h = lerp(h, fh, _amount);
		
		calculate();
	},
	move: function(_x, _y, _amount)
	{
		freePos = true;
		fx = _x;
		fy = _y;
		
		x = lerp(x, fx - fw*o.x, _amount);
		y = lerp(y, fy - fh*o.y, _amount);
		
		calculate();
	},
	setOrigin: function(_x, _y)
	{
		o.set(_x, _y);
		
		move(x + w*_x, y + h*_y, 1);
	},
	calculate: function()
	{
		x2 = x + w;
		y2 = y + h;
	
		cx = x + w/2;
		cy = y + h/2;
		
		fx2 = fx - fw*(o.x-1);
		fy2 = fy - fh*(o.y-1);
		
		fcx = fx - fw*(o.x/2 - 1);
		fcy = fy - fh*(o.y/2 - 1);
	}
}

#region Battle Variables
monster = ct_argument.monster; //Array of obj_monster instances
monsterAmount = array_length(monster);

krCount = 0;
karma = ct_argument.karma;
kr = 0;

currentAttack = undefined;
time = 0;

instance_create_layer(0, 0, "heartmove", obj_heartmove);

//Other
originalRoom = ct_argument.originalRoom;

gAmount = 0;
xpAmount = 0;

won = false;

#endregion
#region Dialogue
function getDialogue()
{
	var _mon = monster[ irandom(monsterAmount-1) ];
	
	return _mon.text[ irandom(array_length(_mon.text)-1) ];
}

dialogue = new Dialogue( [ getDialogue() ], false, snd_text );
dialogue.passable = false;

dialogue.x = box.x + 16;
dialogue.y = box.y + 21;

currentSpeech = NULL;
#endregion
#region Utilities

function startSpeech() //Will then start combat
{
	if(monsterAmount <= 0) return startCombat(); //If there is no monster left, directly start combat
	
	var _mon = monster[ irandom(monsterAmount-1) ];
	
	currentSpeech = _mon.speechOrder(roundType);
	
	if(currentSpeech == NULL) return startCombat(); //If no speech was given, directly start combat
	
	if(currentSpeech.wait) waitingFor.speech = true;
	else startCombat();
}

function startCombat() //Start the combat event
{
	if(monsterAmount <= 0) //Won
	{
		var _t =  "You won !{9}\nYou gained " + string(gAmount) + "G and " +  string(xpAmount) + " EXP !";
		
		obj_stat.xp += xpAmount;
		obj_stat.g += gAmount;
		
		dialogue.messages = [_t];
		dialogue.reset();
		
		audio_stop_all();
		
		won = true;
		return;
	}
	
	inBattle = true;
	dialogue.messages = [ getDialogue() ];
	dialogue.reset();
	
	time = 0;
	currentAttack = monster[ irandom(monsterAmount-1) ].attackOrder(roundType);
	instance_create_depth(0, 0, 0, currentAttack);
	
	//After selection, apply the count
	forEach(monster, function(m){ m.count++; });
	
	switch(roundType)
	{
		case FIGHT:
			monster[substate[0]].fightCount++;
			break;
		case ACT:
			monster[substate[0]].actCount++;
			break;
		case ITEM:
			forEach(monster, function(m){ m.itemCount++; });
			break;
		case SPARE:
			forEach(monster, function(m){ m.spareCount++; });
			break;
	}
	
	substate[0] = NULL;
	substate[1] = NULL;
	
	roundType = NULL;
	
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