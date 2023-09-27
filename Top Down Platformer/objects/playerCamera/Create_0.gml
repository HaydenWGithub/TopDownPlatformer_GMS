/// @description Set up game camera

//A z-axis game needs a custom camera to follow the player when they
//jump, since that jump is not based on the y axis, an ordinary
//camera will not move up.
view_enabled = true;
global.Cameras = undefined;

#macro CameraWidth 400
#macro CameraHeight 2000
#macro CameraScale 8
#macro CameraSpeed 0.1

window_set_fullscreen(true);
z = 10;

var width = CameraWidth, height = CameraHeight, scale = CameraScale;

view_visible[0] = true;
	
global.Cameras[0] = camera_create_view(0, 0, width, height);
camera_set_view_border(global.Cameras[0], width, height);
view_set_camera(0, global.Cameras[0]);
	
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = width;
view_hport[0] = height;
	
//veiwport
window_set_size(width * scale, height * scale);
surface_resize(application_surface, 1920, 1080);
window_set_position(150,100);
display_set_gui_size(width * scale, height * scale);

/*view_enabled = true;
global.Cameras = undefined;

window_set_fullscreen(true);

view_visible[0] = true;

global.Cameras[0] = camera_create_view(0, 0, 640, 360);
camera_set_view_border(global.Cameras[0], 640, 360);

view_wport[0] = 640;
view_hport[0] = 360;*/