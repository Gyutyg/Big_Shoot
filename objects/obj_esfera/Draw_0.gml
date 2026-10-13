
desenhando_shader(desenho_efeito_mola);
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_esfera_boss, image_index, x, y, image_xscale *1.3, image_yscale *1.3, image_angle, c_aqua, .5);
gpu_set_blendmode(bm_normal);
