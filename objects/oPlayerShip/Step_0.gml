if x>1920 x=1;
if x<0 x=1919;
if y>1080 y=1;
if y<0 y=1079;

// seeking, moving, turning, burning, accelerating, deccelerating

lastspeed=speed;
if hp>tank hp=tank;
if hp<0 game_restart();

// Set 'moving' flag
if speed>0 moving=true;
else moving=false;

// Navigate player ship to mouse — 'seeking'
if mouse_check_button(mb_right) seeking=true;
else seeking=false;

if seeking{
	var mousedir=point_direction(x,y,mouse_x,mouse_y);
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
if speed>0&&(mouse_check_button(mb_right)||deccelerating){
	var maxskew=sprite_width/8;
	for (var i=0;i<maxskew;i+=0.1){
		//var xoffset=random_range(-3,3);
		var xoffset=floor(abs(random(1) - random(1)) * (1 + maxskew)) * (round(random(1)) * 2 - 1);
		//var yoffset=random_range(-3,3);
		var yoffset=floor(abs(random(1) - random(1)) * (1 + maxskew)) * (round(random(1)) * 2 - 1);

		var trail=instance_create_depth(x+xoffset,y+yoffset,1,oShipTrail);
		trail.duration=(speed/velocity-0.1)*random_range(.95,1.05);
	}
}

if energy<capacitor energy+=capacitor/600;

// Guns
if name="Rifty (Frigate)"&&energy>1&&keyboard_check_pressed(ord("Q")){
	for (var i=0;i<10;i++){
		var bullet=instance_create_depth(x,y,0,oBlaster);
		var variance=random_range(-10,10);
		bullet.direction=direction+variance;
		bullet.speed=random_range(3,5);
		bullet.alarm[0]=random_range(50,70);
	}
	energy--;
}
if name="Vexy (Cruiser)"&&energy>5&&keyboard_check_pressed(ord("Q")){
	var bullet=instance_create_depth(x,y,0,oRocketsStage1);
	var variance=random_range(-2,2);
	bullet.direction=direction+variance;
	bullet.image_angle=direction+variance;
	bullet.speed=3;
	bullet.alarm[0]=60;
	energy-=5;
}
if name="Foon (Battleship)"&&energy>50&&keyboard_check_pressed(ord("Q")){
	for (var i=0;i<360;i++){
		instance_create_depth(x,y,1,oBurst);
	}
	energy-=50;
}

// Webber
if energy>=10&&keyboard_check_pressed(ord("W")){
	var bullet=instance_create_depth(x,y,0,oWebifier);
	var variance=random_range(-5,5);
	bullet.direction=direction+variance;
	bullet.speed=5;
	bullet.alarm[0]=20;
	energy-=10;
}

// Repper
if energy>=5&&keyboard_check_pressed(ord("E")){
	for (var i=0;i<25;i++){
		instance_create_depth(x,y,-1,oSpark);
	}
	hp+=20;
	energy-=5;
}

// Afterburner
if energy>=5&&!alarm[0]&&keyboard_check_pressed(ord("R")){
	velocity*=2;
	alarm[0]=600;
	burning=true;
	energy-=5;
}

// Change ships
if keyboard_check_pressed(vk_f1){
	sprite_index=asset_get_index(global.hulls[?"Rifty"][?"sprite"]);
	// Set stats
	name="Rifty (Frigate)";
	tank=global.hulls[?"Rifty"][?"tank"];
	hp=tank;
	velocity=global.hulls[?"Rifty"][?"velocity"];
	inertia=global.hulls[?"Rifty"][?"inertia"];
	capacitor=global.hulls[?"Rifty"][?"capacitor"];
	energy=capacitor;
}
if keyboard_check_pressed(vk_f2){
	sprite_index=asset_get_index(global.hulls[?"Vexy"][?"sprite"]);
	// Set stats
	name="Vexy (Cruiser)";
	tank=global.hulls[?"Vexy"][?"tank"];
	hp=tank;
	velocity=global.hulls[?"Vexy"][?"velocity"];
	inertia=global.hulls[?"Vexy"][?"inertia"];
	capacitor=global.hulls[?"Vexy"][?"capacitor"];
	energy=capacitor;
}
if keyboard_check_pressed(vk_f3){
	sprite_index=asset_get_index(global.hulls[?"Foon"][?"sprite"]);
	// Set stats
	name="Foon (Battleship)";
	tank=global.hulls[?"Foon"][?"tank"];
	hp=tank;
	velocity=global.hulls[?"Foon"][?"velocity"];
	inertia=global.hulls[?"Foon"][?"inertia"];
	capacitor=global.hulls[?"Foon"][?"capacitor"];
	energy=capacitor;
}
if keyboard_check_pressed(vk_f4) instance_create_depth(680,360,0,oPirate);
if keyboard_check_pressed(vk_f5) game_restart();

// Ship brake
if keyboard_check(vk_space){
	speed*=.99;
}

move_bounce_solid(true);