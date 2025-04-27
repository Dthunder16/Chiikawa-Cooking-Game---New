cycle_timer = 0 ; // day night cycle 0 - 2400 using 100 minutes per hour for now 
// 600 till 1800 is daylight
// 400 till 600 is dawn 1800 till 2000 is dusk
// all else is night
cycle_timer_speed = 0.1 ; // adjust this to fit for your cycle speed
alarm[0] = room_speed ; // every second real time
gui_wd = 1600;
gui_hg = 1200;
daylight_alpha = 1 ;
daylight_colour = c_white ;
night_alpha = 0.2 ;
night_colour = merge_colour( c_black, c_blue, 0.4 ) ; // a nice nighttime colour
current_alpha = night_alpha ; // for reference in other drawing routines
current_colour = night_colour ; // for reference in other drawing routines

