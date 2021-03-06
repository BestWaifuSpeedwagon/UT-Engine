
#region Movement&Camera
if(!hold)
{
    var hspd = (keyboard_check(vk_right)-keyboard_check(vk_left))*spd,
        vspd = (keyboard_check(vk_down)-keyboard_check(vk_up))*spd;
    
    if(!place_meeting(x+hspd, y, obj_solid)) x += hspd;
    if(!place_meeting(x, y+vspd, obj_solid)) y += vspd;
    
    if(vspd <= -spd) dir = 2;
    else if(vspd >= spd) dir = 0;
    else if(hspd >= spd) dir = 1;
    else if(hspd <= -spd) dir = 3;
    
    camera_set_view_pos(view_camera, clamp(x-320/2, 0, room_width-320), clamp(y-240/2, 0, room_height-240));
}
#endregion
#region Setting sprites

switch(dir)
{
    case 0:
        sprite_index = spr_f_maincharad;
        break;
    case 1:
        sprite_index = spr_f_maincharar;
        break;
    case 2:
        sprite_index = spr_f_maincharau;
        break;
    default: //In case things get broken, imagine it as 3
        sprite_index = spr_f_maincharal;
        break;
}

if(xprevious != x || yprevious != y) image_index += .1;
else image_index = 0;

#endregion