


//Font
draw_set_font(pixel_font_big);

for(var i = 0; i < array_length(inv); i++){
	
	
	
	var _x = screen_bord;
	var _y = screen_bord;
	var _sep = sep;
	var _offset = 20;
	var _col = c_white;
	
	//icon
	draw_sprite(inv[i].sprite, 0, _x, _y + _sep*i);
	
	//change color if item is selected
	if(selected_item == i)
		_col = c_yellow;
	
	draw_set_color(_col);
	
	//name
	draw_text(_x + _sep, _y + _sep*i + _offset, inv[i].name);
	
	//description
	if(selected_item == i)
		draw_text_ext(_x + 32, _y + _sep*array_length(inv), inv[i].description, 20, 300)
	
	draw_set_color(c_white);
}

draw_set_font(pixel_font);

//Recipe code
if(isOpen = false){
    //closed UI for recipe quest, clear the surface
    draw_sprite(spr_recipe_button,0,surfaceXpos,surfaceYpos);
    surface_free(recipeSurface);
    heightCounter = 0;
	draw_set_font(pixel_font_big);
	draw_text(initialXPos+1210,initialYPos+15,"Press Q to");
	draw_text(initialXPos+1210,initialYPos+40,"view recipes");
}else{
    //draw opened UI for recipe quest
    //create the surface for recipes
    if(!surface_exists(recipeSurface)){
        recipeSurface = surface_create(width,1);
    }
    //animation for recipe surface
    if(surface_get_height(recipeSurface)<maxHeight){
        heightCounter += rate/game_get_speed(gamespeed_fps);
        surface_resize(recipeSurface,width,heightCounter);
    }else{
        surface_resize(recipeSurface,width,maxHeight);
    }
    //set following drawing into the recipeSurface
    surface_set_target(recipeSurface);
	
	
	// Draw your sprite onto the surface (example)
	draw_sprite(spr_recipe_bg, 0, 0, 0);
	
//The recipe part
    for(var i = 0; i<ds_list_size(recipeList); i++){
		
		show_debug_message("Recipe List Size OTHER: " + string(ds_list_size(obj_item_manager.recipeList)));
        //Initialize necessary Parameters
        var _owncol = #95ff30;
        var _misscol = c_white;
        var _recipecol = #a3fbff;
        var _x = initialXPos;
        var _sep = sepRecipe;
        var _xoffset = ingredientXOffset;
        draw_set_font(pixel_font_big);

        //Recipe Name
        var curRecipe = ds_list_find_value(recipeList,i);
        draw_set_color(_recipecol);
        draw_text(_x,initialYPos,curRecipe.name);

        //var to track whether all ingredients are gathered
        var _ingrecount = 0;

        //Ingredient List
        for(var j =0; j< array_length(curRecipe.ingredients); j++){
            //set the ingredient to find in the inv and count of the ingredient
            var _item_to_find = curRecipe.ingredients[j];
            var _count = 0;

            //find ingredient
            if(array_contains(inv,_item_to_find)){
                draw_set_color(_owncol);
                _ingrecount ++;
            }else{
                draw_set_color(_misscol);
            }

            //check number of ingredient
            for (var k = 0; k < array_length(inv); k++) {
                if (inv[k] == _item_to_find) {
                    _count++;
                }
            }

            //draw ingredient and its count
            draw_text(_x+_xoffset,initialYPos+_sep*(j+1),curRecipe.ingredients[j].name);
            draw_text(_x+30*_xoffset,initialYPos+_sep*(j+1),_count);
		}
		//draw the check icon if all ingredients are gathered
        if(_ingrecount = array_length(curRecipe.ingredients)){
            draw_sprite(arrow,0,_x-5*_xoffset,initialYPos);
        }

        //Recipe Icon
        var _recipespr = curRecipe.sprite;
        draw_sprite(_recipespr,0,(width-initialXPos-20),initialYPos);

        //Set Ypos for next Recipe
        initialYPos += ((1+array_length(curRecipe.ingredients))*_sep+_sep) ;
    }
    //Reset Ypos for next draw function
    initialYPos = 10;

    //reset draw to general GUI
    surface_reset_target();
    draw_surface(recipeSurface,surfaceXpos,surfaceYpos);
	
	
}
	
	//need to draw sprites into the cooking room
	 //draw_sprite(curRecipe.sprite, 0, recipe_x, recipe_y);
	





draw_set_color(c_white);
draw_set_font(pixel_font);