// @param_text_id
function scr_game_text(_text_id){
	switch(_text_id){
		
		//---------------------------HACHIWARE---------------------------//
		case "hachiware":
			scr_text("Do you want to go on an adventure? Please say yes, please say yes.", "hachiware");
				scr_option("Yes!", "hachiware - yes");
				scr_option("No!", "hachiware - no");
			break;
			case "hachiware - yes":	
				scr_text("Yea of course. I would love to go on an adventure with you hachiware!", "chiikawa", -1);
				scr_text("yay, lets go!! Lets go on an epic, fabulous adventure.", "hachiware");
				break;
			case "hachiware - no":
				scr_text("No thanks! I'm a little busy right now.", "chiikawa", -1);
				scr_text(":c", "hachiware-sad");
				break;
		
			
			scr_text("Hehehe~ I drew a picture of us! Look, you're the roundest one!", "hachiware");
			scr_text("Should we make matching flower crowns? I found purple ones today!");
			scr_text("I stepped in mud… again. But it was kind of fun!", "hachiware");
			scr_text("I like when the wind is soft like this. It feels like a hug~");
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