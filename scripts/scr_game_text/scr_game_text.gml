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
				check_can_cook(chosen_recipe);
				break;
			case "cook-recipe-1":
				audio_play_sound(snd_select,0,0);
				var chosen_recipe = ds_list_find_value(_recipeList, 1);
				check_can_cook(chosen_recipe);
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
				audio_play_sound(snd_select,0,0);
				scr_text("Yea of course. I would love to get you your icecream!", "chiikawa", -1);
				scr_text("YAY! Come back soon, I'm hungry.", "hachiware");
				
				//Change Dialogue
				obj_hachiware.text_id = "hachiware wait"
				
				//Gain Recipe Code
				gain_recipe(obj_hachiware.hasRecipe, obj_hachiware.recipeHold);
				break;
			case "hachiware - no":
				audio_play_sound(snd_select,0,0);
				scr_text("No thanks! I'm a little busy right now.", "chiikawa", -1);
				scr_text(":c", "hachiware-sad");
				break;
<<<<<<< HEAD
				
				
				//new case for giving item
			case "hachiware - give":
    if (ds_list_empty(_recipeList)) {
		
        scr_text("Go get a recipe and then come back!", "hachiware");
    } 
    else {
        if (!doneCooking) {
            scr_text("I'm still waiting on that ice cream...", "hachiware");
        } 
        else if (doneCooking){
            scr_text("You've finished cooking! What would you like to do?", "chiikawa");

            
            scr_option("Give Ice Cream", "hachiware - give-confirm");
            scr_option("Nevermind", "hachiware - cancel");
        }
    }
    break;

case "hachiware - give-confirm":
    scr_text("YAY! Thank you so much!", "hachiware");
    scr_text("They say an apple a day keeps the doctor away, but does apple ice cream work too?", "hachiware");

    
    
    doneCooking = false; 

    break;

case "hachiware - cancel":
    scr_text("Okay! Come back when you're ready.", "hachiware");
    break;
				
		
		
		
		
=======
		
		//new case for when hachiware is waiting for food to be completed and first encounter is complete
		case "hachiware wait":
			scr_text("Do you have my food? Do you have my food?", "hachiware");
			scr_text("...", "chiikawa", -1);
			scr_text("I will be back soon!", "chiikawa", -1);
			scr_text("[insert tummy gurgling sounds]", "hachiware-sad");
			break;
		
		//new case for if hachiware has the food completed
		case "hachiware has food":
			scr_text("Hey you're back!");
				scr_option("Give", "hachiware - give");
				break;
			case "hachiware - give":
				audio_play_sound(snd_select,0,0);
				scr_text("Is that my apple ice cream? Thank you Chiikawa, you're the best!", "hachiware");
				scr_text("They say an apple a day keeps the doctor away, but does apple ice cream work too?", "hachiware");
			break;
			
>>>>>>> origin/main
		
		//---------------------------USAGI---------------------------//
		case "usagi":
			scr_text("Do you like pudding?");
				scr_option("Yes!", "usagi - yes");
				scr_option("No!", "usagi - no");
			break;
			case "usagi - yes":
				audio_play_sound(snd_select,0,0);
				scr_text("AHHH LETS GO GET PUDDINGGGG!!!");
				break;
			case "usagi - no":
				audio_play_sound(snd_select,0,0);
				scr_text("HMPH.");
				scr_text("That's why you have no friends!");
				break;
		
		//---------------------------KURI MAJU---------------------------//
		case "kuri maju":
			scr_text("I kinda want to nap... but I also want snacks... life is hard...");
			scr_text("Do you have alcohol? I want a beer!");
			break;
		
		//---------------------------MOMONGA---------------------------//
		case "momonga":
			scr_text("Tiny emergency: I lost my sock. Only one. Suspicious.");
			scr_text("If you squint really hard, that cloud looks like a rice ball!");
			break;
		
	}
	
}