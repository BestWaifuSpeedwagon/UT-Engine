/// @description Create necessary values
dialogues = ds_list_create();

global.createDialogue = function(dialogue)
{
	ds_list_add(dialogues, dialogue);
}