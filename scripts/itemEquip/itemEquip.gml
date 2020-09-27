// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function itemEquip(){
	// if selecting an inventory item
	if ds_grid_value_exists(sel,0,0,COLS,ROWS,CURRENT){
		// get selected item
		var sx=ds_grid_value_x(sel,0,0,COLS,ROWS,CURRENT);
		var sy=ds_grid_value_y(sel,0,0,COLS,ROWS,CURRENT);
		var item=inv[#sx,sy];
		// see if it's equippable
		if item[?"equippable"]{
			var slot=item[?"slot"];
			//  if slot is empty for that slot
			for (var i=0;i<4;i++){
				if slot=i{
					// if slot is empty, move the item to the slot
					if eq[#i,0]==EMPTY{
						inv[#sx,sy]=EMPTY;
						eq[#i,0]=item;
					}
					// if slot is full, swap the two items
					else{
						inv[#sx,sy]=eq[#i,0];
						eq[#i,0]=item;
					}
				}	
			}
		}
	}
	// check if inventory is full
	if ds_grid_value_exists(eqsel,0,0,EQCOLS,EQROWS,CURRENT){
		var space=ds_grid_value_exists(inv,0,0,COLS,ROWS,EMPTY);
		if space{
			var sx=ds_grid_value_x(eqsel,0,0,EQCOLS,EQROWS,CURRENT);
			var sy=ds_grid_value_y(eqsel,0,0,EQCOLS,EQROWS,CURRENT);
			var item=eq[#sx,sy];
			// move item to first inventory slot
			eq[#sx,sy]=EMPTY;
			for (var h=0;h<ROWS;h++;){
				for (var w=0;w<COLS;w++;){
					var slot=inv[#w,h];
					if slot==EMPTY{
						inv[#w,h]=item;
						exit;
					}
				}
			}
		}
	}
}