//Pick Up Items
function item_add(_item){
	array_push(obj_item_manager.inv, _item);
}

//
function pick_up_item(_item){
	//Destroy the Item You Collect + Add to Inventory
	if(place_meeting(x,y,obj_player)){
		//Add to Inventory Code
		item_add(_item);
		//show_debug_message(array_length(obj_item_manager.inv));
		//Destroy Instance
		instance_destroy();
	}
}

//Check if something is in the function
function in_inventory(_item){
	for(var i = 0; i < array_size(obj_item_manager.inv); i++){
		if(_item == obj_item_manager.inv[i])
			return true;
		else
			return false;
	}
}


function recipe_add(_recipe){
	ds_list_add(obj_item_manager.recipeList,_recipe);
}

//Function to Gain Recipe
function gain_recipe(hasRecipe, recipeHold){
	if(hasRecipe = false && ds_list_size(recipeHold)!=0){
		//hasRecipe ensures that only one recipe is gained each time approach to the npc
		hasRecipe = true;
		var _index = irandom(ds_list_size(recipeHold) - 1);
		recipe_add(ds_list_find_value(recipeHold,_index));
		//remove the given recipe
		ds_list_delete(recipeHold,_index);
	}
}