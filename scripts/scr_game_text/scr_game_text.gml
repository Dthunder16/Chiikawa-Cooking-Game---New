// @param_text_id
function scr_game_text(_text_id){
	switch(_text_id){
		
		//---------------------------HACHIWARE---------------------------//
		case "hachiware":
			scr_text("Hi, I am Hachiware! Nice to meet you!.", "hachiware");
			scr_text("I'm really craving a sweet treat right now...", "hachiware");
			scr_text("Would you like to make me an apple flavoured sweet treat?", "hachiware");
				scr_option("Yes!", "hachiware - yes");
				scr_option("No!", "hachiware - no");
			break;
			case "hachiware - yes":	
				scr_text("Yea of course. I would love to get you your icecream!", "chiikawa", -1);
				scr_text("YAY! Come back soon, I'm hungry.", "hachiware");
				
				//Gain Recipe Code
				gain_recipe(obj_hachiware.hasRecipe, obj_hachiware.recipeHold);
				break;
			case "hachiware - no":
				scr_text("No thanks! I'm a little busy right now.", "chiikawa", -1);
				scr_text(":c", "hachiware-sad");
				break;
			break;
		
		//---------------------------USAGI---------------------------//
		case "usagi":
			scr_text("Do you like pudding?");
				scr_option("Yes!", "usagi - yes");
				scr_option("No!", "usagi - no");
			break;
			case "usagi - yes":
				scr_text("AHHH LETS GO GET PUDDINGGGG!!!");
				break;
			case "usagi - no":
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