// Set sprite
sprite_index=asset_get_index(global.hulls[?"Rifty"][?"sprite"]);
// Set stats
name="Rifty (Frigate)";
tank=global.hulls[?"Rifty"][?"tank"];
hp=tank;
velocity=global.hulls[?"Rifty"][?"velocity"];
inertia=global.hulls[?"Rifty"][?"inertia"];
capacitor=global.hulls[?"Rifty"][?"capacitor"];
energy=capacitor;
// Set movement variables
moving=false;
turning=false
burning=false;
accelerating=false;
deccelerating=false;
lastspeed=0;