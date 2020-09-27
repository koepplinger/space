//// @desc Menu text
// Draw menu title
draw_set_font(fStationFont);
draw_set_color(c_white);
var titlestring="SpaceARPG";
draw_text(anchorx-string_width(titlestring)/2,200,titlestring);
// Draw menu items
draw_set_font(fMenuItems);
for (var i=0;i<maxitems;i++){
	var _HalfOfString=string_width(menuitem[i])/2;
	draw_set_color(c_white);
	draw_text(anchorx-_HalfOfString,anchory+itemoffset*i,menuitem[i]);
	if i=menuselection&&blink{
		draw_set_color(c_black);
		draw_text(anchorx-_HalfOfString,anchory+itemoffset*i,menuitem[i]);
	}
}