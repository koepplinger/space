#region Enable viewport
view_enabled=true;
view_visible[0]=true;
#endregion

#region Save game
if room!=rStation&&room!=rMenu global.save[?"player"][?"location"]=room_get_name(room);
var jstring=json_encode(global.save);
var file=file_text_open_write(SAVEFILE);
file_text_write_string(file,jstring);
file_text_close(file);

#endregion

#region Instantiate player object
if room!=rStation{
	var xpos=global.save[?"player"][?"x"];
	var ypos=global.save[?"player"][?"y"];
	var player=instance_create_depth(xpos,ypos,0,oPlayerShip);
	player.direction=global.save[?"player"][?"dir"];
	player.image_angle=global.save[?"player"][?"dir"];
	player.speed=player.velocity/2;
}
#endregion

#region Flash map name
mapnameflash=true;
#endregion

#region Toggle inventory (when in station)
if room==rStation inventoryactive=true;
else inventoryactive=false;
#endregion