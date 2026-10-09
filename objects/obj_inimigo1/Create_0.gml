//Variável da velocidade do tiro inimigo
	vel_tiro = 4;
	
//Variável para saber se o inmigo foi criado em uma sequenvia
	criado_em_sequencia = in_sequence;
	
//O inimico atira a cada 2s
	alarm[0] = game_get_speed(gamespeed_fps) * 2;
	
//Método de tiro do inimigo	
atira	= function()
{
	//Tocando o som de tiro
	tocando_sfx(sfx_laser1);
	
	//Gera o obj tiro
	var _tiro = instance_create_layer(x, y, "Tiro", obj_inimigo_tiro1);
	//Dando a velocidade do tiro
	_tiro.vspeed = vel_tiro	;

}	

//Método de morte
morte = function()
{
	//Iniciando o barulho de explosão
	tocando_sfx();
	//Ativando o screenshake
	screenshake(5);
	destruir(obj_inimigo_explosao);
	var _chance = random(100);
	//Se a chance for maior que 90
	if(_chance >= 90)
		//Dropa o power up
		instance_create_layer(x, y, "Level", obj_power_up_1);
	
}