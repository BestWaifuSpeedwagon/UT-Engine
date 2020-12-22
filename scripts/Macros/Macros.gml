// -- NAMES --
//Angle meaning a clockwise angle in degrees
//Theta meaning a clockwise angle in radians
//Dir being 0, 1, 2, 3, and multiplied by 90 to give an angle

//Enums
#macro u_u global.g_u_u

u_u =
{
	insideOutside_inside: shader_get_uniform(shd_insideOutside, "inside"),
	insideOutside_box: shader_get_uniform(shd_insideOutside, "box"),
	dust_y: shader_get_uniform(shd_insideOutside, "y"),
	dust_height: shader_get_uniform(shd_insideOutside, "height"),
	dust_fraction: shader_get_uniform(shd_insideOutside, "fraction")
};

//States
#macro NULL -1
#macro FIGHT 0
#macro ACT 1
#macro ITEM 2
#macro SPARE 3

#macro RED c_red
#macro BLUE c_blue
#macro GREEN c_green
#macro AQUA $E8A200    //Game maker do BGR for some fucking reason
#macro ORANGE $00A2E8   //So in real hexcodes, those two would be inversed
#macro WHITE c_white

//Battle
#macro heart obj_heartmove

#macro Box obj_soul.box
#region Hinting Box
/// @hint Box Combat box
/// @hint Box.x Current X position
/// @hint Box.y Current Y position
/// @hint Box.w Current width
/// @hint Box.h Current height
/// @hint Box.fw Wanted width
/// @hint Box.fh Wanted height
/// @hint Box.spdSize Speed at which the size interpolates
/// @hint Box.spdPos Speed at which the position interpolates with freePos on
/// @hint Box.freePos
/// @hint Box.fx Wanted X
/// @hint Box.fy Wanted Y
/// @hint Box.o extends Point, Origin
/// @hint Box.cx Current center X
/// @hint Box.cy Current center Y
/// @hint Box.x2 X of bottom-right corner
/// @hint Box.y2 Y of bottom-right corner
/// @hint Box.fx1 Wanted X of top-left corner
/// @hint Box.fy1 Wanted Y of top-left corner
/// @hint Box.fx2 Wanted X of bottom-right corner
/// @hint Box.fy2 Wanted Y of bottom-right corner
/// @hint Box.fcx Wanted center X
/// @hint Box.fcy Wanted center Y
/// @hint Box.resize(w, h, ?amount)->void
/// @hint Box.move(x, y, ?amount)->void
/// @hint Box.setOrigin(x, y)->void
/// @hint Box.calculate()->void
#endregion

//Voices


//Surfaces
//Gui is automately drawn on this surface
#macro guiSurf global.g_guiSurf

//Always draw monsters on this surface
#macro monsterSurf global.g_monsterSurf

//Other
#macro ct_argument global.g_ct_argument //For arguments in create events

#macro ptSystem global.g_ptSystem
#macro ptDust global.g_ptDust

#macro FILENAME "data.ini"