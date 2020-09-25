/// @function	selDestroy();
function selDestroy(){
	var sx=ds_grid_value_x(sel,0,0,COLS,ROWS,CURRENT);
	var sy=ds_grid_value_y(sel,0,0,COLS,ROWS,CURRENT);
	inv[#sx,sy]=EMPTY;
}