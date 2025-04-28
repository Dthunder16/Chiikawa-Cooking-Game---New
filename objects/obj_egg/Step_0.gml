event_inherited();

//Destroy the Item You Collect + Add to Inventory
if(place_meeting(x,y,obj_player)){
	//Add to Inventory Code
	item_add(item);
	//Destroy Instance
	instance_destroy();
}
