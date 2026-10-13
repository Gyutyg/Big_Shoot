//Aumentando um pouco a escala
if(y <= 256)
{
	image_xscale = -1.2;
	image_yscale = -1.2;
}
else
{
	image_xscale = 1.2;
	image_yscale = 1.2;
}

//Seguir o inimigo ao ser criado
if(instance_exists(obj_inimigo_rival))
{
	x = obj_inimigo_rival.x;
	y = obj_inimigo_rival.y;
}

if(vida_esc <= 1)
{
	destruir(obj_explosao_player);
	screenshake(20);
	tocando_sfx(sfx_explosao2, 1, 1);
}

