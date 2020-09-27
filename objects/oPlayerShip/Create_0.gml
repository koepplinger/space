#region Initialize player hull
// Set sprite
sprite_index=asset_get_index(global.save[?"player"][?"hull"][?"sprite"]);

// Set stats
tank=global.save[?"player"][?"hull"][?"tank"];
velocity=global.save[?"player"][?"hull"][?"velocity"];
inertia=global.save[?"player"][?"hull"][?"inertia"];
capacitor=global.save[?"player"][?"hull"][?"capacitor"];
hp=tank;
energy=capacitor;

// Set movement variables
burning=false;
braking=false;
throttle=false;
#endregion