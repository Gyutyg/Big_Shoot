	draw_self();
	
//Alterando a forma como o computador trata as cores
	gpu_set_blendmode(bm_add);
//Efeito de brilho ao tiro	
	draw_sprite_ext(spr_tiro, image_index, x, y, image_xscale *1.6, image_yscale *1.6, image_angle, cor, 1);
//Voltando o blendmode ao normal
	gpu_set_blendmode(bm_normal);
	