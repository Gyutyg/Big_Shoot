//Iniciando a transição 2
//Se não for a primeira vez que o jogador vê a tela
if(global.intro)
	inicia_transicao(sq_transicao2);
	
//Tocando Música do menu
audio_stop_all();
audio_play_sound(snd_menu, 0, 1);