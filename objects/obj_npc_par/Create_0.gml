text_id = "";
if_interacted = false;

distance_to_npc = 15;

set_voice = 0;
set_textvoice = 0;

recipeHold = ds_list_create();
//likely obj_item_manager Create Event is triggered after obj_npc_par Create
alarm_set(0,10);

