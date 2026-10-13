
if(y > 0 or y < room_height)
{
//Gerando a explosão ao se destruir
	var _exp = instance_create_layer(x, y, "Particulas", obj_explosao_tiro);
	_exp.image_angle = random(359);

}	
