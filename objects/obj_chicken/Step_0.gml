event_inherited();
image_speed = 0.25;
randomise();

if(is_moving){
	movement_state_timer --;
	
	if(movement_state_timer <= 0){
		//Stop movement phase
		is_moving = false;
		
		action_state_timer = irandom_range(80,300);
		current_action = choose(
				ChickenMove.MOVE_LEFT,
			    ChickenMove.MOVE_RIGHT,
				ChickenMove.MOVE_DOWN,
				ChickenMove.MOVE_UP
			);
	}
	else {
		//Pick or continue moving in a direction
		if(movement_state_timer == 59){
			current_move = choose(
				ChickenMove.MOVE_LEFT,
			    ChickenMove.MOVE_RIGHT,
				ChickenMove.MOVE_DOWN,
				ChickenMove.MOVE_UP
			);
		}
		
		//Move chicken
		if(current_move == ChickenMove.MOVE_LEFT){
			x -= move_speed;
			sprite_index = cl_walk;
		}
		else if(current_move == ChickenMove.MOVE_RIGHT){
			x += move_speed;
			sprite_index = cr_walk;
		}
		else if(current_move == ChickenMove.MOVE_DOWN){
			y += move_speed;
			sprite_index = cd_walk;
		}
		else if(current_move == ChickenMove.MOVE_UP){
			y -= move_speed;
			sprite_index = cu_walk;
		}
	}
}
//Action
else{
	action_state_timer--;
	
	//Show correct sprite based on direction and action
    if (current_move == ChickenMove.MOVE_LEFT) {
        if (current_action == ChickenAction.IDLE) sprite_index = cl_idle;
        else if (current_action == ChickenAction.PECK) sprite_index = cl_peck;
        else if (current_action == ChickenAction.SIT) {
			sprite_index = cl_sit;
			check_laid();
		}
    }
    else if (current_move == ChickenMove.MOVE_RIGHT) {
        if (current_action == ChickenAction.IDLE) sprite_index = cr_idle;
        else if (current_action == ChickenAction.PECK) sprite_index = cr_peck;
        else if (current_action == ChickenAction.SIT) {
			sprite_index = cr_sit;
			check_laid();
		}
    }
    else if (current_move == ChickenMove.MOVE_DOWN) {
        if (current_action == ChickenAction.IDLE) sprite_index = cd_idle;
        else if (current_action == ChickenAction.PECK) sprite_index = cd_peck;
        else if (current_action == ChickenAction.SIT) {
			sprite_index = cd_sit;
			check_laid();
		}
    }
    else if (current_move == ChickenMove.MOVE_UP) {
        if (current_action == ChickenAction.IDLE) sprite_index = cu_idle;
        else if (current_action == ChickenAction.PECK) sprite_index = cu_peck;
        else if (current_action == ChickenAction.SIT) {
			sprite_index = cu_sit;
			check_laid();
		}
    }
	
	//Reset the check laid flag
	if(current_action != ChickenAction.SIT){
		has_laid_egg = false;
	}

	//Iterate the action timer
    if (action_state_timer <= 0) {
        // Back to movement
        is_moving = true;
        movement_state_timer = irandom_range(80, 300); // Random movement duration
    }
}