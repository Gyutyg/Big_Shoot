
//	mostrando o level se o debug estiver ativo
if(global.debug)	draw_text( 20, 20, "Level do tiro: " + string(tiro_lv));
if(global.debug)	draw_text( 20, 40, "Velocidade: " + string(global.vel_p));
if(global.debug)	draw_text( 20, 60, "Fire Rate: " + string(global.fire_p));

if(global.intro) exit;
//Desenhando o ícone de vida
	desenho_icone(spr_gui_vida, global.vida_p, 20);
	desenho_icone(spr_gui_escudo, global.esc_p, 50);
	draw_sprite(spr_mortes, 0,  20, 20)
	
	draw_set_font(fnt_icone)
	draw_text(50, 20, global.contador_morte);
	draw_set_font(-1);