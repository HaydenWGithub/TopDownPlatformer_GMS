/// @description Insert description here
// You can write your code in this editor

//move the wall forward
y = y - wallSpeed;
collided = false;

output = (objPlayer.y - y) * -1;
show_debug_message(output);
if ((objPlayer.y - y) * -1 < 70){
	wallSpeed = 1;
}
else if ((objPlayer.y - y) * -1 < 120){
	wallSpeed = 2;
}
else if ((objPlayer.y - y) * -1 < 220){
	wallSpeed = 2.5;
}
else if ((objPlayer.y - y) * -1 < 420){
	wallSpeed = 4;
}

//collide with player
//this is a proprietary collision system that factors in the z axis
//hence why we cant simply use the collision event
if (objPlayer.y + objPlayer.z > y && objPlayer.y + objPlayer.z < y + sprite_height)
{
	collided = true;
	objPlayer.moveSpeed = 0;
	wallSpeed = 0;
	objPlayer.externalSpeedSet = true;
}