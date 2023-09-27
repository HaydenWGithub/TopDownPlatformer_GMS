/// @description Insert description here
// You can write your code in this editor

//move the wall forward
y = y - wallSpeed;
collided = false;


//collide with player
//this is a proprietary collision system that factors in the z axis
//hence why we cant simply use the collision event
if (objPlayer.y + objPlayer.z > y && objPlayer.y + objPlayer.z < y + sprite_height)
{
	collided = true;
	objPlayer.moveSpeed = 0;
	wallSpeed = 0;
}
