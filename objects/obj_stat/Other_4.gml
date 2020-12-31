/// @description Insérez la description ici
view_enabled = true;
view_visible = true;

if(room == rm_battle || room == rm_gameover)
{
	camera_set_view_size(view_camera, width*2, height*2);
}
else
{
	camera_set_view_size(view_camera, width, height);
}
