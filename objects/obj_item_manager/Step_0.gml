//Get Selected Item
selected_item = -1;

for(var i = 0; i < array_length(inv); i++){
	var _x = screen_bord;
	var _y = screen_bord + (sep * i);
	
	var _w = 64;
	var _h = 64;
	
	if(device_mouse_x_to_gui(0) > _x && device_mouse_x_to_gui(0) < _x + _w && device_mouse_y_to_gui(0) > _y && device_mouse_y_to_gui(0) < _y + _h){
		selected_item = i;
		show_debug_message(selected_item);
	}
}

//function to open and close recipe list
if(keyboard_check_pressed(ord("Q"))){
    isOpen = !isOpen;
}