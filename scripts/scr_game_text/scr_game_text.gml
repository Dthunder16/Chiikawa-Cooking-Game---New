// @param_text_id
function scr_game_text(_text_id){
	var _recipeList = obj_item_manager.recipeList;
	switch(_text_id){
		
		///---------------------------Cooking---------------------------//
		case "fireplace":
			scr_text("What would you like to cook?");
				scr_option("Yes!", "cooking - yes");
				scr_option("No!", "cooking - no");
			break;
		
		case "cooking - yes":
			audio_play_sound(snd_select,0,0);
			if(ds_list_empty(_recipeList)){
				scr_text("You do not have a recipe.");
				scr_text("Go get a recipe and then come back!");
			} 
			else {
				scr_text("What would you like to cook?");

				// Dynamically assign option ids
				for (var i = 0; i < ds_list_size(_recipeList); i++) {
					var recipe = ds_list_find_value(_recipeList, i);
					scr_option(recipe.name, "cook-recipe-" + string(i)); // dynamically named options
				}

				scr_option("Nevermind!", "cooking - cancel");
			}
			break;
			
			//Option Responses
			case "cook-recipe-0":
				audio_play_sound(snd_select,0,0);
				var _recipeList = obj_item_manager.recipeList;
				var chosen_recipe = ds_list_find_value(_recipeList, 0);
				
				obj_item_manager.cur_recipe = chosen_recipe;
				if(check_can_cook(chosen_recipe)){
					//Remove Items from Inventory
					remove_ingredients(chosen_recipe);
				
					//Stop Sound from Playing
					audio_pause_sound(bgm_default);
				}
				break;
			case "cook-recipe-1":
				audio_play_sound(snd_select,0,0);
				var _recipeList = obj_item_manager.recipeList;
				var chosen_recipe = ds_list_find_value(_recipeList, 1);
				
				obj_item_manager.cur_recipe = chosen_recipe;
				check_can_cook(chosen_recipe);
				
				if(check_can_cook(chosen_recipe)){
					//Reset var to allow player to getting more than 1 item from cooking
					obj_player.item_collected = false;
					
					//Remove Items from Inventory
					remove_ingredients(chosen_recipe);
				
					//Stop Sound from Playing
					audio_pause_sound(bgm_default);
				}
				break;
			case "cooking - cancel":
				audio_play_sound(snd_select,0,0);
				scr_text("Ok, come back when you know what you want to cook!");
				break;

		case "cooking - no":
			audio_play_sound(snd_select,0,0);
			scr_text("Ok, come back when you know what you want to cook!");
			break;
		
		//---------------------------HACHIWARE---------------------------//
		case "hachiware first encounter":
			scr_text("Hi, I am Hachiware! Nice to meet you!.", "hachiware");
			scr_text("I'm really craving a sweet treat right now...", "hachiware");
			scr_text("Would you like to make me an apple flavoured sweet treat?", "hachiware");
				scr_option("Yes!", "hachiware - yes");
				scr_option("No!", "hachiware - no");
				
			break;
		
			case "hachiware - yes":	
				obj_item_manager.make_food_hachi = true;
				
				if(!ds_list_empty(obj_item_manager.recipeList)){
					scr_text("Oh! It seems like you are helping usagi right now.", "hachiware");
					scr_text("Come back when you are done!", "hachiware");
				}
				else{
					audio_play_sound(snd_select,0,0);
					scr_text("Yea of course. I would love to get you your icecream!", "chiikawa", -1);
					scr_text("YAY! Come back soon, I'm hungry.", "hachiware");
				
					//Change Text
					obj_hachiware.text_id = "hachiware - give";
				
					//Gain Recipe Code
					gain_recipe(obj_hachiware.hasRecipe, obj_hachiware.recipeHold);
				}
				break;
			
			case "hachiware - no":
				audio_play_sound(snd_select,0,0);
				scr_text("No thanks! I'm a little busy right now.", "chiikawa", -1);
				scr_text(":c", "hachiware-sad");
				break;
			
		//new case for giving item
		case "hachiware - give":
			if (ds_list_empty(_recipeList)) {
			    scr_text("Go get a recipe and then come back!", "hachiware");
			} 
			else {
				if (!variable_global_exists("done_cooking")) {
				    global.done_cooking = false;
				}
			    else if (!global.done_cooking) {
			        scr_text("I'm still waiting on that ice cream...", "hachiware");
			    } 
			    else if (global.done_cooking){
			        scr_text("You've finished cooking! What would you like to do?", "chiikawa", -1);
			        scr_option("Give Ice Cream", "hachiware - give-confirm");
			        scr_option("Nevermind", "hachiware - cancel");
			    }
			}
			break;
			
			case "hachiware - give-confirm":
				global.done_cooking = true;
			    scr_text("YAY! Thank you so much!", "hachiware");
			    scr_text("They say an apple a day keeps the doctor away, but does apple ice cream work too?", "hachiware");
			    
				//Remove Recipe from Recipe List
				//ds_list_delete(obj_item_manager.recipeList, global.food.apple_icecream);
				
				//Remove Item from Inventory
				item_remove(obj_item_manager.cur_recipe);
				
				//Remove Recipe
				ds_list_clear(obj_item_manager.recipeList);
				obj_hachiware.text_id = "hachiware - complete";

			    break;

			case "hachiware - cancel":
			    scr_text("Okay! Come back when you're ready.", "hachiware");
				obj_hachiware.text_id = "hachiware - give";
			    break;
		
		case "hachiware - complete":
			scr_text("Thanks for making me full!", "hachiware");
			scr_text("Now I will never need to eat again!!", "hachiware");
			scr_text("For sure...", "chiikawa", -1);
			break;
				
		//---------------------------USAGI---------------------------//
		case "usagi":
			scr_text("Do you like pudding?", "usagi");
				scr_option("Yes!", "usagi - yes");
				scr_option("No!", "usagi - no");
			break;
			
			case "usagi - yes":
				//audio_play_sound(snd_select,0,0);
				scr_text("AHHH LETS GO GET PUDDINGGGG!!!", "usagi");
				scr_text("Would you like to make me some pudding?", "usagi");
					scr_option("Yes!", "make pudding");
					scr_option("No!", "no pudding");
				break;
			
				case "make pudding":
					obj_item_manager.make_food_usagi = true;
				
					if(!ds_list_empty(obj_item_manager.recipeList)){
						scr_text("Come back after you finish helping hachiware!", "usagi");
					}
					else {
						audio_play_sound(snd_select,0,0);
						scr_text("One pudding for you coming up!", "chiikawa", -1);
						scr_text("YATAAAAAA", "usagi");
				
						//Change Text
						obj_usagi.text_id = "usagi - give";
				
						//Gain Recipe Code
						gain_recipe(obj_usagi.hasRecipe, obj_usagi.recipeHold);
					}
					break;
			
				case "no pudding":
					audio_play_sound(snd_select,0,0);
					scr_text("No thanks! I'm a little busy right now.", "chiikawa", -1);
					scr_text("HMPH. That's why you have no friends.", "usagi");
					break;
			
			case "usagi - no":
				//audio_play_sound(snd_select,0,0);
				scr_text("HMPH.", "usagi");
				scr_text("That's why you have no friends!", "usagi");
				break;
			
			//Giving Food to Usagi
			case "usagi - give":
				if (ds_list_empty(_recipeList)) {
				    scr_text("Go get a recipe and then come back!", "usagi");
				} 
				else {
					if (!variable_global_exists("done_cooking")) {
					    global.done_cooking = false;
					}
				    else if (!global.done_cooking) {
				        scr_text("I'm still waiting on that pudding...", "usagi");
				    } 
				    else if (global.done_cooking){
				        scr_text("You've finished cooking! What would you like to do?", "chiikawa", -1);
				        scr_option("Give Pudding", "usagi - give-confirm");
				        scr_option("Nevermind", "usagi - cancel");
				    }
				}
				break;
			
				case "usagi - give-confirm":
					global.done_cooking = true;
				    scr_text("YATAAAAAA!", "usagi");
				    scr_text("Time to eat everything!!!", "usagi");
			    
					//Remove Recipe from Recipe List
					ds_list_delete(obj_item_manager.recipeList, global.food.purin);
				
					//Remove Item from Inventory
					item_remove(obj_item_manager.cur_recipe);
					ds_list_clear(obj_item_manager.recipeList);
					
					obj_usagi.text_id = "usagi - complete";

				    break;

				case "usagi - cancel":
				    scr_text("Okay! Come back when you're ready.", "usagi");
					obj_usagi.text_id = "usagi - give";
				    break;
		
			case "usagi - complete":
				scr_text("Thanks for making me full!", "usagi");
				scr_text("Now I will never need to eat again!!", "usagi");
				scr_text("For sure...", "chiikawa", -1);
				break;
		
		//---------------------------KURI MAJU---------------------------//
		case "kuri maju":
			scr_text("I kinda want to nap... but I also want snacks... life is hard...", "kuri manju");
			scr_text("Do you have alcohol? I want a beer!", "kuri manju");
			scr_text("No...", "chiikawa", -1);
			scr_text("[You proceed to walk away slowly]", "chiikawa", -1);
	}
	
}