/// @description Draw Z Details for Debugging
/*draw_set_font(fntDebugging);

draw_set_alpha(0.8);
draw_rectangle_color(0, 0, 400, 200, c_black, c_black, c_black, c_black, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(16, 10, "Z Axis: " + string(z));
draw_text(16, 60, "Z Floor: " + string(zFloor));
draw_text(16, 100, "Depth: " + string(depth));


var block = instance_place(x, y, objSolid);
if (block) {
	draw_text(16, 110, "Block's Z: " + string(block.z));
}
*/
draw_set_font(fntScore);
draw_set_color(c_yellow);
draw_text(20, 20, "SCORE: " + string(Saved));

