

//Ativando a função controle do player
	controle_player();
	
//Ativando o debug
if(keyboard_check_pressed(vk_tab))	global.debug = !global.debug;


if(keyboard_check_pressed(vk_enter)) dano_player();
if(keyboard_check_pressed(vk_shift)) room_restart();

//Fazendo a sprite voltar ao normal após atirar
	retorno_efeito_mola(.4,.3);
	
//Revertendo o efeito de shader
	revertendo_shader();
	
	
