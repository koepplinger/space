instance_destroy();
for (var i=0;i<250;i++){
	randomize();
	var xoffset=random_range(-64,64);
	var yoffset=random_range(-64,64);
	if abs(xoffset)+abs(yoffset)<80{
		instance_create_depth(x+xoffset,y+yoffset,-1,oWebAura);
	}
}