//O power up será criado e erá em direção ao player se mover for verdadeiro
if(move)
{
	x = lerp(x, obj_player.x, 0.1);
	y = lerp(y, obj_player.y, 0.1);
}