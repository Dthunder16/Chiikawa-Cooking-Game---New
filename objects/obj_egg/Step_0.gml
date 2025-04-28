event_inherited();

//Destroy the Item You Collect + Add to Inventory
if(place_meeting(x,y,obj_player)){
	//Add to Inventory Code
	item_add(item);
	show_debug_message(array_length(obj_item_manager.inv));
	//Destroy Instance
	instance_destroy();
}
