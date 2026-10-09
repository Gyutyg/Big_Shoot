//Aumentando o level do tiro ao coletar o powerup
	tiro_lv_up();

//Destruindo o power up ao colidir com o player
	instance_destroy(other);
	var _expl = instance_create_layer(other.x, other.y, "Level", obj_explosao_tiro);
	_expl.image_angle = random(359);