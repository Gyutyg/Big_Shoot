	vida_esc--;
	instance_destroy(other);
	if(y <= 256)
{
	image_xscale = -1.4;
	image_yscale = -1.4;
}
else
{
	image_xscale = 1.5;
	image_yscale = 1.5;
}	
	tocando_sfx(sfx_zap, .9, 1.1);