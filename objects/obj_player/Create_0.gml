

//Parando todos os sons antes
	audio_stop_all();	
	
//Intervalo para o início da música	
	alarm[0] = 60;


#region Variáveis
//Variável de velocidade
	vel = 2;
//Variável do timer do tiro
	tiro_timer		= 0;
//Variável do intervalo entre cada tiro
	tiro_intervalo	= 12;
//Variável do lével do tiro
	tiro_lv   = 1;
//Variável da vida
	vida = 3;
//Variável dos escudos
	escudo = 3;
//Variável para saber se tenho escudo
	meu_escudo = noone;
//Variável do tempo de invencibilidade ao tomar dano
	tempo_invencivel = game_get_speed(gamespeed_fps);
//Variável do timer de invencibilidade
	timer_invencivel = 0;
//Variáveis das dimensões do player
	variavel_efeito_mola();
//Variável que mostra quando o player tomou dano
	variavel_efeito_shader();

	

#endregion


#region Métodos

//Criando o sistema de movimentação do player
controle_player = function()
{
	//Funcionamento do escudo
	funcionamento_escudo();
	
	//diminuindo o valor do timer de invencibilidade
	timer_invencivel--;
	
	//Pegando os valores de WASD;
	var _cima, _baixo, _esquerda, _direita, _atirar;
	_cima		= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo		= keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esquerda	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_direita	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar		= keyboard_check(vk_space) or mouse_check_button(mb_left);

	
//MOvimentando com as operaçoes
	var _velh	= (_direita - _esquerda) *	vel;
	x		+= _velh;
	
	var _velv	= (_baixo - _cima) * vel;
	y		+= _velv;
	
//Diminuindo o intervalo do tiro
	tiro_timer--
	
//Impedindo o player de sair da room com o clamp	
	x = clamp(x, sprite_width/2 , room_width - sprite_width/2);	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
	
	//Quando apertar espaço ou mause left
	if(_atirar and tiro_timer <= 0)
	{
		if(instance_exists(id))
		{
			//Som de tiro
			tocando_sfx(sfx_laser2, .8, 1.2);
			//Efeito de distorção do player ao atirar
			efeito_mola(.8, 1.2);
		}
		//Ativando a função do tiro
		//A depender do level
		if(tiro_lv == 1)
		{
			tiro_1();
		}
		else if (tiro_lv ==2)
		{
			tiro_2();
		}
		else if (tiro_lv == 3)
		{
			tiro_3();
		}	
		
		//Quando o player atira ativa o intervalo
		tiro_timer = tiro_intervalo;
	}
}
//Criando o método do tiro
tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro);
	//Fazendo o tiro ir para cima
	//_tiro.vspeed = -5;

}

tiro_2 = function()
{
	//Gerando dois tiros
	var _tiro1 = instance_create_layer(x - 7, y, "Tiro", obj_tiro);
	var _tiro2 = instance_create_layer(x + 7, y, "Tiro", obj_tiro);
	//Dando velocidade aos tiro
	//_tiro1.vspeed = -5;
	//_tiro2.vspeed = -5;
	
}

tiro_3 = function()
{
	tiro_1();
	tiro_2();
}

//Método de level up do tiro
tiro_lv_up = function()
{
	tiro_lv++
	
	//Limitando o level do tiro
	tiro_lv = clamp(tiro_lv, 1, 3);
}

desenho_icone = function(_sprite, _item, _y)
{
	//Pegando a altura do display
	var _gui_height = display_get_gui_height()
	//Desenhando na base do display o -icone de vida
	//Utilizando o repeat para mostrar com base na quantidade de vidas
	//Variável da distância entre os desenhos
	var _distancia = 0
	repeat(_item)
	{
		//A cada repetição o x almenta em 20pxls
		 _distancia += 30
		draw_sprite_ext(_sprite, 0,  _distancia, _gui_height - _y, 1, 1, 0, c_white, 0.5);
	
	}	
}

dano_player = function()
{	
	//Se o timer for maior naõ executa a função abaixo
	if(timer_invencivel > 0 or meu_escudo) return;
	
	if(vida > 0)
	{
		vida--;
		//se o player tomar dano, fica ivunerável durante 1s
		timer_invencivel = tempo_invencivel;
		//Tremendo a tela
		screenshake(10);
		//Quando o player tomar dano, fica branco
		efeito_shader_frames(3);
		//Efeito mola ao tomar dano
		efeito_mola(1.5,.8);
		
	}	
	else 
	{
		//instance_destroy()
		//Tremendo a tela
		screenshake(50);
		//Explosão
		destruir(obj_explosao_player);
		//som da explosão
		tocando_sfx(sfx_explosao2, 2,2);
		//Iniciando transição que vai levar para tela inicial
		inicia_transicao();
		//Avisando que começou a transição
		global.intro = true;
	}	
}	

usa_escudo = function()
{
	//Limitando o escudo
	if(escudo > 0 and meu_escudo = noone)
	{
		escudo--;
		meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
		//Som do escudo;
		tocando_sfx(sfx_shieldUp,1,1);
		
	}
}

funcionamento_escudo = function()
{
	if(keyboard_check_pressed(ord("E"))) usa_escudo() 

	//Fazendo o escudo seguir o player quando está ativo
	//Se meu escudo está ativo
	if(instance_exists(meu_escudo))
	{
		//O x e y do escudo serão iguais ao x e y do player
		meu_escudo.x = x;
		meu_escudo.y = y;
	}
	else//Se meu escudo não está ativo
	{
		//Minha variável meu_escudo volta a ser noone
		meu_escudo = noone;
	}

}

#endregion

//Iniciando a transição no player
inicia_transicao(sq_transicao2);
//Mudando o destiro
global.destino = rm_inicio;


