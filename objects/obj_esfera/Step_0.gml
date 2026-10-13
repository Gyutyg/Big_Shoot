//essa esfera se aproximará do player
	if(instance_exists(obj_player))
	{

			direction = point_direction(x, y, obj_player.x, obj_player.y)
	}
	
	retorno_efeito_mola();
	revertendo_shader()