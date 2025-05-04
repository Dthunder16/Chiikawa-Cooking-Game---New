//Pick Up Items
function item_add(_item){
	array_push(obj_item_manager.inv, _item);
}

//
function pick_up_item(_item){
	//Destroy the Item You Collect + Add to Inventory
	if(place_meeting(x,y,obj_player)){
		//Add to Inventory Code
		item_add(_item);
		//show_debug_message(array_length(obj_item_manager.inv));
		//Destroy Instance
		instance_destroy();
	}
}