
//	mostrando o level se o debug estiver ativo
if(global.debug)	draw_text( 20, 20, "Level do tiro: " + string(tiro_lv));

if(global.intro) exit;
//Desenhando o ícone de vida
	desenho_icone(spr_gui_vida, vida, 20);
	desenho_icone(spr_gui_escudo, escudo, 50);