spaceKey = keyboard_check_pressed(vk_space);

image_speed = 0.25;
depth = -bbox_bottom;

if(distance_to_object(obj_player) <= 15){
	//Make sure the textbox only spawns once
	if(spaceKey && !if_interacted){
		if_interacted = true;
		create_textbox(text_id);
		obj_player.stop_movement = true;
		//audio_play_sound(set_voice,0,0);
	}
	
	//Reset the 'if_interacted' var if the textbox is no longer there
	if(!instance_exists(obj_textbox)){
		if_interacted = false;
		obj_player.stop_movement = false;
	}
}


