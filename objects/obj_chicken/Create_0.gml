//Movement
move_speed = 0.2;

//Laying Egg
has_laid_egg = false;

function check_laid(){
	if(!has_laid_egg){
		instance_create_layer(x, y, "Instances", obj_egg);
		has_laid_egg = true;
	}
}

//States
	//Movement
	enum ChickenMove {
	    MOVE_LEFT,
	    MOVE_RIGHT,
		MOVE_DOWN,
		MOVE_UP
	}
	//Actions the Chicken can take
	enum ChickenAction {
		IDLE,
		PECK,
		SIT
	}

//Sprites
	//Down
	cd_idle = chicken_down_idle;
	cd_peck = chicken_down_peck;
	cd_sit = chicken_down_sit;
	cd_walk = chicken_down_walk;
	
	//Left
	cl_idle = chicken_left_idle;
	cl_peck = chicken_left_peck;
	cl_sit = chicken_right_sit;
	cl_walk = chicken_left_walk;
	
	//Right
	cr_idle = chicken_right_idle;
	cr_peck = chicken_right_peck;
	cr_sit = chicken_left_sit;
	cr_walk = chicken_right_walk;
	
	//Up
	cu_idle = chicken_up_idle;
	cu_peck = chicken_up_peck;
	cu_sit = chicken_up_sit;
	cu_walk = chicken_up_walk;

//State Control
current_move = ChickenMove.MOVE_RIGHT;
current_action = ChickenAction.IDLE;
movement_state_timer = 600;
action_state_timer = 800;
is_moving = true;