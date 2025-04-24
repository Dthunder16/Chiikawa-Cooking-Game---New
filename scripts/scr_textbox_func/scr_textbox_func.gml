function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999; 
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = textbox_chikawa;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	//snd[page_number] = snd_voice_mid;
}

/// @param _text
/// @param [character]
/// @param [side]
function scr_text(_text){
	scr_set_defaults_for_text();
	text[page_number] = _text;
	
	//Change Sprites
	if(argument_count > 1){     //means theres more than one argument passed in
		switch(argument[1]){
			
			//----------------------HACHIWARE----------------------
			case "hachiware":
				speaker_sprite[page_number] = hachiware_64;
				txtb_spr[page_number] = textbox_hachiware;
				break;
			case "hachiware-sad":
				speaker_sprite[page_number] = hachiware_sad;
				txtb_spr[page_number] = textbox_hachiware;
				break;
			
			case "chiikawa":
				speaker_sprite[page_number] = chiikawa_64;
				txtb_spr[page_number] = textbox_chikawa;
				break;
			
			case "usagi":
				break;
		}
	}
	
	//Speaker Side
	if(argument_count > 2){
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;
}


// @param option
// @param link_id
function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

// @param _text_id
function create_textbox(_text_id){
	with(instance_create_depth(0,0,-9999,obj_textbox)){
		scr_game_text(_text_id);
	}
}
