

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
