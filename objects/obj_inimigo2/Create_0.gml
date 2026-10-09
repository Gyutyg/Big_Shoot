 //Vida do inimigo
	vida = 10;
	
//Variável que controla o meu estado
	estado = "chegando";
	
//Variáveis de tempo e timer do tiro
	tempo_tiro = 180;
	timer_tiro = tempo_tiro;

//Variável que conta quantos tiros foram edados
	quant_tiros = 0;
//Variável de controle´para verificar se o inimigo escolheu a direção que vai figir
	direct_fuga = false;

//Variável do shader
	variavel_efeito_shader();
//Variáveis do efeito mola
	variavel_efeito_mola()
	
//método de morte	
morte = function()
{
	if(vida <= 1)
	{
		destruir(obj_inimigo_explosao);
		//Ativando o screenshake ao matar o inimigo
		screenshake(10)
		//Iniciando o barulho de explosão
		tocando_sfx();
	}
	else
	{
		//Screenshake ao perder vida
		screenshake(5);
		//Ficando branco ao tomar dano
		efeito_shader_frames(3)
		vida--;
		//Ativando o efeito mola ao tomar dano
		efeito_mola(1.2,.8);
	}	
}

//Criando a máquina de estado
maquina_de_estado = function()
{
	
	//Verificando a variável estado
	switch(estado)
	{
		//Caso o estado esteja em chegando
		case "chegando":
		{
			if(y < 160)
			{
				vspeed = 2;
			}
			else
			{
				estado = "Carregando";
			}	
		}
		//Parando o case 1
		break;
	
		//Caso de carregando
		case "Carregando":
		{
			vspeed = 0
			//Reduzindo o timer do tiro
			timer_tiro--
			//Após o tempo determinado, muda de caso para o atirando ou o atirando 2
			if(timer_tiro <= 0)
			{
				estado = choose("atirando", "atirando2");
			}
			//else
			//{
			//	estado = "Carregando";
			//}
		}
		break;
		//Caso do estado atirando
		case "atirando":
		{
			
			
			//Adicionando a quantidade de tiro
			quant_tiros++;
			
			//Pegando a direção do player	se ele existir
			if(!instance_exists(obj_player)) exit;
			var _direct = point_direction(x, y, obj_player.x, obj_player.y);
			
			//Tocando o som de tiro
			tocando_sfx(sfx_laser1);
			
			//Criando o triro
			var _tiro = instance_create_layer(x, y, "Tiro", obj_inimigo2_tiro1);
			_tiro.speed = 2;
			//Fazendo o tiro ir na direção do player
			_tiro.direction = _direct;
			//Fazendo o tiro olhar para a direção que está indo
			_tiro.image_angle = _direct + 90;
			timer_tiro = tempo_tiro;
			//Se o timer for maior que o, volta ao estado de carregando se o limite de tiros ainda não foi atingido
			if(quant_tiros < 3)
			{
				estado = "Carregando";
			}
			else estado = "corre";
			
		}
		break;
		//Caso do estado atirando 2
		case "atirando2":
		{
			
			//Adicionando a quantidade de tiro
			quant_tiros++;
			
			//Var do angulo do tiro
			var _ang = 255;
			
			if(instance_exists(obj_player))
			{
				//Tocando o som de tiro
				tocando_sfx(sfx_laser1);
				
				//repetindo o código 3 vezer para dar um triple shot
				repeat(3)
				{
					//Criando o tiro 2
					var _tiro2 = instance_create_layer(x, y, "Tiro", obj_inimigo2_tiro2);
					_tiro2.speed = 2;
					_tiro2.direction = _ang;
					_ang += 15;
					
				}
				//Retornado ao estado de carregamento
				timer_tiro = tempo_tiro;
				//Voltando para o carregamenso se o limite ainda não foi atingido
				if(quant_tiros < 3)
				{
					estado = "Carregando";
				}
				else estado = "corre";
				
			}	
		}
		break;
		//Caso do estado que o inimigo corre
		case "corre":
		{
			if(direct_fuga == false)
			{
				hspeed = choose(1, -1);
				vspeed = -1;
				direct_fuga = true;
			}
			if(y < -64)
			{
				instance_destroy();
			}
		}
	}
}