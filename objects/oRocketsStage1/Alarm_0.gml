instance_destroy();
for (var i=0;i<20;i++){
	var bullet=instance_create_depth(x,y,0,oRocketsStage2);
	//bullet.rotation=random_range(-5,5);
	bullet.direction=random_range(0,360);
	bullet.image_angle=bullet.direction;
	bullet.speed=random_range(1,3);
	bullet.alarm[0]=random_range(20,40);
}
for (var i=0;i<250;i++){
	instance_create_depth(x,y,0,oExplosion);
}