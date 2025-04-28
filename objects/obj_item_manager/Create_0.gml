depth = -9999;

//item constructor
function create_item(_name, _desc, _spr, _spr_in_game) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
	sprite_in_game = _spr_in_game;
}



//Materials
global.raw_materials = 
{
	egg : new create_item(
		"Egg",
		"It's an egg! Try not to crack it!",
		spr_egg,
		spr_egg_8x8
		),
	
}

//Recipes - Completed Foods
global.food = 
{
	apple_icecream :
	{
		name: "Apple Ice Cream",
		description: "",
		sprite: spr_appleicecream
	}
}

//Drawing & Mouse Pos
sep = 64;
screen_bord = 32;

selected_item = -1;

//Create Inventory
inv = array_create(0);
