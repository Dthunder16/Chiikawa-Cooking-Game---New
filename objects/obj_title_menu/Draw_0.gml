//draw the menu background
draw_sprite_ext(sprite_index, image_index, x_pos, y_pos, width/sprite_width, height/sprite_height, 0, c_white, 0.75);

//draw the options
draw_set_font(pixel_font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	if(pos == i) _c = make_color_rgb(85, 37, 45);
	
	draw_text_color(x_pos + op_border, y_pos + op_border + op_space*i, option[i], _c, _c, _c, _c, 1);
}