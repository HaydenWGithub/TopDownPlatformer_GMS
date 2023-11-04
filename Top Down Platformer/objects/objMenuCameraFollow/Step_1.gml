/// @description Insert description here
// You can write your code in this editor
camera_set_view_pos(view_camera[1], x, y);

objArray = [self, objPlayButton, objTitle]
for (i = 0; i < array_length_1d(objArray); i++) {
	if (instance_exists(objArray[i])) {
	xdiff = camera_get_view_x(view_camera[1]) - objArray[i].x;
	ydiff = camera_get_view_y(view_camera[1]) - objArray[i].y;
	coordinateDifferences = [xdiff, ydiff];
	array_push(coordinates, coordinateDifferences);
	}
}