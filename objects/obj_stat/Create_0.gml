/// @description Insérez la description ici
#region Camera stuff

shake = 0;

flick = -1;
pauseAll = false;

width = 320;
height = 240;

view_enabled = true;
view_visible = true;
view_camera = camera_create_view(0, 0, width, height);

application_surface_draw_enable(false);

window_set_size(width*2, height*2);
window_set_position(display_get_width()/2 - width, display_get_height()/2 - height);

display_set_gui_size(width*2, height*2);


#endregion
#region Surfaces
guiSurf = surface_create(width*2, height*2); //Deals with fullscreen shit
#endregion
#region Values


name = "shit";
lv = 1;
xp = 0;
g = 0;
hp = 92;
maxHp = 92;
atk = 1;
def = 0;
items = ds_list_create(); //DS list of items
ds_list_add(items, new Item( "Yum!", 10, "Delicious bun!", snd_heal_c ));


#region Get XP details
var file = file_text_open_read("LV.txt");
file_text_readln(file); //Ignore first line

lvDetails = [];

for(i = 0; i < 20; i++)
{
	array_push(lvDetails, 
		[
			real(file_text_read_real(file)),
			real(file_text_read_real(file)),
			real(file_text_read_real(file)),
			real(file_text_read_real(file)),
			real(file_text_read_real(file))
		]
	);
}

file_text_close(file);
#endregion
#endregion
#region Game maker's particle system
ptSystem = part_system_create(); //Global particul system
ptDust = part_type_create(); //Dust particle effect

part_type_color1(ptDust, c_white);
part_type_shape(ptDust, pt_shape_pixel);
part_type_speed(ptDust, 1, 2, 0, 0);
part_type_direction(ptDust, 45, 135, 0, 0);
part_type_scale(ptDust, 2, 2);
part_type_alpha3(ptDust, 1, 0.7, 0);
part_type_life(ptDust, 30, 60);
#endregion