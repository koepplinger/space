// hp
if !seeking exit;
var anchorx=x-16;
var anchory=y+16;
var x1=anchorx,x2=anchorx+32,y1=anchory,y2=y1+1;
var amount=hp/3*100;
draw_healthbar(x1,y1,x2,y2,amount,c_black,c_lime,c_lime,0,true,false);
draw_text(x2+3,y1-4,string(hp)+" hp");