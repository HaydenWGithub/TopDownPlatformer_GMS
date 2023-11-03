/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left)){
	if (mouse_x > x && mouse_x < x + sprite_width){
		show_debug_message("mouse pressed X");
		if (mouse_y < y){
			room_goto(rm_Game);
		}
	}
}