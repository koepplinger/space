/// @function	selUpdate();
function selUpdate(){
	for (var w=0;w<COLS;w++){
		for (var h=0;h<ROWS;h++){
			var mx=device_mouse_x_to_gui(0);
			var my=device_mouse_y_to_gui(0);
			var slotx=ANCHORX+ICON*(w+1);
			var sloty=ANCHORY+ICON*(h+1);
			if mx>ANCHORX&&mx<slotx&&my>ANCHORY&&my<sloty{
				ds_grid_clear(sel,EMPTY);
				sel[#w,h]=CURRENT;
				exit;
			}
			else ds_grid_clear(sel,EMPTY);
		}
	}
}