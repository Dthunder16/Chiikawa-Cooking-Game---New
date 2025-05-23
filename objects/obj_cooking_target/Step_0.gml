

vspeed += gravity;


if (keyboard_check(vk_space)) {
    vspeed += jump_force * 0.2;  
}

// Apply vertical movement
y += vspeed;

//limit max speed
if (vspeed > 2) {
    vspeed = 2;
}

if (y < y_min) {
    y = y_min;
    vspeed = 0;
}
if (y > y_max) {
    y = y_max;
    vspeed = 0;
}


//Cooking Progress
var bar_collide = instance_place(x,y,obj_cooking_bar);

if(bar_collide){
	obj_progress_bar.overlap_time += 2.5;
	obj_progress_bar.overlap_time = clamp(obj_progress_bar.overlap_time, 1, 200);
	
	if (obj_progress_bar.overlap_time == 200){
		global.done_cooking = true;
		global.item_collected = false;
		audio_stop_sound(bgm_cooking);
		audio_resume_sound(bgm_default);
		room_goto(rm_game);
	}
} else {
    //progress goes down when not overlapping
    if (obj_progress_bar.overlap_time < obj_progress_bar.overlap_time_target) {
        //obj_progress_bar.overlap_time = 0;
    }
}


