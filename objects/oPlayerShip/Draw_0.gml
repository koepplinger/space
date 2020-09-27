draw_self();
draw_set_color(c_white);

#region Draw ship title
var name=global.save[?"player"][?"hull"][?"name"];
// Ship name
draw_set_font(fShipNameFont);
var anchorx=x-16;
anchory=y-sprite_height-string_height(name);
draw_text(x-string_width(name)/2,anchory,name);
#endregion

#region Draw infobars
anchory=y+sprite_height;
draw_set_font(fTemporaryFont);
// hp bar
var x1=anchorx,x2=anchorx+32,y1=anchory,y2=y1+1;
var amount=hp/tank*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,c_lime,c_lime,0,true,false);
draw_text(x2+3,y1-4,string(hp)+" hp");
// capacitor bar
var x1=anchorx,x2=anchorx+32,y1=anchory+4,y2=y1+1;
var amount=energy/capacitor*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,c_yellow,c_yellow,0,true,false);
draw_text(x2+3,y1-1,string(energy)+" joules");
// velocity bar
if burning var color=c_aqua;
else var color=c_orange;
var x1=anchorx,x2=anchorx+32,y1=anchory+8,y2=y1+1;
var amount=speed/velocity*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,color,color,0,true,false);
draw_text(x2+3,y1+2,string(speed)+" km/s");
#endregion