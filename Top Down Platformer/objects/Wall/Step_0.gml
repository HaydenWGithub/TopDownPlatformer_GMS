/// @description Insert description here
// You can write your code in this editor

//move the wall forward
y = y - wallSpeed;
collided = false;




if (distance_to_object(objPlayer) > 220){
	wallSpeed = 3.2;
}
else {
	wallSpeed = 1.5;
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