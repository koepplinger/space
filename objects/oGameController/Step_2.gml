#region Camera chase
camera_set_view_size(view,ZoomedViewWidth,ZoomedViewHeight);
if instance_exists(oPlayerShip){
	var _x=clamp(oPlayerShip.x-ZoomedViewWidth/2,0,room_width-ZoomedViewWidth);
	var _y=clamp(oPlayerShip.y-ZoomedViewHeight/2,0,room_height-ZoomedViewHeight);
	var _cur_x=camera_get_view_x(view);
	var _cur_y=camera_get_view_y(view);
	var _spd=CenterSpeed;
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd));
	debug_event("[cogCamera]: Updated view.");
}
#endregion