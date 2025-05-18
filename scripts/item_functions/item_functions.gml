//Add Item to Inventory (Logic)
function item_add(_item){
	array_push(obj_item_manager.inv, _item);
}

//Remove Item
function item_remove(_item){
	var _inv = obj_item_manager.inv;
	for(var i = 0; i < array_length(_inv); i++){
		if(_inv[i].name == _item.name){
			array_delete(_inv, i, 1);
			break;
		}
	}
}

//Remove Item from Recipe
function remove_ingredients(_rec){
	var _ing = _rec.ingredients;
	for(var i = 0; i < array_length(_ing); i++){
		item_remove(_ing[i]);
	}
}

//Pick Up Item in Game
function pick_up_item(_item){
	//Destroy the Item You Collect + Add to Inventory
	if(place_meeting(x,y,obj_player)){
		//Add to Inventory Code
		item_add(_item);
		audio_play_sound(snd_collect_item,0,0);
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

//Check if the player has all the ingredients for a recipe
function can_cook(_recipe){
	//What are the ingredients in the recipe
	var has_all_ingredients = true;
	
	for(var i = 0; i < array_length(_recipe.ingredients); i++){
		var required_ingredient = _recipe.ingredients[i];
		var found = false;
		
		//Nested for loop to check the player's inventory
		var _inv = obj_item_manager.inv;
		for(var j = 0; j < array_length(_inv); j++){
			var inventory_item = _inv[j];
			
			if(inventory_item == required_ingredient){
				found = true;
				break;
			}
		}
		
		//If one of the ingredients is not found, player cannot cook
		if(!found){
			has_all_ingredients = false;
			break;
		}
	}
	
	return has_all_ingredients;
}

function check_can_cook(chosen_recipe){
	if(can_cook(chosen_recipe)){
		scr_text("Ok, now making " + string(chosen_recipe.name) + ".");
		global.cur_recipe = chosen_recipe;
		
		//goto room
		global.pending_room = rm_cooking;
	}
	else{
		scr_text("You do not have enough materials.");
		scr_text("Gather the correct materials and come back!");
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