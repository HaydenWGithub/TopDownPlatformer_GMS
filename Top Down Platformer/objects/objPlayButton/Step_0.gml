/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left)){
	if (room_get_name(room) == room_get_name(rm_menu)){
		if (mouse_x > x && mouse_x < x + sprite_width){
		room_goto(rm_Game);
		}
	}
	
	
	
	
	show_debug_message("Player clicked coordinate in " + string(mouse_x) + ", " + string(mouse_y));
	show_debug_message("actual button coordinate is " + string(x) + ", " + string(y));
	
	if (mouse_x > x && mouse_x < x + sprite_width){
		show_debug_message("mouse pressed X");
		if (mouse_y > y && mouse_y < y + sprite_height){
			room_goto(rm_Game);
		}
	}

}