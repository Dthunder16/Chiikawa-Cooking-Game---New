depth = -bbox_bottom;

if(distance_to_object(obj_player) <= 50){
	//Item will float towards player
	x = lerp(x, obj_player.x, 0.2);
	y = lerp(y, obj_player.y, 0.2);
}
//test test test test tiles test 