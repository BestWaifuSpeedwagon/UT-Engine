/// @description Insérez la description ici
damage = ct_argument.damage;

miss = damage <= 0;

//damage = string(damage);

if(damage >= 0)
{
	damage = string(damage);
	var _dmg = [];
	for(i = 0; i < string_length(damage); i++)
	{
		_dmg[i] = real(string_char_at(damage, i+1));
	}
	damage = _dmg;
}
else damage = [0];

velY = -5;