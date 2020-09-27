/// @desc Selection input
#region Menu item selection
if keyboard_check_pressed(MENUUP)&&menuselection>0{
	menuselection--;blink=true;alarm[0]=blinktimer;
}
if keyboard_check_pressed(MENUDOWN)&&menuselection<maxitems{
	menuselection++;blink=true;alarm[0]=blinktimer;
}
if keyboard_check_pressed(MENUCHOOSE){
	switch menuselection{
		case 0:
			newgame=true;
			instance_create_depth(-5,-5,0,oGameController);
			room_goto(rAsteroidBeltOne);
			break;
		case 1:
			if file_exists(SAVEFILE){
				instance_create_depth(-5,-5,0,oGameController);
				// load savefile
				var file=file_text_open_read(SAVEFILE);
				var jstring=file_text_read_string(file);
				file_text_close(file);
				global.save=json_decode(jstring);
				room_goto(asset_get_index(global.save[?"player"][?"location"]));
			}
			break;
		case 2:
			// options menu
			break;
		case 3:
			game_end();
			break;
	}
}
#endregion