



draw_set_color(c_white);

var percent_overlapped = round((overlap_time / overlap_time_target) * 100);


draw_text(progress_bar_x, progress_bar_y, string(percent_overlapped) + "%");

//drawing progress bar sprites
draw_sprite_stretched(spr_progbar, 0,progress_bar_x, progress_bar_y, (percent_overlapped*prog_bar_width)/10, prog_bar_height);

//drawing border sprite
draw_sprite(spr_progbar_outside, 0, progress_bar_x, progress_bar_y);