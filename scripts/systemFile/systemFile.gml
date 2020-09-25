/// @function systemFile(command);
/// @param {string} command The desired command
function systemFile(command){
	ini_open(SAVEFILE);
	var section="items";
	var key="inv";
	if command=="save"{
		var grid=ds_grid_write(inv);
		ini_write_string(section,key,grid);
	}
	if command=="load"&&ini_section_exists(section){
		var inistring=ini_read_string(section,key,"");
		ds_grid_read(inv,inistring);
	}
	ini_close();
}