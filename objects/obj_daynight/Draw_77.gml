shader_set(sh_daynight);

//Hold Vars
var hold_threshold = 0.00001; //how close to 0 or 1 before holding
var hold_time = 5 * 3600;

//cycle between 0 & 1 using modified sin function
var _t = cos_ext(time_of_day * time_multiplier, 0, 1);

//Holding Logic -- making the time & day last longer
	var hold_mode = 0;
	//0 = normal
	//1 = holding night
	//2 = holding day
	
	//Night Time Hold
	if(_t <= hold_threshold){
		hold_night_timer += 1;
		if(hold_night_timer < hold_time){
			_t = 0;
			hold_mode = 1;
		}
	}
	else {
		hold_night_timer = 0;
	}

	//Day Time Hold
	if(_t >= 1 - hold_threshold){
		hold_day_timer += 1;
		if(hold_day_timer < hold_time){
			_t = 1;
			hold_mode = 2;
		}
	}
	else {
		hold_day_timer = 0;
	}

shader_set_uniform_f(shader_get_uniform(sh_daynight, "time_of_day"), _t);

draw_surface(application_surface, 0, 0);

shader_reset();
