instance_destroy();
for (var i=0;i<100;i++){
	var explosion=instance_create_depth(x,y,0,oExplosion);
	explosion.decay=.85;
}
other.hp-=5;