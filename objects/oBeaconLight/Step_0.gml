var dist=point_distance(x,y,oPlayerShip.x,oPlayerShip.y);
image_alpha=25/dist;
if oPlayerShip.x>x instance_destroy();
if !point_in_circle(x,y,oPlayerShip.x,oPlayerShip.y,200) image_alpha=0;