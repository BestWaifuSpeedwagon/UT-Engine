/// @description Insérez la description ici
getStats(0);

#region Camera stuff
width = 320;
height = 240;

view_enabled = true;
view_visible = true;
view_camera = camera_create_view(0, 0, width, height);

window_set_size(width*2, height*2);
window_set_position(display_get_width()/2 - width, display_get_height()/2 - height);

display_set_gui_size(width*2, height*2);

guiSurf = surface_create(width*2, height*2); //Deals with fullscreen shit

#endregion
#region Values

name = "shit"
lv = 1;
xp = 0;
g = 0;
hp = 20;
maxHp = 20;
atk = 1;
def = 0;
items = ds_list_create(); //DS list of items
ds_list_add(items, new Item( "Yum!", 10, "Delicious bun!", snd_heal_c ));

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