event_inherited();

//Destroy the Item You Collect + Add to Inventory
if(place_meeting(x,y,obj_player)){
	//Add to Inventory Code
	show_debug_message(this_item.name);
	item_add(this_item);
	show_debug_message(array_length(obj_item_manager.inv));
	//Destroy Instance
	instance_destroy();
}
