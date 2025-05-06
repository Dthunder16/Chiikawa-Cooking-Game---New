spaceKey = keyboard_check_pressed(vk_space);

image_speed = 0.25;
depth = -bbox_bottom;

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
	
	//function to gain the recipe
    if(hasRecipe = true && ds_list_size(recipeHold)!=0){
        //hasRecipe ensures that only one recipe is gained each time approach to the npc
        hasRecipe = false;
        var _index = random_range(0,ds_list_size(recipeHold));
        recipe_add(ds_list_find_value(recipeHold,_index));
        //remove the given recipe
        ds_list_delete(recipeHold,_index);
    }
}else{
    hasRecipe = true;
}


