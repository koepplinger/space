

if reset&&point_in_circle(x,y,startx,starty,1){
	wander=true;
	reset=false;
	speed=0;
}
if !reset&&!point_in_circle(x,y,startx,starty,50){
	reset=true;
	wander=false;
}

if reset{
	image_index=1;
	move_towards_point(startx,starty,random_range(.1,1));
}
if wander&&speed==0{
	image_index=2;
	direction=random_range(0,360);
	speed=random_range(.1,1);
}