//Destruindo o tiro ao sair da tela
if(y >= 544 or y < -32) 	
{	
	instance_destroy()
}

//if(instance_exists(obj_inimigo_rival))
//{
//	if(obj_inimigo_rival.y <= 256)
//	{
//		image_xscale =	lerp(image_xscale, -1,.1);
//		image_yscale =	lerp(image_yscale, -1,.1);

//	//Aumentando a velocidade do tiro
//	//speed = lerp(vspeed, 3, .2);
//	}
//	else
//	{
//		image_xscale =	lerp(image_xscale, 1,.1);
//		image_yscale =	lerp(image_yscale, 1,.1);

//	//Aumentando a velocidade do tiro
//	//speed = lerp(vspeed, -3, .2);
//	}
//}
