function startBattle(monster, karma)
{
	var _l = array_length(monster);
	var _monsterInstances = [];
	for(i = 0; i < _l; i++)
	{
		_monsterInstances[i] = instance_create_depth((i+1)/(_l+1) * 640, 0, 10, monster[i]);
	}
	
	//Allows setting arguments before create
	ct_argument =
	{
		karma: karma,
		monster: _monsterInstances
	};
	
	instance_create_depth(0, 0, 0, obj_soul);
	ct_argument = undefined;
	
	room = rm_battle;
}