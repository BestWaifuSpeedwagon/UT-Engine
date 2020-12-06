/// @description Insérez la description ici
var _size = ds_list_size(dialogues)

for(i = 0; i < _size; i++)
{
	if(dialogues[| i].update())
	{
		ds_list_delete(dialogues, i);
		i--;
		_size--;
	}
}