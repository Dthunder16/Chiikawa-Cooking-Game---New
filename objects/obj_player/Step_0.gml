image_speed = 0.25;
depth = -bbox_bottom;

//Movement
leftKey = keyboard_check(ord("A"));
rightKey = keyboard_check(ord("D"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));
spaceKey = keyboard_check_pressed(vk_space);

inputDirection = point_direction(0,0,rightKey - leftKey, downKey - upKey);
inputMagnitude = (rightKey - leftKey != 0) || (downKey - upKey != 0);

hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
	
hSpeedCam = hSpeed;
vSpeedCam = vSpeed;

if(!stop_movement){
	//Sprite Change
	var old_sprite = sprite_index;
	image_speed = 0.25;

	if(leftKey){
		image_xscale = -1;
		sprite_index = left_right;
	}
	else if(rightKey){
		image_xscale = 1;
		sprite_index = left_right;
	}
	else if(upKey){
		sprite_index = up;
	}
	else if(downKey){
		sprite_index = down;
	}
	else if(!leftKey && !rightKey && !upKey && !downKey){
		sprite_index = old_sprite;
	
		if(old_sprite == left_right){
			if(image_xscale == -1){
				image_xscale *= -1;
				sprite_index = left_idle;
			}
			else if(image_xscale == 1) {
				sprite_index = right_idle;
			}
		}
		else if(old_sprite == up){
			sprite_index = up_idle;
		}
		else if(old_sprite == down){
			sprite_index = down_idle;
		}
	}
	
	//Movement Code
	if (!place_meeting(x + hSpeed, y, obj_solid)){ 
		x += hSpeed;
		obj_camera.target_x += hSpeedCam;
	}
    
	if (!place_meeting(x, y + vSpeed, obj_solid)){
		y += vSpeed;
		obj_camera.target_y += vSpeedCam;
	}
}


//Walking Particle
if((xprevious != x or yprevious != y) and canDust = true)
{
	canDust = false;
	var randomTime = irandom_range(-1,2);
	alarm_set(3, 8+randomTime);
	
	part_particles_create(obj_particle_setup.particle_system, x, y + (sprite_height/2), obj_particle_setup.particle_dust, 10);
}