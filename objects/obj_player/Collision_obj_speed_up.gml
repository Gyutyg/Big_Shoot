//Aumenta a velocidade do player
	global.vel_p += .5;
	
//Destruindo
	instance_destroy(other);
	var _expl = instance_create_layer(other.x, other.y, "Level", obj_explosao_tiro);
	_expl.image_angle = random(359);
//Som de power up
	tocando_sfx(sfx_power_up, 1.1, 1.1)