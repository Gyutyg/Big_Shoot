//Comando para tremer a tela
if(tremer > .1)
{
	var _x = random_range(-tremer, tremer);
	var _y = random_range(-tremer, tremer);
	
	view_set_xport(view_current, _x);
	view_set_yport(view_current, _y);
}
else
{
	tremer = 0;
}	

//Reduzindo o valor da variável tremer
	tremer	= lerp(tremer, 0, 0.1);
	show_debug_message(tremer)