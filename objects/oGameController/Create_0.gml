#region Initialize 'base item map' & inventory
// KEYBIND SETUP
/*#macro QUIT vk_escape
#macro SAVE vk_f1
#macro LOAD vk_f2
#macro DESTROY vk_delete
#macro SUBTRACT vk_subtract
#macro DESTROYKATANA vk_backspace*/
#macro SWAP mb_left
#macro SPLIT vk_shift
#macro PEEL vk_control

// INVENTORY SETUP
//#macro SAVEFILE "save.ini"
#macro ANCHORX display_get_gui_width()-256
#macro ANCHORY display_get_gui_height()-512
#macro ICON 64
#macro COLS 4
#macro ROWS 8
#macro EMPTY -1
#macro CURRENT 1

// BEGIN LOGIC
var file=file_text_open_read("items.json");
var line=""; 
while !file_text_eof(file){
	line+=file_text_read_string(file);
	file_text_readln(file);
}
file_text_close(file);
var map=json_decode(line);
var list=ds_map_find_value(map,"default");
items=ds_map_create();
for (var i=0;i<ds_list_size(list);i++){
	var prop=ds_list_find_value(list,i);
	var key=ds_map_find_value(prop,"name");
	ds_map_add(items,key,prop);
}

inv=ds_grid_create(COLS,ROWS);
ds_grid_clear(inv,EMPTY);

sel=ds_grid_create(COLS,ROWS);
ds_grid_clear(sel,EMPTY);
swapping={now:false};

inventoryactive=false;

itemAdd("Webber",1);

#endregion
#region Initialize 'base hull map'

// Hull JSON
var file=file_text_open_read("hulls.json");
var line=""; 
while !file_text_eof(file){
	line+=file_text_read_string(file);
	file_text_readln(file);
}
file_text_close(file);
var map=json_decode(line);
var list=ds_map_find_value(map,"default");
global.hulls=ds_map_create();
for (var i=0;i<ds_list_size(list);i++){
	var prop=ds_list_find_value(list,i);
	var key=ds_map_find_value(prop,"name");
	ds_map_add(global.hulls,key,prop);
}
/*							[NOTE ABOUT JSONS]
• JSON files can be created in Google Sheets with the Chrome extension "Export Sheet Data" 
• To do so, navigate "Add-ons" -> "Export Sheet Data" -> "Open Sidebar"
• Check "Export sheet arrays" and "Export contents as array", uncheck all else, and export
• The JSON file needs to be in the "Included Files" on the Resources tab of GMS
• JSON format looks like this: (https://i.imgur.com/Uam88U7.png) */

#endregion
#region Create blank savefile
// Data Structure for Savefile
#macro SAVEFILE "save.ini"
if oMenuController.newgame{
file_delete(SAVEFILE);
global.save=ds_map_create();
	ship=ds_map_create();
			modules=ds_map_create();
				//ds_map_add(modules,"weapon","blaster");
				//ds_map_add(modules,"thruster","afterburner");
			cargo=ds_map_create();
				//ds_map_add(cargo,0,"Fedo");
				//ds_map_add(cargo,1,"Tobacco");
				//ds_map_add(cargo,2,"Exotic Dancers");
		ds_map_add(ship,"modules",modules);
		ds_map_add(ship,"cargo",cargo);
	player=ds_map_create();
		ds_map_add(player,"name","clapback kenny");
		ds_map_add(player,"location","");
		ds_map_add(player,"x","256");
		ds_map_add(player,"y","256");
		ds_map_add(player,"dir","0");
		ds_map_add(player,"home","");
	stations=ds_map_create();
			station1=ds_map_create();
				//ds_map_add(station1,"services","repair shop");
				hangar=ds_map_create();
					//ds_map_add(hangar,0,ship);
				ds_map_add(station1,"hangar",hangar);
		ds_map_add(stations,"station1",station1);
	//quests=ds_map_create();

	// Add main maps to save map
	ds_map_add(global.save,"ship",ship);
	ds_map_add(global.save,"player",player);
	ds_map_add(global.save,"stations",stations);
	/*ds_map_add(global.save,"quests",quests);

	show_debug_message(string(global.save[?"ship"][?"cargo"][?1]));
	show_debug_message(string(global.save[?"player"][?"name"]));*/
}
#endregion
#region Configure camera
#macro view view_camera[0]
// Zoom
ZoomFactor=2;
ZoomMaxFactor=4;
ZoomMinFactor=0.25;
ZoomIncrease=2;
ZoomDecrease=0.5;
ZoomRefresh=false;
// Viewport
ViewWidth=1920;
ViewHeight=1080;
ZoomedViewWidth=ViewWidth/ZoomFactor;
ZoomedViewHeight=ViewHeight/ZoomFactor;
// Client window
window_scale=ZoomFactor;
window_set_size(ZoomedViewWidth*window_scale,ZoomedViewHeight*window_scale);
// Window centering
CenterDelay=1;
alarm[0]=CenterDelay;
CenterSpeed=.1;
// Application surface
surface_resize(application_surface,ZoomedViewWidth*window_scale,ZoomedViewHeight*window_scale);
// Cursor skin
//cursor_sprite=sMouseCursor;
//window_set_cursor(cr_none);
#endregion
#region Configure station variables

currentstation="";

#endregion
#region Configure map names
/* can make this a json */
mapnames=ds_map_create();
mapnames[?"rAsteroidBeltOne"]="Asteroid Belt I";
mapnames[?"rAsteroidBeltTwo"]="Asteroid Belt II";

#endregion

mapnameflash=false;