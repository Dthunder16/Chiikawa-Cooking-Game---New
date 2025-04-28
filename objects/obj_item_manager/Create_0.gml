depth = -9999;

//item constructor
function create_item(_name, _desc, _spr, _spr_in_game, _effect) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
	sprite_in_game = _spr_in_game;
	effect = _effect
}



//Materials
global.raw_materials = 
{
	egg : new create_item(
		"Egg",
		"It's an egg! Try not to crack it!",
		spr_egg_64,
		spr_egg_8x8,
		0
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
sep = 90;
screen_bord = 50;

selected_item = -1;

//Create Inventory
inv = array_create(0);
