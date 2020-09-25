if hp<1{
	instance_destroy();
	for (var i=0;i<10;i++){
		instance_create_depth(x,y,0,oAsteroidShard);
	}
}
if !rotationdir{
	image_angle+=rotationspeed;
}
else{
	image_angle-=rotationspeed;
}