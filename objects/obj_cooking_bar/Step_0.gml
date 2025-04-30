vspeed += gravity;


if (random(1) < 0.09) {
    vspeed += jump_force;
}

// Apply vertical movement
y += vspeed;

//limit max speed
if (vspeed > 2) {
    vspeed = 2;
}


if (y < y_min) {
    y = y_min ;
    vspeed = 0;
}
if (y > y_max) {
    y = y_max ;
    vspeed = 0;
}
