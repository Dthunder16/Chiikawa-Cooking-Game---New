depth = -bbox_bottom;
spaceKey = keyboard_check_pressed(vk_space);

if(distance_to_object(obj_player) <= 15){
	//Make sure the textbox only spawns once
	if(spaceKey && !if_interacted){
		if_interacted = true;
		create_textbox(text_id);
		obj_player.stop_movement = true;
	}
	
	//Reset the 'if_interacted' var if the textbox is no longer there
	if(!instance_exists(obj_textbox)){
		if_interacted = false;
		obj_player.stop_movement = false;
	}
}

