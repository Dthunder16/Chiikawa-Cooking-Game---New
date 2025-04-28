//Font
draw_set_font(pixel_font_big);


for(var i = 0; i < array_length(inv); i++){
	
	var _x = screen_bord;
	var _y = screen_bord;
	var _sep = sep;
	var _offset = 20;
	var _col = c_white;
	
	//icon
	draw_sprite(inv[i].sprite, 0, _x, _y + _sep*i);
	
	//change color if item is selected
	if(selected_item == i)
		_col = c_yellow;
	
	draw_set_color(_col);
	
	//name
	draw_text(_x + _sep, _y + _sep*i + _offset, inv[i].name);
	
	//description
	if(selected_item == i)
		draw_text_ext(_x + 32, _y + _sep*array_length(inv), inv[i].description, 20, 300)
	
	draw_set_color(c_white);
}