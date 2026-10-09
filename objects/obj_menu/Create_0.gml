//Array que vai definir o que será escrito

	menu = ["JOGAR", "TUTORIAL", "SAIR"];

//Variável que representa qual texto está selecionado
	atual = 0;
//Var da margem
	margem = 0;


#region Métodos

controle_menu = function()
{
	//Se eu preciono as setas do teclado (up e down) eu seleciono um texto diferente
	if(keyboard_check_pressed(vk_down))
	{
		//emitindo o som de seleção
		tocando_sfx(sfx_menu_select, 1, 1);
		atual++;
		//Sempre que apertar o botão a margem vai para 0
		margem = 0
		//Se o ultimo texto está selecionado e a seta é apertado, a seleção volta ao primeiro texto 
		if(atual > 2)
		{
			atual = 0;
		}
	}

	if(keyboard_check_pressed(vk_up))
	{
		//emitindo o som de seleção
		tocando_sfx(sfx_menu_select, 1, 1);
		
		atual--;
		//Sempre que apertar o botão a margem vai para 0
		margem = 0
		if(atual < 0)
		{
			atual = 2;
		}
	}
	
	//A margem sempre busca o valor máximo
	margem = lerp(margem, 40, 0.2);
	
	//Ativando a seleção do menu se apertar enter
	if(keyboard_check_pressed(vk_enter))
		select_menu();
}

select_menu = function()
{
	switch(atual)
	{
		case 0: 
			//chamando a transição
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			//escolhendo o destino do jogador
			global.destino = rm_jogo
			//Dizendo que está tendo transição
			global.intro = true
		
		break;
		
		case 1: 
			//chamando a transição
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			//escolhendo o destino do jogador
			global.destino = rm_tutorial
			//Dizendo que está tendo transição
			global.intro = true
		break;
		
		case 2:
			game_end();
		break
	}
}

desenha_menu = function()
{
	var _meio_tela = display_get_gui_height()/3; 


	//Alinhando o texto
	draw_set_valign(1);

	//Mudando a fonte
	draw_set_font(fnt_menu1);
	//Variável do tamanho da fonte
	var  _tam_fnt = string_height("T");

	//Funçao de repetiçao for
	for (var i = 0; i < 3; i++)
	{
		//Variável da cor do texto
		var _cor = c_white;
		//Variável da margem do texto selecionado
		var _margem = 0;
		//Se o valor atual for iguaçl ao valor do indice o texto mudará de cor
		if(i == atual)
		{
			_cor	= c_red;
			_margem = margem
		}	
		//Desenhando com a cor da variável
		draw_set_colour(_cor);
		draw_text(20 + _margem, _meio_tela + i * _tam_fnt * 2, menu[i]);
		draw_set_colour(-1);
	
	}
	draw_set_font(-1);
	draw_set_valign(-1);
}

#endregion