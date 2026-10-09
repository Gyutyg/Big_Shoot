//Destruindo o tiro ao sair da tela
if(y <= -32) 	
{	
	instance_destroy()
}

	image_xscale =	lerp(image_xscale, 1,.1);
	image_yscale =	lerp(image_yscale, 1,.1);

//Aumentando a velocidade do tiro
	vspeed = lerp(vspeed, -5, .2);
