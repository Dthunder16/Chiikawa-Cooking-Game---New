//Button Vars
accept_key = keyboard_check_pressed(vk_space);

//Textbox Pos
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 180;

//-------------Set Up-------------//
if(setup == false){
	//ensure the code only runs once
	setup = true;
	
	//font settings
	draw_set_font(pixel_font);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages of text
	for(var i = 0; i < page_number; i++){
		//find how many chars are on each page
		//store that num in "text_length" arr
		text_length[i] = string_length(text[i]);
		
		//X Pos of Textbox
			//Character on the left
			text_x_offset[i] = 125;
			portrait_x_offset[i] = 50;
			
			//Character on the right
			if(speaker_side[i] == -1){
				text_x_offset[i] = 50;
				portrait_x_offset[i] = 280;
			}
		
			//Textbox in Middle of Screen
			if(speaker_sprite[i] == noone)
				text_x_offset[i] = 90;
		
		//CHAR LOOP 
		//Loop through all the chars in the page <- Nested for 2D Loop
		for(var c = 0; c < text_length[i]; c++){
			var _char_pos = c+1; //c+1 since strings start at pos 1
			
			//store individual characters in "char" array
			char[c, i] = string_char_at(text[i], _char_pos);
			
			//get current width of the line that we're typing
			var _txt_up_to_char = string_copy(text[i], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,i]); 
			
			//get the last free space
			if(char[c,i] == " ") last_free_space = _char_pos+1;
			
			//get the line breaks
			if(_current_txt_w - line_break_offset[i] > line_width){
				line_break_pos[line_break_num[i], i] = last_free_space; //keep track of every line break
				line_break_num[i]++;                                    //add to linebreak num when words are too long
				
				var _txt_up_to_last_space = string_copy(text[i], 1, last_free_space);   //get string of all text up to the last free space
				var _last_free_space_string = string_char_at(text[i], last_free_space); //get string of last free space
				
				line_break_offset[i] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
			
		
		
		//getting each character's coordinates
		for(var c = 0; c < text_length[i]; c++){
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[i] + border;
			var _txt_y = textbox_y + border;
			var _txt_up_to_char = string_copy(text[i], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,i]); 
			var _txt_line = 0;
			
			//compensate for string breaks
			for(var lb = 0; lb < line_break_num[i]; lb++){
				//if current looping char is after a line break
				if(_char_pos >= line_break_pos[lb, i]){
					var _str_copy = string_copy(text[i], line_break_pos[lb, i], _char_pos-line_break_pos[lb, i]);
					_current_txt_w = string_width(_str_copy);
					
					//record the "line" this character should be on
					_txt_line = lb+1; //+1 since lb starts at 0
				}
			}
			
			//add to the x & y coord based on the new info
			char_x[c, i] = _txt_x + _current_txt_w;
			char_y[c, i] = _txt_y + _txt_line*line_sep;
		}
		
		
	}
}

//-------------Typing Text Effect-------------//
if(draw_char < text_length[page]){
	draw_char += text_spd;
	if (voice_playing = false)
	{
		audio_play_sound(vce_text,0,1);
		voice_playing = true;
		alarm_set(0,30);
	}
	//Cannot go beyond this speed (0 to text_length)
	draw_char = clamp(draw_char, 0, text_length[page]);
	
	//Stopping the typing at '.' (periods) to create a slight pause
	var _check_char = string_char_at(text[page], draw_char);
	if(_check_char == "." || _check_char == "?" || _check_char == ","){
		//text_pause_timer = text_pause_time;
		audio_pause_sound(vce_text);
		voice_playing = false;
	}
}

//-------------Flip through pages-------------//
if(accept_key){
	//if typing is done -> go to next page
	if(draw_char == text_length[page]){
		//Next Page Case
		
		if(page < page_number - 1){
			page++;
			draw_char = 0;
		}
		
		//No More Pages Case -> Destroy Textbox
		else {
			//Link text for option -> create new textbox & remove old textbox
			if(option_number > 0){
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}
	//if typing not done -> immediately complete the text
	else{
		draw_char = text_length[page];
	}
}

//-------------Draw Textbox----------------//
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//Draw the Speaker Sprite
if(speaker_sprite[page] != noone){
	sprite_index = speaker_sprite[page];
	
	//if you want to pause the animation when the character finishes talking
		//if(draw_char == text_length[page]) image_index = 0;
	
	var _speaker_x = textbox_x + portrait_x_offset[page];
	
	if(speaker_side[page] == -1){
		_speaker_x += sprite_width;
		
		//draw the speaker
		draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
	}
	else{
		//draw the speaker
		draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
	}
}

//Back of the Textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w,
				textbox_height / txtb_spr_h, 0, c_white, 1);


//-------------Options------------------------//
if(draw_char == text_length[page] && page == page_number - 1){
	//Option Select
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1);
	
	//Create few options to show up
	var _op_space = 23;
	var _op_bord = 4;
	
	for(var op = 0; op < option_number; op++){
		//Draw Option Box <- dynamically find the longest text length
		var _o_w = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 18, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, 
						(_op_space-1)/txtb_spr_h, 0, c_white, 1);
		
		//Arrow
		if(option_pos == op){
			draw_sprite(arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*op + 3);
		}
		
		//Draw Option Text
		draw_text(_txtb_x + 18 + _op_bord, _txtb_y - _op_space*option_number + _op_space*op + 4.5, option[op]);
		
	}
}


//Draw Text
for(var c = 0; c < draw_char; c++){
	//draw each individual character
	draw_text(char_x[c, page], char_y[c, page], char[c, page]);
}

//Transitions
if (!instance_exists(obj_textbox) && global.pending_room != -1) {
    room_goto(global.pending_room);
    global.pending_room = -1; // Reset after transitioning
}