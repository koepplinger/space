#region Draw inventory
if inventoryactive{
	// Draw inventory
	for (var h=0;h<ROWS;++h;){
		for (var w=0;w<COLS;++w;){
			var item=ds_grid_get(inv,w,h)
			if item{
				// Amount
				var stackable=item[?"stackable"]
				var ax=ICON*w;
				var ay=ICON*h;
				if stackable{
					var amount=item[?"amount"]
					draw_set_color(c_white);
					draw_text(ax+2,ay+2,string(amount));
				}
				// Icon
				var sprite=asset_get_index(item[?"sprite"]);
				draw_sprite(sprite,-1,ANCHORX+ax,ANCHORY+ay);
			}
			if ds_grid_value_exists(sel,0,0,COLS,ROWS,1){
				var selection=sel[#w,h];
				if selection&&item{
					// Selection
					var x1=ANCHORX+ICON*w;
					var y1=ANCHORY+ICON*h;
					var x2=x1+ICON;
					var y2=y1+ICON;
					draw_set_colour(c_red);
					draw_rectangle(x1,y1,x2,y2,true);
					var selname=inv[#w,h];
					var selstring=selname[?"name"];
					// Inspection
					draw_set_colour(c_white);
					draw_text(0,0,selstring);
				}
			}
		}
	}
	// Draw equipment
	for (var h=0;h<EQROWS;++h;){
		for (var w=0;w<EQCOLS;++w;){
			var item=ds_grid_get(eq,w,h)
			if item{
				// Amount
				var stackable=item[?"stackable"]
				var ax=ICON*w;
				var ay=ICON*h;
				if stackable{
					var amount=item[?"amount"]
					draw_set_color(c_white);
					draw_text(ax+2,ay+2,string(amount));
				}
				// Icon
				var sprite=asset_get_index(item[?"sprite"]);
				draw_sprite(sprite,-1,EQANCHORX+ax,EQANCHORY+ay);
			}
			if ds_grid_value_exists(eqsel,0,0,EQCOLS,EQROWS,1){
				var selection=eqsel[#w,h];
				if selection&&item{
					// Selection
					var x1=EQANCHORX+ICON*w;
					var y1=EQANCHORY+ICON*h;
					var x2=x1+ICON;
					var y2=y1+ICON;
					draw_set_colour(c_red);
					draw_rectangle(x1,y1,x2,y2,true);
					var selname=eq[#w,h];
					var selstring=selname[?"name"];
					// Inspection
					draw_set_colour(c_white);
					draw_text(0,0,selstring);
				}
			}
		}
	}
	// Swap effect
	if swapping.now{
		var sprite=asset_get_index(swapping.map[?"sprite"]);
		var sx=device_mouse_x_to_gui(0)-ICON/2;
		var sy=device_mouse_y_to_gui(0)-ICON/2;
		draw_sprite(sprite,0,sx,sy);
		var stackable=swapping.map[?"stackable"]
		if stackable{
			var amount=swapping.map[?"amount"]
			draw_set_color(c_white);
			draw_text(sx,sy,string(amount));
		}
	}
}
#endregion

#region Draw station
if room==rStation{
	draw_set_color(c_white);
	draw_set_font(fStationFont);
	var currentstation=global.save[?"player"][?"station"];
	var xpos=display_get_gui_width()/2-string_width(currentstation)/2;
	draw_text(xpos,200,currentstation); 
}
#endregion

#region Flash map name
if mapnameflash&&room!=rStation{
	draw_set_font(fStationFont);
	draw_set_color(c_white);
	var mapname=mapnames[?string(room_get_name(room))];
	var offset=string_width(mapname)/2;
	draw_text(display_get_gui_width()/2-offset,200,mapname);
	if !alarm[1] alarm[1]=180;
}
#endregion