#region Inventory controls
if inventoryactive{
	// Developer controls
	/*if keyboard_check_pressed(ord("Q")) itemAdd("Katana",1);
	if keyboard_check_pressed(ord("W")) itemAdd("Armor",1);
	if keyboard_check_pressed(ord("E")) itemAdd("Water",6);
	if keyboard_check_pressed(DESTROYKATANA) itemSubtract("Water",3);*/

	// Main loop
	selUpdate();
	/*if keyboard_check_pressed(QUIT) game_restart();
	if keyboard_check_pressed(SAVE) systemFile("save");
	if keyboard_check_pressed(LOAD) systemFile("load");
	if keyboard_check_pressed(DESTROY) selDestroy();
	if keyboard_check_pressed(SUBTRACT) selSubtract();*/
	if mouse_check_button(SWAP)^^swapping.now{
		selSwap(keyboard_check(SPLIT),keyboard_check(PEEL));
	}
}
#endregion
#region Camera zoom controls
// Change zoom
if mouse_wheel_up()&&ZoomFactor<ZoomMaxFactor{
	ZoomFactor*=ZoomIncrease;
	ZoomRefresh=true;
	show_debug_message(string(get_timer())+"μs [cogCamera]: Zoomed in.");
}
else if mouse_wheel_down()&&ZoomFactor>ZoomMinFactor{
	ZoomFactor*=ZoomDecrease;
	ZoomRefresh=true;
	show_debug_message(string(get_timer())+"μs [cogCamera]: Zoomed out.");
}
// Update zoom
if ZoomRefresh{
	ZoomRefresh=false;
	ZoomedViewWidth=ViewWidth/ZoomFactor;
	ZoomedViewHeight=ViewHeight/ZoomFactor;
	window_scale=ZoomFactor;
	window_set_size(ZoomedViewWidth*window_scale,ZoomedViewHeight*window_scale);
	alarm[0]=CenterDelay;
	surface_resize(application_surface,ZoomedViewWidth*window_scale,ZoomedViewHeight*window_scale);
	show_debug_message(string(get_timer())+"μs [cogCamera]: Updated zoom.");
}
#endregion
#region Station controls
if mouse_x>896&&mouse_y<64&&mouse_check_button_pressed(mb_left){
	room_goto(asset_get_index(global.save[?"player"][?"location"]));
}
#endregion