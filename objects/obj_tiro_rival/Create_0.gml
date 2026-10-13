//Iniciando com uma cor aleatória
	cor = c_red
	

//Dando a velocidade inicial dp tiro
if(instance_exists(obj_inimigo_rival))
{
	if(obj_inimigo_rival.y <= 256)
	{
		//Iniciando com uma escala maior
		image_xscale = -1;
		image_yscale = -1;
		vspeed = 3;
	
	}	
	else 
	{
		//Iniciando com uma escala maior
		image_xscale = 1;
		image_yscale = 1;
		vspeed = -3;
	}	
}

