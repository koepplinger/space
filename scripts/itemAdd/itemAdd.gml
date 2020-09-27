/// @function	itemAdd(name);
/// @param		{string}	name	The name of the item to add
/// @param		{real}		amount	The amount of items to add (optional)
function itemAdd(name,amount){
	// Add one to an existing item's amount
	if items[?name][?"stackable"]{
		for (var h=0;h<ROWS;h++;){
			for (var w=0;w<COLS;w++;){
				var slot=inv[#w,h];
				if slot{
					var existing=slot[?"name"];
					if name==existing{
						slot[?"amount"]+=amount;
						exit;
					}
				}
			}
		}
	}
	// Add item to first empty slot
	for (var a=0;a<amount;a++){
		var space=ds_grid_value_exists(inv,0,0,COLS,ROWS,EMPTY);
		if !space exit;
		var copy=ds_map_create();
		ds_map_copy(copy,items[?name]);
		var breakout=false;
		for (var h=0;h<ROWS;h++;){
			for (var w=0;w<COLS;w++;){
				var slot=inv[#w,h];
				if slot==EMPTY{
					if copy[?"stackable"] copy[?"amount"]++;
					inv[#w,h]=copy;
					breakout=true;
				}
				if breakout break;
			}
			if breakout break;
		}
	}
}