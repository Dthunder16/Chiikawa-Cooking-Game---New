
depth = -bbox_bottom;





var distance_to_player = distance_to_object(obj_player)

if(distance_to_player < 10){
	//draw text that says press space to drop apples
	
}

if(keyboard_check(vk_space) && distance_to_player < 50)
{
	drop_apples();
	if(canSFX = true)
	{
		canSFX = false;
		audio_play_sound(snd_tree,0,0);
		alarm_set(1,20);
	}
}



