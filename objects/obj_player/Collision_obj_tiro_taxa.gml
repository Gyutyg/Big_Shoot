//diminuindo o intervalo de tiro ao coletar o power up
	global.fire_p -= 1.5;
//Destruindo
	instance_destroy(other);
	var _expl = instance_create_layer(other.x, other.y, "Level", obj_explosao_tiro);
	_expl.image_angle = random(359);	
//Som de power up
//Som de power up
	tocando_sfx(sfx_power_up, .9, .9)