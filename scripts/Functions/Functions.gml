function sin_ext(delta_value, start_value, end_value){
	return start_value + (end_value - start_value) * (sin(delta_value) + 1) / 2;
}

function cos_ext(delta_value, start_value, end_value){
	return start_value + (end_value - start_value) * (cos(delta_value- pi * 0.5) + 1) / 2;
}