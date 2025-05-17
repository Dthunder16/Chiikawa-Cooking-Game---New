gravity = 0.1;        // strength of gravity
vspeed = 0;           // vertical speed
jump_force = -2;


//boundaries for movement
y_min = obj_cooking_ui_bg.y + 100;
y_max = obj_cooking_ui_bg.y + obj_cooking_ui_bg.sprite_height - 100;

//complete cooking global var
global.cooking_done = false;