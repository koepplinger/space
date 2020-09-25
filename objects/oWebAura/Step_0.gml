image_alpha*=decay;
if image_alpha<0.01{
	instance_destroy();
}