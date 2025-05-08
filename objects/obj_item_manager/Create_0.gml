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
		
	apple: new create_item(
		"Apple",
		"An Apple! You're the apple of my pie!",
		spr_apple_64,
		spr_apple,
		0
		),
	berry: new create_item(
		"Berry",
		"A berry! Today's weather is berry nice, isn't it?",
		spr_berry_64,
		spr_berry_8x8,
		0
		),
	butter: new create_item(
		"Butter",
		"It's butter! You butter believe it! Dattebayo!",
		spr_butter,
		spr_butter,
		0
		),
	flour: new create_item(
		"Flour",
		"It's flour! Gluten tag to all my German homies",
		spr_flour_64,
		spr_flour,
		0
		),
	milk: new create_item(
		"Milk",
		"The love I have for milk is legen-dairy. Too bad it gives me IBS",
		spr_milk,
		spr_milk,
		0
		),
	rice: new create_item(
		"Rice",
		"Hi Rice, I'm Chiikawa. Rice to meet you too!",
		spr_rice,
		spr_rice,
		0
		),
	strawberry: new create_item(
		"Strawberry",
		"Berries and cream berries and cream, I'm a little lad who loves berries and cream",
		spr_strawberry_64,
		spr_strawberry_8x8,
		0
		),
	tomato: new create_item(
		"Tomato",
		"I love toes.. I mean uh! I love you from my head tomatoes <3",
		spr_tomato_64,
		spr_tomato,
		0
		),
	vanilla: new create_item(
		"Vanilla",
		"It's vanilla bean! Cool beans.",
		spr_vanilla,
		spr_vanilla,
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
		sprite: spr_appleicecream,
		ingredients: [global.raw_materials.egg, global.raw_materials.apple]
	},
	
	apple_pie :
	{
		name: "Apple Pie",
		description: "",
		sprite: spr_appleicecream,
		ingredients: [global.raw_materials.egg, global.raw_materials.apple]
	}
	
	
}

/*
switch (room) {
    case rm_cooking:
        
        break;
    case rm_game:
       
        break;
   
}
*/


//Drawing & Mouse Pos
sep = 90;
screen_bord = 50;

selected_item = -1;

//Create Inventory
inv = array_create(0);

//updatedcodeMay6th
//Create Recipe Inventory
recipeList = ds_list_create();
//Drawing Pos for Recipe
initialYPos = 20;
initialXPos = 20; //ingredient position relative to surface
sepRecipe = 40; //sepration between recipes
ingredientXOffset = 10; 
//Bool to control open and close of recipe page
isOpen = false;
rate = 500; //animation speed
width = 350;
maxHeight = 300; //surface height and width
heightCounter = 0; //counter for surface animation
recipeSurface = surface_create(width,maxHeight); //create the surface
surfaceXpos = display_get_gui_width() - 8*screen_bord; 
surfaceYpos = 10; //surface position relative to GUI


ingredient_x = 900;
first_ingredient_y = 375;
second_ingreditent_y = 525;
third_ingredient_y = 675;
		
recipe_x = 600;
recipe_y = 450;