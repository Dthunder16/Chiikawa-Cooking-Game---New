//Time of Day
time_of_day = 0;
	//0 = night time
	//1 = day time
time_multiplier = (2 * pi) / 72000

hold_night_timer = 0;
hold_day_timer = 0;
holding_time = false;

//Disable the draw event
application_surface_draw_enable(false);
