/// @description Insérez la description ici
#region Camera stuff
width = 320;
height = 240;

view_enabled = true;
view_visible = true;
view_camera = camera_create_view(0, 0, width, height);

window_set_size(width*2, height*2);
window_set_position(display_get_width()/2 - width, display_get_height()/2 - height);

display_set_gui_size(width*2, height*2);
//display_set_gui_maximize(2, 2, 0, 0);
#endregion
#region Values

name = "shit"
lv = 1;
hp = 20;
maxHp = 20;
atk = 0;
def = 0;
items = ds_list_create(); //DS list of items
ds_list_add(items, new Item( "Yum!", 10, "Delicious bun!" ));

#endregion