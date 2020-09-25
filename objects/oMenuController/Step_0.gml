/// @desc Control
#region Selection changing
if keyboard_check_pressed(vk_up)&&menuselection>0{
	menuselection--;
	blink=true;
	alarm[0]=blinktimer;
}
if keyboard_check_pressed(vk_down)&&menuselection<maxitems{
	menuselection++;
	blink=true;
	alarm[0]=blinktimer;
}
#endregion
#region Enact selected menu item
if keyboard_check_pressed(vk_enter){
	switch menuselection{
		case 0:
			newgame=true;
			var controller=instance_create_depth(-5,-5,0,oGameController);
			room_goto(rAsteroidBeltOne);
			break;
		case 1:
			if file_exists(SAVEFILE){
				var controller=instance_create_depth(-5,-5,0,oGameController);
				global.save=ds_map_secure_load(SAVEFILE);
				room_goto(asset_get_index(global.save[?"player"][?"location"]));
			}
			break;
		case 2:
		
			break;
		case 3:
			game_end();
			break;
	}
}
#endregion