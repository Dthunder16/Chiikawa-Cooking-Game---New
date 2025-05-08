depth = -999;

//Drawing & Mouse Pos


ingredient_x = 900;
first_ingredient_y = 375;
second_ingreditent_y = 525;
third_ingredient_y = 675;
		
recipe_x = 600;
recipe_y = 450;
		
sep = 90;
screen_bord = 50;

selected_item = -1;

//Create Inventory
inv = array_create(0);

//updatedcodeMay6th
//Create Recipe Inventory

//Drawing Pos for Recipe

sepRecipe = 150; //sepration between recipes
ingredientXOffset = 10; 
_xoffset = 10;
_x = 600;
//Bool to control open and close of recipe page
isOpen = false;
rate = 500; //animation speed
width = 350;
maxHeight = 300; //surface height and width
heightCounter = 0; //counter for surface animation
recipeSurface = surface_create(width,maxHeight); //create the surface
surfaceXpos = display_get_gui_width() - 8*screen_bord; 
surfaceYpos = 10; //surface position relative to GUI