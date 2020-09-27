#region Update hull stats
// Cap hp and death check
if hp>tank hp=tank;
if hp<0 game_restart();

// Cap & regenerate energy
if energy<capacitor energy+=capacitor/600;
else if energy>capacitor energy=capacitor;
#endregion

#region Move ship
// Afterburner input
if !burning&&energy>=5&&keyboard_check_pressed(ord("R")){
	burning=true;
	energy-=5;
	velocity*=2;
	alarm[0]=600;
}
// Brake input
if keyboard_check(vk_space) braking=true;
else braking=false;
// Throttle input
if mouse_check_button(mb_right) throttle=true;
else throttle=false;
// Turn ship towards cursor
if throttle{
	var mousedir=point_direction(x,y,mouse_x,mouse_y);
	dd=angle_difference(image_angle,mousedir);
	if abs(dd)>0.1{
		turning=true;
		var adjustment=min(abs(dd),5)*sign(dd)*inertia;
		image_angle-=adjustment;
		direction=image_angle;
	}
	else turning=false
	// Cut throttle in wide turn
	if turning&&abs(dd)>90 throttle=false;
}
// Apply movement formulas
if braking speed-=velocity*inertia*0.02;
else if throttle speed+=velocity*inertia*0.01;
else speed-=velocity*inertia*0.01;
// Cap speed
if speed>velocity speed=velocity;
else if speed<=0 speed=0;
// Bounce ship
move_bounce_solid(true);
#endregion

#region Display ship trail
if throttle{
	var maxskew=sprite_width/8;
	for (var i=0;i<maxskew;i+=0.1){
		var xoffset=floor(abs(random(1)-random(1))*(1+maxskew))*(round(random(1))*2-1);
		var yoffset=floor(abs(random(1)-random(1))*(1+maxskew))*(round(random(1))*2-1);
		var trail=instance_create_depth(x+xoffset,y+yoffset,1,oShipTrail);
		trail.duration=(speed/velocity-0.1)*random_range(.95,1.05);
	}
}
#endregion

#region Activate modules
if keyboard_check_pressed(ord("Q")){ // to be edited with module logic
	switch global.save[?"player"][?"hull"][?"name"]{
		case "Rifty":
			if energy>1{
				for (var i=0;i<10;i++){
					var bullet=instance_create_depth(x,y,0,oBlaster);
					var variance=random_range(-10,10);
					bullet.direction=direction+variance;
					bullet.speed=random_range(3,5);
					bullet.alarm[0]=random_range(50,70);
				}
				energy--;
			}
			break;
		case "Vexy":
			if energy>5{ // to be edited with module logic
				var bullet=instance_create_depth(x,y,0,oRocketsStage1);
				var variance=random_range(-2,2);
				bullet.direction=direction+variance;
				bullet.image_angle=direction+variance;
				bullet.speed=3;
				bullet.alarm[0]=120;
				energy-=5;
			}
			break;
		case "Foon":
			if energy>50{
				for (var i=0;i<360;i++){
					instance_create_depth(x,y,1,oBurst);
				}
				energy-=50;	
			}
			break;
	}
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
#endregion

#region Debug controls
// Change ships
var ship=noone;
if keyboard_check_pressed(vk_f1) ship="Rifty";
if keyboard_check_pressed(vk_f2) ship="Vexy";
if keyboard_check_pressed(vk_f3) ship="Foon";
if ship!=noone{
	global.save[?"player"][?"hull"]=global.hulls[?ship];
	var xpos=oPlayerShip.x;
	var ypos=oPlayerShip.y;
	var dir=oPlayerShip.direction;
	instance_destroy(oPlayerShip);
	var playerobject=instance_create_depth(xpos,ypos,0,oPlayerShip);
	playerobject.direction=dir;
	playerobject.image_angle=dir;
}
#endregion