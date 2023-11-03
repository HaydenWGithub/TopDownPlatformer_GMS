/// @description Insert description here
// You can write your code in this editor
if (objPlayer.y > y && objPlayer.y < y + sprite_height && objPlayer.x > x && objPlayer.x < x + sprite_width && objPlayer.z == 0) {
	show_debug_message("bummed");
    objPlayer.isBehind = true;
	// Sets the player depth when behind the driftwood.
} 