function scr_pending_room_check(){
	if (!instance_exists(obj_textbox) && global.pending_room != -1) {
		room_goto(global.pending_room);
		global.pending_room = -1; // Reset after transitioning
	}
}