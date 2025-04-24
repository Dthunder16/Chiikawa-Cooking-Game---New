depth = -9999;

//Textbox Parameters
textbox_width = 220;
textbox_height = 64;

border = 8;
line_sep = 12;
line_width = textbox_width - border*2;

//Draw & Animate Textbox Background
txtb_spr[0] = textbox_chikawa;
txtb_img = 0;
txtb_img_spd = 6/60;

//Text
page = 0; //page of dialogue we are on
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]); //return how many characters per array var

char[0, 0] = "";  //# of chars per page [page #, char #]
char_x[0, 0] = 0; //x pos of chars
char_y[0, 0] = 0; //y pos of chars

draw_char = 0;
text_spd = 1;
text_x_offset[0] = 0;

//Options - var to keep track of the user input & how it affects the NPCs response
option[0] = "";
option_link_id[0] = -1;
option_number = 0;
option_pos = 0;

setup = false;

//effect
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;
