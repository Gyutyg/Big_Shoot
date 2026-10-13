	draw_self();
	
//Alterando a forma como o computador trata as cores
	gpu_set_blendmode(bm_add);
//Efeito de brilho ao tiro	
	draw_sprite_ext(spr_power_up_1, image_index, x, y, image_xscale *1.3, image_yscale *1.3, image_angle, c_purple, .5);
//Voltando o blendmode ao normal
	gpu_set_blendmode(bm_normal);
	