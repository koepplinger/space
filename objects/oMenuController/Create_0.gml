/// @desc Configuration
// Menu keybinds
#macro MENUUP vk_up
#macro MENUDOWN vk_down
#macro MENUCHOOSE vk_enter
// Initialize item choices
maxitems=4;
menuitem[0]="New";
menuitem[1]="Load";
menuitem[2]="Options";
menuitem[3]="Exit";
menuselection=0;
// Set up blink effect
blink=true;
blinktimer=30;
alarm[0]=blinktimer;
// GUI variables
anchorx=room_width/2;
anchory=room_height/2-100;
itemoffset=32;
// Set new game flag
newgame=false;