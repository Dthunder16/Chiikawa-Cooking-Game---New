width = 100;
height = 200;

x_pos = 300;
y_pos = 560;

pos = 0;

op_border = 8;
op_space = 150;

option[0] = "Start Game";
option[1] = "Settings";
option[2] = "Quit Game";

spr_option_normal[0] = spr_playbutton;
spr_option_selected[0] = spr_playbutton_purple;

spr_option_normal[1] = spr_settingsbutton;
spr_option_selected[1] = spr_settings_button_purple;

spr_option_normal[2] = spr_exitbutton;
spr_option_selected[2] = spr_exitbutton_purple;

op_length = array_length(option);

audio_play_sound(bgm_menu,1,1,1);
