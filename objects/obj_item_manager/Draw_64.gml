//Font
draw_set_font(pixel_font);


for(var i = 0; i < array_length(inv); i++){
	
	var _x = screen_bord;
	var _y = screen_bord;
	var _sep = sep;
	var _offset = 8;
	var _col = c_white;
	
	//icon
	draw_sprite_ext(inv[i].sprite, 0, _x, _y + _sep*i, 4, 4, 0, c_white, 1);
	
	//change color if item is selected
	if(selected_item == i)
		_col = c_yellow;
	
	draw_set_color(_col);
	
	//name
	draw_text(_x + _sep * 0.7, _y + _sep*i + _offset, inv[i].name);
	
	//description
	if(selected_item == i)
		draw_text_ext(_x + 32, _y + _sep*array_length(inv), inv[i].description, 12, 100)
	
	draw_set_color(c_white);
}

