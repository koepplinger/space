/// @function	selUpdate();
function selUpdate(){
ds_grid_clear(sel,EMPTY);
ds_grid_clear(eqsel,EMPTY);
	for (var w=0;w<COLS;w++){
		for (var h=0;h<ROWS;h++){
			var mx=device_mouse_x_to_gui(0);
			var my=device_mouse_y_to_gui(0);
			var slotx=ANCHORX+ICON*(w+1);
			var sloty=ANCHORY+ICON*(h+1);
			if mx>ANCHORX&&mx<slotx&&my>ANCHORY&&my<sloty{
				sel[#w,h]=CURRENT;
				exit;
			}
		}
	}
	for (var w=0;w<EQCOLS;w++){
		for (var h=0;h<EQROWS;h++){
			var mx=device_mouse_x_to_gui(0);
			var my=device_mouse_y_to_gui(0);
			var slotx=EQANCHORX+ICON*(w+1);
			var sloty=EQANCHORY+ICON*(h+1);
			if mx>EQANCHORX&&mx<slotx&&my>EQANCHORY&&my<sloty{
				eqsel[#w,h]=CURRENT;
				exit;
			}
		}
	}
}