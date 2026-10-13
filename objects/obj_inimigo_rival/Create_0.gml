//Ao ser criado o rival gera um escudo
	instance_create_layer(x, y, "Escudo_inimigo", obj_escudo_rival);
//Velocidade do rival
	vel = 1;
//Vida rival
	vida = 100;
//Taxa de tiro do rival
	intervalo_tiro = 30;
//Timer do tiro
	timer_tiro = 60
	



#region Métodos
atirando = function()
{
	if(timer_tiro <= 0)
	{
		timer_tiro = intervalo_tiro;
		instance_create_layer(x, y, "Tiro", obj_tiro_rival);
		tocando_sfx(sfx_laser2,.8, 1 )
	}

}

morte = function()
{
	if(vida = 1)
	{
		tocando_sfx();
		//Ativando o screenshake
		screenshake(50);
		destruir(obj_explosao_player)
	}
	else
	{
		vida--;
		image_xscale = -1.2;
		image_yscale = -.8;
	}
}

movimento = function()
{
	if(instance_exists(obj_player))
	{
		var _posi_y = 512 - obj_player.y
		var _posi_x = obj_player.x
	
		x = lerp(x, _posi_x, .1)
		y = lerp(y, _posi_y, 0.1);
	}	
}	
#endregion