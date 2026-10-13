if(vida >1)
{
	vida--;
	tocando_sfx(sfx_zap, 0.8 , 1.2)
	efeito_mola(1.3,1.3);
	efeito_shader_frames(2)
}
else
{
	tocando_sfx(sfx_explosao2, 1, 1);
	destruir(obj_exp_tiro_boss);
}

instance_destroy(other);