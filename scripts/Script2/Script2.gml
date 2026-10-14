#region Globais
{
	global.contador_morte = 0;
	
	global.debug = false;
	
	global.destino = rm_inicio;
		
	global.intro = false;	
	
	//Variáveis do player
	global.vida_p = 5;
	global.fire_p = 13;
	global.vel_p = 2;
	global.esc_p = 3;
	global.lv_p  = 1;
	
}
#endregion

#region	Funções

//Função de destruição
function destruir(_particula = obj_explosao_tiro)
{
	//Ao colidir com o player ele se destroi
	instance_destroy()
	
	//Gera a explosão
	instance_create_layer(x, y, layer, _particula);	
}

//Função de scrennshake
function screenshake(_tremida = 1)
{
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake)
		{
			if(_tremida > tremer)
			{
				//Altera o valor da variável treme
				tremer = _tremida;
			}
		}
	}	
}

//Função de variável do efeito de distorção
function variavel_efeito_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

function efeito_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

function retorno_efeito_mola(_txx = .1, _txy = .1)
{
	xscale = lerp(xscale, 1,_txx);
	yscale = lerp(yscale, 1,_txy);

}

function desenho_efeito_mola()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

function variavel_efeito_shader()
{
	perdeu_vida = true;
}
function efeito_shader_frames(_frames)
{
	perdeu_vida = _frames;
}
function revertendo_shader()
{
	perdeu_vida--;
}
function desenhando_shader(_function_draw = draw_self)
{
	if(perdeu_vida)
	{
		//Desenhando o objeto utilizando o shader
		shader_set(sh_branco);
		//Desenhando o player como uma spraite para deformá-lo sem alterar sua hitbox
		_function_draw();
		//Resetando o shader
		shader_reset();
	}
	else
	{
		_function_draw();
	}
}

function tocando_sfx(_sfx = sfx_explosao2, _pitch1 = .9, _pitch2 = 1.1)
{
	var _pitch = random_range(_pitch1, _pitch2);
	audio_play_sound(_sfx, 0, 0, , ,_pitch);
}

//Função do destino
function destino()
{
	room_goto(global.destino);	
}

//Função para a transição
function inicia_transicao(tipo_trans = sq_transicao1)
{
	layer_sequence_create("Transicao", room_width/2, room_height/2, tipo_trans);

}

function tendo_transicao()
{
		//Mudando o valor da intro
		global.intro = false;

}
function reset_player()
{
	global.vida_p = 5;
	global.fire_p = 13;
	global.vel_p = 2;
	global.esc_p = 3;
	global.lv_p  = 1
}

#endregion