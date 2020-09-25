/// @function selSwap(split,peel);
/// @param {boolean} split
/// @param {boolean} peel
function selSwap(split,peel){
	var slotselected=ds_grid_value_exists(sel,0,0,COLS,ROWS,CURRENT);
	// Pick up item
	if !swapping.now{
		if !slotselected exit;
		var selx=ds_grid_value_x(sel,0,0,COLS,ROWS,CURRENT);
		var sely=ds_grid_value_y(sel,0,0,COLS,ROWS,CURRENT);
		var item=inv[#selx,sely];
		if !item exit;
		inv[#selx,sely]=EMPTY;
		swapping={now:true,x:selx,y:sely,map:item};
	}
	// Release item
	else if swapping.now{
		var x1=swapping.x;
		var y1=swapping.y;
		var item1=swapping.map;
		if !slotselected inv[#x1,y1]=item1;
		else{
			var x2=ds_grid_value_x(sel,0,0,COLS,ROWS,CURRENT);
			var y2=ds_grid_value_y(sel,0,0,COLS,ROWS,CURRENT);
			var item2=inv[#x2,y2];
			// Move item
			if item2==EMPTY{
				var moveall=false;
				if item1[?"stackable"]{
					if x1!=x2||y1!=y2{
						var amount=item1[?"amount"];
						var name=item1[?"name"];
						var copy1=ds_map_create();
						var copy2=ds_map_create();
						ds_map_copy(copy1,items[?name]);
						ds_map_copy(copy2,items[?name]);
						if split{
							var adjusted=floor(amount/2);
							if adjusted{
								copy1[?"amount"]=amount-adjusted;
								copy2[?"amount"]=adjusted;
								inv[#x1,y1]=copy1;
								inv[#x2,y2]=copy2;
							}
							else moveall=true;
						}
						else if peel{
							var adjusted=amount-1;
							if adjusted{
								copy1[?"amount"]=adjusted;
								inv[#x1,y1]=copy1;
								inv[#x2,y2]=copy2;
							}
							else moveall=true;
						}
						else moveall=true;
					}
					else moveall=true;
				}
				else moveall=true;
				if moveall inv[#x2,y2]=item1;
			}
			// Stack-to-stack transfer
			else if item1[?"stackable"]&&item2[?"name"]==item1[?"name"]{
				var amount=item1[?"amount"];
				if split{
					var adjusted=max(1,floor(amount/2));
					inv[#x1,y1]=item1;
					inv[#x1,y1][?"amount"]=amount-adjusted;
					if inv[#x1,y1][?"amount"]<1 inv[#x1,y1]=EMPTY;
					item2[?"amount"]+=adjusted;
				}
				else if peel{
					var adjusted=amount-1;
					inv[#x1,y1]=item1;
					inv[#x1,y1][?"amount"]--;
					if inv[#x1,y1][?"amount"]<1 inv[#x1,y1]=EMPTY;
					item2[?"amount"]++;
				}
				else{
					item2[?"amount"]+=item1[?"amount"];
					inv[#x1,y1]=EMPTY;
				}
			}
			// Simple swap
			else{
				inv[#x2,y2]=item1;
				inv[#x1,y1]=item2;
			}
		}
		delete swapping;
		swapping={now:false};
		exit;
	}
}