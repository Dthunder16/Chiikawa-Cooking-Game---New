depth = -bbox_bottom;

//Lerp Item to Player for Pick Up
if(distance_to_object(obj_player) <= 50){
	//Item will float towards player
	x = lerp(x, obj_player.x, 0.2);
	y = lerp(y, obj_player.y, 0.2);
}

//Pick Up
sprite = sprite_index;
item = noone;

switch(sprite_index){
	case (spr_apple):
		item = global.raw_materials.apple;
		pick_up_item(item);
		break;
	case (spr_berry_8x8):
		item = global.raw_materials.berry;
		pick_up_item(item);
		break;
	case (spr_butter):
		item = global.raw_materials.butter;
		pick_up_item(item);
		break;
	case (spr_flour):
		item = global.raw_materials.flour;
		pick_up_item(item);
		break;
	case (spr_milk):
		item = global.raw_materials.milk;
		pick_up_item(item);
		break;
	case (spr_rice):
		item = global.raw_materials.rice;
		pick_up_item(item);
		break;
	case (spr_strawberry_8x8):
		item = global.raw_materials.strawberry;
		pick_up_item(item);
		break;
	case (spr_vanilla):
		item = global.raw_materials.vanilla;
		pick_up_item(item);
		break;
}

