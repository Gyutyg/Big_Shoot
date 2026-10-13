#region Variáveis
	vida = 700;
	
	estado = "entrada";
	
	intervalo_tiro1 = 100;
	timer_tiro1 = 200;
	
	limite_esf = 0
	
	variavel_efeito_mola();
	variavel_efeito_shader();


#endregion


#region Métodos
morte = function()
{
	if(vida <= 1)
		instance_destroy();
	else
	{
		vida--;
		efeito_mola(1.1, 0.9);
		efeito_shader_frames(2)
	}	
}

maquina_de_estado = function()
{
	switch(estado)
	{
		case "entrada":
			if(y < 96)
			{
				vspeed = .5;
				screenshake(7);
				vida = 700;
			}
			else 
			{
				vspeed = 0;
				var _prox1 = choose("ataque1", "ataque2", "ataque3");
				estado = "ataque2";
				alarm[0] = 300;
			}
		break;
		
		
		case "ataque1":
			if(!instance_exists(obj_player))	exit;
			if(timer_tiro1 <= 0)
			{
				tocando_sfx(sfx_laser1, .7,.7)
				if(vida >= 500)
				{
					var _direct = point_direction(x, y, obj_player.x, obj_player.y);
				
					var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_boss);
					_tiro.direction = _direct
					_tiro.image_angle = _direct + 90;
				
					timer_tiro1 = intervalo_tiro1 - 20;
				}
				else
				{
					var _delay = 0
					var _direct = point_direction(x, y, obj_player.x, obj_player.y);
					repeat(3)
					{
						var _tiro = instance_create_layer(x, y - _delay, "Tiro", obj_tiro_boss);
						_tiro.direction = _direct
						_tiro.image_angle = _direct + 90;
						_delay -= 20;
					}
					timer_tiro1 = intervalo_tiro1 - 20;
				}
			}	
		break;
		
		case "ataque2":
			if(timer_tiro1 <= 0)
			{
				tocando_sfx(sfx_laser1, .4,.6)
				if(vida >= 500)
				{
					var _ang =  random_range(230,250);
				
					repeat(5)
					{
						var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_boss);
						_tiro.image_angle = _ang + 90;
						_tiro.direction =	 _ang;
						_ang += 15 ;			
					}
					timer_tiro1 = intervalo_tiro1 - 10;
				}
				else
				{
					var _ang =  random_range(210,220);
				
					repeat(8)
					{
						var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_boss);
						_tiro.image_angle = _ang + 90;
						_tiro.direction =	 _ang;
						_ang += 15 ;			
					}
					timer_tiro1 = intervalo_tiro1 - 20;
				}
			}	
		break;
		
		case "ataque3":
			if(limite_esf < 1)
			{
				if(vida >= 500)
				{
					tocando_sfx(sfx_laser1, 1.5, 1.5);
					limite_esf ++
					var esfera1 = instance_create_layer(x - 50, y, "Tiro", obj_esfera);
					var esfera2 = instance_create_layer(x + 50, y, "Tiro", obj_esfera);
				}	
				else
				{
					tocando_sfx(sfx_laser1, 1.5, 1.5);
					limite_esf ++
					var esfera1 = instance_create_layer(x - 50, y, "Tiro", obj_esfera);
					var esfera3 = instance_create_layer(x, y, "Tiro", obj_esfera);
					var esfera2 = instance_create_layer(x + 50, y, "Tiro", obj_esfera);
				}
			}
		break;

	}


}


#endregion