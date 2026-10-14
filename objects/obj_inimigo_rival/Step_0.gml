//Metodo de tiro
	atirando();
//Reduzindo o timer
	timer_tiro--;
	
//Movimentação
	movimento();
	
if(y <= 256)
{
	image_yscale = -1;
	image_xscale = -1;
}
else
	image_yscale = 1
	
if(instance_exists(obj_escudo_rival))
	intervalo_tiro = 50;
else
{
	if(vida >= 50)
	{
		intervalo_tiro = 30;

	}
	else
	{
		intervalo_tiro = 50;
	}
}
