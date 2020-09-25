draw_self();

// debugging
draw_set_font(fShipNameFont);
draw_set_color(c_white);
draw_text(0,0,"[F1] Switch to frigate\n[F2] Switch to cruiser\n[F3] Switch to battleship\n[F4] Spawn pirate NPC\n\n[F5] Restart game\n\n[Q] Attack\n[W] Webifier\n[E] Repair ship\n[R] Afterburner\n\n[Space] Ship brake");

var anchorx=x-16;
if name="Rifty (Frigate)" var anchory=y+16;
else if name="Vexy (Cruiser)" var anchory=y+32;
else if name="Foon (Battleship)" var anchory=y+64;

draw_set_font(fShipNameFont);
draw_set_color(c_white);
var namestringwidth=string_width(name);
var namestringheight=string_height(name);
draw_text(x-namestringwidth/2,anchory+namestringheight+16,string(name));

draw_set_font(fTemporaryFont);

// hp
var x1=anchorx,x2=anchorx+32,y1=anchory,y2=y1+1;
var amount=hp/tank*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,c_lime,c_lime,0,true,false);
draw_text(x2+3,y1-4,string(hp)+" hp");

// capacitor
var x1=anchorx,x2=anchorx+32,y1=anchory+4,y2=y1+1;
var amount=energy/capacitor*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,c_yellow,c_yellow,0,true,false);
draw_text(x2+3,y1-1,string(energy)+" joules");

// velocity
if burning var color=c_aqua;
else var color=c_orange;
var x1=anchorx,x2=anchorx+32,y1=anchory+8,y2=y1+1;
var amount=speed/velocity*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,color,color,0,true,false);
draw_text(x2+3,y1+2,string(speed)+" km/s");