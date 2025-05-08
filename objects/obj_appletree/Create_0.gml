has_dropped_apples = false;

function drop_apples(){
	if(!has_dropped_apples){
		instance_create_layer(x , y + 50, "Instances", obj_apple);
		
		
		sprite_index = spr_tree;
	}
	has_dropped_apples = true;
}

canSFX = true;