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

tiro_grande_x = image_xscale *2;
tiro_grande_y = image_yscale *2;
if(instance_exists(obj_inimigo_rival))
{
	if(obj_inimigo_rival.vida < 50)
	{
		image_xscale = tiro_grande_x;
		image_yscale = tiro_grande_y;
		vspeed = vspeed *.7;
	}
}