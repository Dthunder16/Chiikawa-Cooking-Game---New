//Get Selected Item
selected_item = -1;

for(var i = 0; i < array_length(inv); i++){
	var _x = screen_bord;
	var _y = screen_bord + sep * i;
	
	if(mouse_x > _x && mouse_x < _x + 64 && mouse_y > _y && mouse_y < _y + 64){
		selected_item = i;
		show_debug_message(selected_item);
	}
}
