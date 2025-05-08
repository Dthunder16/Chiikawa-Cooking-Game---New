depth = -bbox_bottom;

var distance_to_player = distance_to_object(obj_player)

if(distance_to_player < 50){
	//draw text that says press space
	
}
if(keyboard_check(vk_space) && distance_to_player < 50)
{
	room_goto(rm_cooking)
}


