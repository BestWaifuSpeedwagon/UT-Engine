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
#macro ORANGE $0A2E8   //So in real hexcodes, those two would be inversed
#macro WHITE c_white

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

#macro globalTime global.g_globalTime