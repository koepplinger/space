if room==rAsteroidBeltOne{
	global.save[?"player"][?"x"]=targetx;
	global.save[?"player"][?"y"]=targety;
	global.save[?"player"][?"dir"]=dir;
	room_goto(rAsteroidBeltTwo);
}
else{
	global.save[?"player"][?"x"]=targetx;
	global.save[?"player"][?"y"]=targety;
	global.save[?"player"][?"dir"]=dir;
	room_goto(rAsteroidBeltOne);
}