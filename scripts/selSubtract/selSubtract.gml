/// @function	selSubtract();
function selSubtract() {
	var sx=ds_grid_value_x(sel,0,0,COLS,ROWS,CURRENT);
	var sy=ds_grid_value_y(sel,0,0,COLS,ROWS,CURRENT);
	var slot=inv[#sx,sy];
	if slot!=EMPTY{
		if !slot[?"stackable"] inv[#sx,sy]=EMPTY;
		else{
			slot[?"amount"]--;
			if slot[?"amount"]<1 inv[#sx,sy]=EMPTY;
		}
		exit;
	}
}