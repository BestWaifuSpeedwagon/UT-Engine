/// @description Draw heart
if(timer < 60) draw_sprite_ext(spr_heart_battle, 0, _hx, _hy, 1, 1, 0, c_red, 1);
else if(timer < 119) draw_sprite(spr_heartbreak, 0, _hx, _hy); //Origin is changed accordingly

if(fade > 0)
{
	image_alpha = fade;
	draw_self();
}