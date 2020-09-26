if hp<=0 instance_destroy();

if point_in_circle(oPlayerShip.x,oPlayerShip.y,x,y,250) seeking=true;
else seeking=false;

if point_in_circle(oPlayerShip.x,oPlayerShip.y,x,y,50) {flyby=true; accelerating=true; alarm[3]=60;}

if instance_exists(oWebAura){
	var closest=instance_nearest(x,y,oWebAura);
	if point_in_circle(x,y,closest.x,closest.y,16){
		webbed=true;
	}
	else{
		webbed=false;
	}
}
else{
	webbed=false;
}

if webbed{
	speed=0;
	exit;
}
if !flyby{
	if seeking{
		var mousedir=point_direction(x,y,oPlayerShip.x,oPlayerShip.y);
		dd=angle_difference(image_angle,mousedir);
		if abs(dd)>0.1{
			var adjustment=min(abs(dd),5)*sign(dd)*inertia;
			image_angle-=adjustment;
			direction=image_angle;
			turning=true;
		}
		else{
			turning=false
		}
		if turning{
			if abs(dd)>90{
				accelerating=false;
				deccelerating=true;
			}
			else{
				accelerating=true;
				deccelerating=false;
			}
		}
		else{
			accelerating=true;
			deccelerating=false;
		}
	}
	else{
		accelerating=false;
		deccelerating=true;
	}
}

// Move the ship
if accelerating{
	speed+=velocity*inertia*0.01;
}
else if deccelerating{
	speed-=velocity*inertia*0.01;
}
if speed>velocity speed=velocity;
if speed<0 speed=0;

// Ship Trail Effect
if speed>0{
	for (var i=0;i<speed;i+=0.2){
		var xoffset=random_range(-2,1);
		var yoffset=random_range(-2,2);
		if !burning decay=speed/velocity-0.1;
		//else decay=speed/(velocity/2)-0.1;
		var trail=instance_create_depth(x+xoffset,y+yoffset,1,oShipTrail);
		trail.duration=decay;
	}
}

if !flyby&&!turning&&shoot&&point_in_circle(oPlayerShip.x,oPlayerShip.y,x,y,150){
	shoot=false;
	alarm[2]=20;
	var bullet=instance_create_depth(x,y,0,oPirateBlaster);
	var variance=random_range(-5,5);
	bullet.direction=direction+variance;
	bullet.speed=3;
	bullet.alarm[0]=60;
}